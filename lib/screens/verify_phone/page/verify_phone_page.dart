import 'package:auto_route/auto_route.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:senpai/core/auth/blocs/resend_verification_code_bloc.dart';
import 'package:senpai/core/auth/blocs/sign_in_bloc.dart';
import 'package:senpai/core/auth/blocs/validate_phone_bloc.dart';
import 'package:senpai/core/graphql/blocs/mutation/mutation_bloc.dart';
import 'package:senpai/core/widgets/loading.dart';
import 'package:senpai/data/text_constants.dart';
import 'package:senpai/dependency_injection/injection.dart';
import 'package:senpai/screens/verify_phone/blocs/otp_form_bloc/otp_form_bloc.dart';
import 'package:senpai/screens/verify_phone/widget/verify_phone_content.dart';
import 'package:senpai/utils/methods/aliases.dart';

@RoutePage()
class VerifyPhonePage extends StatelessWidget {
  const VerifyPhonePage({super.key, required this.phone, required this.id});

  final String phone;
  final String id;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<OTPFormBloc>(
          create: (context) => OTPFormBloc(),
        ),
        BlocProvider(
          create: (_) => getIt<ResendVerificationCodeBloc>(),
        ),
        BlocProvider(
          create: (_) => getIt<ValidatePhoneBloc>(),
        ),
        BlocProvider(
          create: (_) => getIt<SignInBloc>(),
        ),
      ],
      child: Scaffold(
        body: Stack(
          children: [
            BlocConsumer<OTPFormBloc, OtpFormState>(
              listener: (context, state) {
                if (state.isSubmitting) {
                  final serviceBloc =
                      BlocProvider.of<ValidatePhoneBloc>(context);
                  final formBloc = BlocProvider.of<OTPFormBloc>(context);

                  final code = formBloc.state.otpCode;

                  serviceBloc.validateUserAccount(int.parse(code), id);
                }
              },
              builder: (context, state) {
                return VerifyPhoneContent(
                  phone: phone,
                  id: id,
                );
              },
            ),
            BlocBuilder<ValidatePhoneBloc, MutationState>(
              builder: (context, state) {
                return state.maybeWhen<Widget>(
                    loading: () => const SenpaiLoading(),
                    failed: (error, result) {
                      final formBloc = BlocProvider.of<OTPFormBloc>(context);
                      formBloc.add(const OtpFormEvent.failed());
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
                                  message: TextConstants.serverError,

                                  /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                                  contentType: ContentType.failure,
                                ),
                              ),
                            );
                        },
                      );

                      return const SizedBox.shrink();
                    },
                    succeeded: (data, result) {
                      final response = result.data;

                      if (response == null) {
                        // handle this fatal error
                        logIt.wtf(
                            "A successful empty response just got recorded");
                        return const SizedBox.shrink();
                      }

                      String token = response["validatePhone"]["token"];
                      final serviceBloc = BlocProvider.of<SignInBloc>(context);
                      serviceBloc.signInExistingUser(token);
                      return const SenpaiLoading();
                    },
                    orElse: () => const SizedBox.shrink());
              },
            ),
            BlocBuilder<ResendVerificationCodeBloc, MutationState>(
              builder: (context, state) {
                return state.maybeWhen<Widget>(
                    loading: () => const SenpaiLoading(),
                    failed: (error, result) {
                      final formBloc = BlocProvider.of<OTPFormBloc>(context);
                      formBloc.add(const OtpFormEvent.failed());
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
                                  message: TextConstants.serverError,

                                  /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                                  contentType: ContentType.failure,
                                ),
                              ),
                            );
                        },
                      );

                      return const SizedBox.shrink();
                    },
                    orElse: () => const SizedBox.shrink());
              },
            ),
            BlocBuilder<SignInBloc, MutationState>(
              builder: (context, state) {
                return state.maybeWhen<Widget>(
                    loading: () => const SenpaiLoading(),
                    failed: (error, result) {
                      final formBloc = BlocProvider.of<OTPFormBloc>(context);
                      formBloc.add(const OtpFormEvent.failed());
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
                                  message: TextConstants.serverError,

                                  /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                                  contentType: ContentType.failure,
                                ),
                              ),
                            );
                        },
                      );

                      return const SizedBox.shrink();
                    },
                    succeeded: (data, result) {
                      final response = result.data;

                      if (response == null) {
                        // handle this fatal error
                        logIt.wtf(
                            "A successful empty response just got recorded");
                        return const SizedBox.shrink();
                      }

                      String id = response["signIn"]["user"]["id"];
                      String phone = response["signIn"]["user"]["phone"];
                      print("signed in user of id $id and phone $phone");

                      context.router.pushNamed("/profile_fill");

                      return const SizedBox.shrink();
                    },
                    orElse: () => const SizedBox.shrink());
              },
            )
          ],
        ),
      ),
    );
  }
}
