import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_dio/fresh_dio.dart';
import 'package:senpai/core/graphql/blocs/mutation/mutation_bloc.dart';
import 'package:senpai/core/user/blocs/update_user/update_user_bloc.dart';

import 'package:senpai/core/widgets/loading.dart';
import 'package:senpai/dependency_injection/injection.dart';
import 'package:senpai/l10n/resources.dart';
import 'package:senpai/models/auth/auth_model.dart';
import 'package:senpai/routes/app_router.dart';
import 'package:senpai/screens/profile_fill/email/bloc/email_bloc.dart';
import 'package:senpai/screens/profile_fill/email/widgets/email_content.dart';
import 'package:senpai/utils/helpers/snack_bar_helpers.dart';
import 'package:senpai/utils/methods/aliases.dart';

class EmailPage extends StatelessWidget {
  final String? email;

  const EmailPage({super.key, this.email});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<EmailBloc>(
          create: (context) => EmailBloc()
            ..add(
              OnEmailInitEvent(
                email: email ?? '',
              ),
            ),
        ),
        BlocProvider(
          create: (_) => getIt<UpdateUserBloc>(),
        ),
      ],
      child: Stack(
        children: [
          const EmailContent(),
          _buildUpdateUserListeners(),
        ],
      ),
    );
  }

  Widget _buildUpdateUserListeners() {
    return BlocListener<UpdateUserBloc, MutationState>(
      listener: (context, state) {
        state.whenOrNull(
          failed: (error, result) {
            showSnackBarError(context, R.strings.serverError);
          },
          succeeded: (data, result) {
            final response = result.data;
            if (response == null) {
              logIt.wtf("A successful empty response just got set user");
              return;
            }
            dynamic model;
            try {
              model = response["updateUser"]["user"];

              WidgetsBinding.instance.addPostFrameCallback((_) async {
                final storage = getIt<TokenStorage<AuthModel>>();
                await storage.read().then((authModel) {
                  if (authModel != null) {
                    storage.write(
                      AuthModel(
                        token: authModel.token,
                        user: authModel.user,
                        // isProfileFilled: true,
                      ),
                    );
                    if (context.mounted) {
                      context.router.replaceAll([HomeRoute()]);
                    }
                  }
                });
              });
            } catch (e) {
              logIt.error(
                  "Error accessing updateUser or user from response: $e");
              model = null;
            }
            if (model == null) {
              showSnackBarError(context, R.strings.nullUser);
              logIt.error("A user with error");
            }
          },
        );
      },
      child: BlocBuilder<UpdateUserBloc, MutationState>(
        builder: (context, state) {
          return state.maybeWhen<Widget>(
            loading: () => const SenpaiLoading(),
            orElse: () => const SizedBox.shrink(),
          );
        },
      ),
    );
  }
}
