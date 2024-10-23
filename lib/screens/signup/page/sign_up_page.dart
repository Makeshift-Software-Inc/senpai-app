import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:fresh_dio/fresh_dio.dart';
import 'package:senpai/core/auth/blocs/resend_verification_code_bloc.dart';
import 'package:senpai/core/auth/blocs/sign_in_bloc.dart';
import 'package:senpai/core/graphql/blocs/mutation/mutation_bloc.dart';
import 'package:senpai/core/widgets/loading.dart';
import 'package:senpai/dependency_injection/injection.dart';
import 'package:senpai/l10n/resources.dart';
import 'package:senpai/models/auth/auth_model.dart';
import 'package:senpai/routes/app_router.dart';
import 'package:senpai/core/auth/blocs/create_user_bloc.dart';
import 'package:senpai/screens/entry/bloc/entry_bloc.dart';
import 'package:senpai/screens/signup/bloc/sign_up_form/sign_up_form_bloc.dart';
import 'package:senpai/screens/signup/widgets/sign_up_content.dart';
import 'package:senpai/utils/methods/aliases.dart';
import 'package:senpai/utils/methods/utils.dart';

@RoutePage()
class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  void _checkAndSignIn(SignInBloc bloc, BuildContext context) async {
    final storage = getIt<TokenStorage<AuthModel>>();
    await storage.read().then((authModel) {
      if (authModel != null) {
        // if (authModel.isProfileFilled == true) {
        //   // Assuming this method exists in your SignInBloc
        //   bloc.signInExistingUser(authModel.token);
        // } else {//
        if (context.mounted) {
          context.router.push(ProfileFillRoute(
            id: authModel.user.id,
            phone: authModel.user.phone,
          ));
        }
        // }
      }
    });
  }

  Widget _buildListeners(BuildContext context) {
    return BlocBuilder<SignInBloc, MutationState>(
      builder: (context, state) {
        return state.maybeWhen<Widget>(
          initial: () {
            final signInBloc = BlocProvider.of<SignInBloc>(context);
            _checkAndSignIn(signInBloc, context);
            return const SizedBox.shrink();
          },
          loading: () => const SenpaiLoading(),
          succeeded: (data, result) {
            final signInBloc = BlocProvider.of<SignInBloc>(context);
            final bool isSignedIn =
                signInBloc.signInUser(context.router, result.data);
            if (isSignedIn) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                context.router.replaceAll([HomeRoute()]);
                //video chat
                //context.router.replaceAll([UnityViewVideoChatRoute()]);
                //avatar test
                // context.router.replaceAll([UnityViewRoute()]);
              });
            }
            return const SizedBox.shrink();
          },
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CreateUserBloc>(
          create: (_) => getIt<CreateUserBloc>(),
        ),
        BlocProvider(
          create: (_) => getIt<ResendVerificationCodeBloc>(),
        ),
        BlocProvider<SignUpFormBloc>(
          create: (_) => getIt<SignUpFormBloc>(),
        ),
        BlocProvider<SignInBloc>(create: (_) => getIt<SignInBloc>()),
        BlocProvider<EntryBloc>(
          create: (context) =>
              EntryBloc()..add(OnChangeStatusAppTrackingEvent()),
        ),
      ],
      child: Scaffold(
        body: Stack(
          children: [
            const SignupContent(),
            _buildCreateUserListeners(),
            _buildSignInListeners(),
            _buildListeners(context),
          ],
        ),
      ),
    );
  }

  Widget _buildCreateUserListeners() {
    return Builder(builder: (context) {
      final formBloc = BlocProvider.of<SignUpFormBloc>(context);
      final existingUserServiceBloc =
          BlocProvider.of<ResendVerificationCodeBloc>(context);

      return BlocListener<CreateUserBloc, MutationState>(
        listener: (context, state) {
          state.whenOrNull(
            failed: (error, result) async {
              print(error);
              final phoneAlreadyTakenError = error.graphqlErrors.any(
                (e) => e.message == 'Phone has already been taken',
              );

              if (phoneAlreadyTakenError) {
                if (isValidPhoneNumber(formBloc.phoneController.text)) {
                  final String formattedPhone =
                      formBloc.phoneNumber.phoneNumber!;
                  await existingUserServiceBloc
                      .resendCodeToPhoneNumber(formattedPhone);
                }
                return;
              }

              if (error.graphqlErrors.isNotEmpty) {
                _showSnackBarError(
                  context,
                  R.strings.alreadyHasAccount,
                  isWarning: true,
                );
              } else {
                _showSnackBarError(context, R.strings.serverError);
              }
            },
            succeeded: (data, result) {
              final response = result.data;
              if (response == null) {
                logIt.wtf("A successful empty response just got recorded");
                return;
              }
              dynamic model;
              try {
                model = response["createUser"]["user"];
                if (model != null) {
                  String phone = model["phone"];
                  String id = model["id"];
                  context.router.push(VerifyPhoneRoute(phone: phone, id: id));
                }
              } catch (e) {
                logIt.error(
                    "Error accessing createUser or user from response: $e");
                model = null;
              }
              if (model == null) {
                _showSnackBarError(context, R.strings.nullUser);
                logIt.error("A user with error");
              }
            },
          );
        },
        child: BlocBuilder<CreateUserBloc, MutationState>(
          builder: (context, state) {
            return state.maybeWhen<Widget>(
              loading: () => const SenpaiLoading(),
              orElse: () => const SizedBox.shrink(),
            );
          },
        ),
      );
    });
  }

  Widget _buildSignInListeners() {
    return BlocListener<ResendVerificationCodeBloc, MutationState>(
      listener: (context, state) {
        state.whenOrNull(
          failed: (error, result) {
            print(error);
            if (error.graphqlErrors.isNotEmpty) {
              _showSnackBarError(
                context,
                R.strings.noAccountWithThisNumber,
                isWarning: true,
              );
            } else {
              _showSnackBarError(context, R.strings.serverError);
            }
          },
          succeeded: (data, result) {
            final response = result.data;
            if (response == null) {
              logIt.wtf("A successful empty response just got recorded");
              return;
            }
            dynamic model;
            try {
              model = response["resendVerifyText"]["user"];
              if (model != null) {
                String phone = model["phone"];
                String id = model["id"];
                context.router.push(VerifyPhoneRoute(phone: phone, id: id));
              }
            } catch (e) {
              logIt.error(
                  "Error accessing resendVerifyText or user from response: $e");
              model = null;
            }
            if (model == null) {
              _showSnackBarError(context, R.strings.nullUser);
              logIt.error("A user without an account just tried to sign in");
            }
          },
        );
      },
      child: BlocBuilder<ResendVerificationCodeBloc, MutationState>(
        builder: (context, state) {
          return state.maybeWhen<Widget>(
            loading: () => const SenpaiLoading(),
            orElse: () => const SizedBox.shrink(),
          );
        },
      ),
    );
  }

  _showSnackBarError(
    BuildContext context,
    String message, {
    bool isWarning = false,
  }) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            SnackBar(
              /// need to set following properties for best effect of awesome_snackbar_content
              elevation: 0,
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.transparent,
              content: AwesomeSnackbarContent(
                title: 'On Snap!',
                message: message,

                /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                contentType:
                    isWarning ? ContentType.warning : ContentType.failure,
              ),
            ),
          );
      },
    );
  }
}
