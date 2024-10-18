import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:otp_pin_field/otp_pin_field.dart';
import 'package:senpai/core/auth/blocs/resend_verification_code_bloc.dart';
import 'package:senpai/core/widgets/icon_button.dart';
import 'package:senpai/core/widgets/icon_rounded_button.dart';
import 'package:senpai/core/widgets/primary_button.dart';
import 'package:senpai/core/widgets/text_button.dart';
import 'package:senpai/data/path_constants.dart';
import 'package:senpai/l10n/resources.dart';
import 'package:senpai/screens/verify_phone/blocs/otp_form_bloc/otp_form_bloc.dart';
import 'package:senpai/utils/constants.dart';
import 'package:senpai/utils/methods/utils.dart';
import 'package:timer_count_down/timer_count_down.dart';

class VerifyPhoneContent extends StatelessWidget {
  const VerifyPhoneContent({super.key, required this.phone, required this.id});

  final String phone;
  final String id;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: $constants.palette.bgLight,
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: $constants.insets.sm),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  height: $constants.insets.xl,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SenpaiIconRoundedButton(
                      onPressed: () {
                        context.router.maybePop();
                      },
                      iconPath: PathConstants.backIcon,
                    )
                  ],
                ),
                SizedBox(
                  height: $constants.insets.sm,
                ),
                SvgPicture.asset(
                  PathConstants.loginIcon,
                  width: getWidthSize(context, 0.15),
                  height: getWidthSize(context, 0.15),
                  fit: BoxFit.contain,
                  alignment: Alignment.center,
                ),
                SizedBox(height: getWidthSize(context, 0.047)),
                Text(
                  "Enter Code Sent\nto Your Phone",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: getWidthSize(context, 0.064),
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: getWidthSize(context, 0.032)),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: TextStyle(
                      color: $constants.palette.grey3,
                      fontWeight: FontWeight.w400,
                      fontSize: getWidthSize(context, 0.037),
                    ),
                    children: [
                      TextSpan(text: "${R.strings.verifyPhoneInstruction} "),
                      TextSpan(
                        text: phone,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: getWidthSize(context, 0.0853)),
                _buildInputField(context),
                SizedBox(
                  height: $constants.insets.lg,
                ),
                _buildResendAction(context),
                SizedBox(
                  height: $constants.insets.lg,
                ),
                // Expanded(
                //   child: Align(
                //     alignment: Alignment.bottomCenter,
                //     child: _buildSubmitButton(context),
                //   ),
                // ),
                // SizedBox(
                //   height: $constants.insets.sm,
                // ),
              ]),
        ),
      ),
    );
  }

  Widget _buildInputField(BuildContext context) {
    final bloc = BlocProvider.of<OTPFormBloc>(context);
    return BlocBuilder<OTPFormBloc, OtpFormState>(
      buildWhen: (prevState, currState) =>
          currState.isError != prevState.isError,
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            OtpPinField(
              autoFillEnable: false,
              textInputAction: TextInputAction.done,
              fieldWidth:
                  (getSize(context).width - (7 * $constants.insets.sm)) / 6,
              onSubmit: (text) {
                bloc.add(const OtpFormEvent.submit());
              },
              onChange: (text) {
                bloc.add(OtpFormEvent.codeChanged(text));
              },

              /// to decorate your Otp_Pin_Field
              otpPinFieldStyle: OtpPinFieldStyle(
                /// border color for inactive/unfocused Otp_Pin_Field
                activeFieldBorderColor: Colors.transparent,
                defaultFieldBorderColor: Colors.transparent,

                activeFieldBoxShadow: [
                  BoxShadow(
                    color: state.isError
                        ? $constants.palette.red.withOpacity(0.5)
                        : Colors.white.withOpacity(0.6),
                    blurRadius: 6,
                    offset: const Offset(0, 0),
                  ),
                ],
                defaultFieldBoxShadow: [
                  if (state.isError)
                    BoxShadow(
                      color: $constants.palette.red.withOpacity(0.5),
                      blurRadius: 6,
                      offset: const Offset(0, 0),
                    )
                ],

                activeFieldBackgroundColor: $constants.palette.bgInput,
                filledFieldBackgroundColor: $constants.palette.bgInput,
                defaultFieldBackgroundColor: $constants.palette.bgInput,

                textStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: getWidthSize(context, 0.053),
                ),
                fieldBorderRadius: getWidthSize(context, 0.032),
              ),
              maxLength: 6,

              /// no of pin field
              showCursor: true,
              showDefaultKeyboard: true,
              cursorColor: $constants.palette.pink,

              /// to select cursor width
              mainAxisAlignment: MainAxisAlignment.start,
              otpPinFieldDecoration: OtpPinFieldDecoration.custom,
            ),
            SizedBox(
              height: getWidthSize(context, 0.042),
            ),
            _createError(context, state.isError),
          ],
        );
      },
    );
  }

  Widget _createError(BuildContext context, bool isError) {
    return Container(
      padding: const EdgeInsets.only(bottom: 2),
      child: Text(
        isError ? R.strings.invalidCodeError : '',
        style: TextStyle(
          color: $constants.palette.buttonBackground,
          fontWeight: FontWeight.w500,
          fontSize: getWidthSize(context, 0.032),
        ),
      ),
    );
  }

  Widget _buildResendAction(BuildContext context) {
    final bloc = BlocProvider.of<OTPFormBloc>(context);
    final serviceBloc = BlocProvider.of<ResendVerificationCodeBloc>(context);
    return BlocBuilder<OTPFormBloc, OtpFormState>(
      buildWhen: (prevState, currState) =>
          currState.isResendButtonActive != prevState.isResendButtonActive,
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (!state.isResendButtonActive)
              Countdown(
                // controller: _controller,
                seconds: 10,
                build: (_, double time) {
                  final int totalSeconds = time.ceil();
                  final int minutes = (totalSeconds ~/ 60) % 60;
                  final int seconds = totalSeconds % 60;
                  final formattedTime =
                      'Resend code in 0$minutes:${seconds.toString().padLeft(2, '0')}';

                  return Text(
                    formattedTime,
                    style: TextStyle(
                      color: $constants.palette.grey5,
                      fontWeight: FontWeight.w500,
                      fontSize: getWidthSize(context, 0.037),
                    ),
                  );
                },
                interval: const Duration(milliseconds: 100),
                onFinished: () {
                  bloc.add(const OtpFormEvent.activateResend());
                },
              ),
            if (state.isResendButtonActive)
              Text(
                "Code not received? ",
                style: TextStyle(
                  color: $constants.palette.grey5,
                  fontWeight: FontWeight.w500,
                  fontSize: getWidthSize(context, 0.037),
                ),
              ),
            if (state.isResendButtonActive)
              SenpaiTextButton(
                text: "Resend",
                onPressed: () {
                  bloc.add(const OtpFormEvent.resend());
                  serviceBloc.resendCodeToPhoneNumber(phone);
                },
                enabled: state.isResendButtonActive,
              )
          ],
        );
      },
    );
  }

  Widget _buildSubmitButton(BuildContext context) {
    final bloc = BlocProvider.of<OTPFormBloc>(context);
    return PrimaryButton(
        text: R.strings.continueText,
        onPressed: () {
          bloc.add(const OtpFormEvent.submit());
        });
  }
}
