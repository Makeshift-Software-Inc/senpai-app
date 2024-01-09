import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_graphql/fresh_graphql.dart';
import 'package:senpai/core/auth/blocs/resend_verification_code_bloc.dart';
import 'package:senpai/core/auth/blocs/validate_phone_bloc.dart';
import 'package:senpai/core/graphql/blocs/mutation/mutation_bloc.dart';

import 'package:senpai/core/widgets/loading.dart';
import 'package:senpai/data/text_constants.dart';
import 'package:senpai/dependency_injection/injection.dart';
import 'package:senpai/models/auth/auth_model.dart';
import 'package:senpai/models/auth/user_model.dart';
import 'package:senpai/screens/profile/settings_profile/bloc/settings_profile_bloc.dart';
import 'package:senpai/screens/verify_phone/blocs/otp_form_bloc/otp_form_bloc.dart';
import 'package:senpai/screens/verify_phone/widget/verify_phone_content.dart';
import 'package:senpai/utils/constants.dart';
import 'package:senpai/utils/helpers/snack_bar_helpers.dart';
import 'package:senpai/utils/methods/aliases.dart';

@RoutePage()
class SettingsVerifyPhonePage extends StatelessWidget {
  final SettingsProfileBloc settingsBloc;

  const SettingsVerifyPhonePage({
    super.key,
    required this.settingsBloc,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: settingsBloc),
        BlocProvider<OTPFormBloc>(
          create: (context) => OTPFormBloc(),
        ),
        BlocProvider(
          create: (_) => getIt<ResendVerificationCodeBloc>()
            ..resendCodeToPhoneNumber(settingsBloc.phoneNumber.phoneNumber!),
        ),
        BlocProvider(
          create: (_) => getIt<ValidatePhoneBloc>(),
        ),
      ],
      child: Scaffold(
        backgroundColor: $constants.palette.darkBlue,
        body: SafeArea(
          child: Stack(
            children: [
              BlocConsumer<OTPFormBloc, OtpFormState>(
                listener: (context, state) {
                  if (state.isSubmitting) {
                    final serviceBloc =
                        BlocProvider.of<ValidatePhoneBloc>(context);
                    final formBloc = BlocProvider.of<OTPFormBloc>(context);

                    final code = formBloc.state.otpCode;

                    serviceBloc.validateUserAccount(
                        int.parse(code), settingsBloc.user.id);
                  }
                },
                builder: (context, state) {
                  return VerifyPhoneContent(
                    id: settingsBloc.user.id,
                    phone: settingsBloc.phoneNumber.phoneNumber ?? '',
                  );
                },
              ),
              _buildResendVerificationCodeListeners(),
              _buildResendValidatePhoneBlocListeners(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildResendVerificationCodeListeners() {
    return BlocBuilder<ResendVerificationCodeBloc, MutationState>(
      builder: (context, state) {
        return state.maybeWhen<Widget>(
            loading: () => const SenpaiLoading(),
            failed: (error, result) {
              final formBloc = BlocProvider.of<OTPFormBloc>(context);
              formBloc.add(const OtpFormEvent.failed());
              showSnackBarError(context, TextConstants.serverError);
              return const SizedBox.shrink();
            },
            orElse: () => const SizedBox.shrink());
      },
    );
  }

  Widget _buildResendValidatePhoneBlocListeners() {
    return BlocBuilder<ValidatePhoneBloc, MutationState>(
      builder: (context, state) {
        return state.maybeWhen<Widget>(
            loading: () => const SenpaiLoading(),
            failed: (error, result) {
              final formBloc = BlocProvider.of<OTPFormBloc>(context);
              formBloc.add(const OtpFormEvent.failed());
              showSnackBarError(context, TextConstants.serverError);

              return const SizedBox.shrink();
            },
            succeeded: (data, result) {
              final response = result.data;

              if (response == null) {
                // handle this fatal error
                logIt.wtf("A successful empty response just got recorded");
                return const SizedBox.shrink();
              }

              String token = response["validatePhone"]["token"];
              bool hasFilledProfile =
                  response["validatePhone"]["profileFilled"];
              UserModel user =
                  UserModel.fromJson(response["validatePhone"]["user"]);
              final formBloc = BlocProvider.of<OTPFormBloc>(context);
              formBloc.isProfileFilled = hasFilledProfile;

              final storage = getIt<TokenStorage<AuthModel>>();
              storage.write(AuthModel(token: token, user: user));

              settingsBloc.add(OnChangeIsVerifyPhone(isVerifyPhone: true));
              context.router.pop();
              return const SenpaiLoading();
            },
            orElse: () => const SizedBox.shrink());
      },
    );
  }
}
