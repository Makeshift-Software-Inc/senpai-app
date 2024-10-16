import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:senpai/core/auth/blocs/resend_verification_code_bloc.dart';
import 'package:senpai/core/widgets/icon_rounded_button.dart';
import 'package:senpai/core/widgets/phone_input.dart';
import 'package:senpai/core/widgets/primary_button.dart';
import 'package:senpai/data/path_constants.dart';
import 'package:senpai/l10n/resources.dart';
import 'package:senpai/core/auth/blocs/create_user_bloc.dart';
import 'package:senpai/routes/app_router.dart';
import 'package:senpai/screens/signup/bloc/sign_up_form/sign_up_form_bloc.dart';
import 'package:senpai/utils/constants.dart';
import 'package:senpai/utils/methods/utils.dart';

class SignupContent extends StatefulWidget {
  const SignupContent({super.key});

  @override
  State<SignupContent> createState() => _SignupContentState();
}

class _SignupContentState extends State<SignupContent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: $constants.palette.bgLight,
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: $constants.insets.sm),
          child: Stack(
            children: [
              SingleChildScrollView(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SenpaiIconRoundedButton(
                        onPressed: () {
                          FocusScope.of(context).unfocus();
                          context.router.maybePop();
                        },
                        iconPath: PathConstants.backIcon,
                      )
                    ],
                  ),
                  SizedBox(
                    height: $constants.insets.md,
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
                    "Login or\nsign up today",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: getWidthSize(context, 0.064),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: getWidthSize(context, 0.032)),
                  Text(
                    "Join the ultimate social platform for anime fans",
                    style: TextStyle(
                      color: $constants.palette.grey3,
                      fontWeight: FontWeight.w400,
                      fontSize: getWidthSize(context, 0.037),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: getWidthSize(context, 0.085)),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Phone number",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: getWidthSize(context, 0.037),
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  _buildTextInput(context),
                  SizedBox(height: getWidthSize(context, 0.0427)),
                  _buildTermsAndConditions(context),
                  SizedBox(
                    height: $constants.insets.lg,
                  ),
                ],
              )),
              Container(
                margin: EdgeInsets.only(bottom: $constants.insets.sm),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      KeyboardVisibilityBuilder(
                          builder: (context, isKeyboardVisible) {
                        return isKeyboardVisible
                            ? const SizedBox()
                            : _buildEntryText(context);
                      }),
                      SizedBox(height: getWidthSize(context, 0.064)),
                      _buildSubmitButton(context),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTermsAndConditions(BuildContext context) {
    final bloc = BlocProvider.of<SignUpFormBloc>(context);
    return BlocBuilder<SignUpFormBloc, SignUpFormState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 24,
              height: 24,
              child: Checkbox(
                checkColor: $constants.palette.white,
                fillColor: WidgetStateProperty.resolveWith(getCheckBoxColor),
                value: bloc.isAccepted,
                onChanged: bloc.onTermsAndConditionsTapped,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    getWidthSize(context, 0.011),
                  ), // Set your desired border radius here
                ),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  bloc.onTermsAndConditionsTapped(!bloc.isAccepted);
                },
                child: Text(
                  "I agree to receive verification texts from Senpai. Reply STOP to opt-out.",
                  style: TextStyle(
                    color: $constants.palette.grey4,
                    fontWeight: FontWeight.w400,
                    fontSize: getWidthSize(context, 0.032),
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            )
          ],
        );
      },
    );
  }

  Widget _buildEntryText(BuildContext context) {
    return RichText(
      textAlign: TextAlign.left,
      text: TextSpan(
        style: getTextTheme(context).labelMedium?.copyWith(
              color: $constants.palette.white,
            ),
        children: [
          TextSpan(
            text: "By tapping ",
            style: TextStyle(
              color: $constants.palette.grey4,
              fontWeight: FontWeight.w400,
              fontSize: getWidthSize(context, 0.032),
            ),
          ),
          TextSpan(
            text: "Signup ",
            style: TextStyle(
              color: $constants.palette.grey4,
              fontWeight: FontWeight.w700,
              fontSize: getWidthSize(context, 0.032),
            ),
          ),
          TextSpan(
            text: "or ",
            style: TextStyle(
              color: $constants.palette.grey4,
              fontWeight: FontWeight.w400,
              fontSize: getWidthSize(context, 0.032),
            ),
          ),
          TextSpan(
            text: "Login, ",
            style: TextStyle(
              color: $constants.palette.grey4,
              fontWeight: FontWeight.w700,
              fontSize: getWidthSize(context, 0.032),
            ),
          ),
          TextSpan(
            text: "you agree to our ",
            style: TextStyle(
              color: $constants.palette.grey4,
              fontWeight: FontWeight.w400,
              fontSize: getWidthSize(context, 0.032),
            ),
          ),
          TextSpan(
            text: R.strings.entryActionText1,
            style: TextStyle(
              color: $constants.palette.grey4,
              fontWeight: FontWeight.w400,
              fontSize: getWidthSize(context, 0.032),
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                context.router.push(SenpaiLicenseRoute(mdFileName: "tos.md"));
              },
          ),
          TextSpan(
            text: R.strings.entrySpanText2,
            style: TextStyle(
              color: $constants.palette.grey4,
              fontWeight: FontWeight.w400,
              fontSize: getWidthSize(context, 0.032),
            ),
          ),
          TextSpan(
            text: R.strings.entryActionText2,
            style: TextStyle(
              color: $constants.palette.grey4,
              fontWeight: FontWeight.w400,
              fontSize: getWidthSize(context, 0.032),
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                context.router
                    .push(SenpaiLicenseRoute(mdFileName: "privacy_policy.md"));
              },
          ),
          TextSpan(
            text: R.strings.entrySpanText3,
            style: TextStyle(
              color: $constants.palette.grey4,
              fontWeight: FontWeight.w400,
              fontSize: getWidthSize(context, 0.032),
            ),
          ),
          TextSpan(
            text: R.strings.entryActionText3,
            style: TextStyle(
              color: $constants.palette.grey4,
              fontWeight: FontWeight.w400,
              fontSize: getWidthSize(context, 0.032),
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                context.router
                    .push(SenpaiLicenseRoute(mdFileName: "cookie_policy.md"));
              },
          ),
          TextSpan(
            text: '.',
            style: TextStyle(
              color: $constants.palette.grey4,
              fontWeight: FontWeight.w400,
              fontSize: getWidthSize(context, 0.032),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSubmitButton(BuildContext context) {
    final formBloc = BlocProvider.of<SignUpFormBloc>(context);
    final serviceBloc = BlocProvider.of<CreateUserBloc>(context);
    final existingUserServiceBloc =
        BlocProvider.of<ResendVerificationCodeBloc>(context);

    return BlocBuilder<SignUpFormBloc, SignUpFormState>(
      builder: (context, state) {
        return PrimaryButton(
          text: R.strings.nextText,
          backgroundColor: $constants.palette.buttonBackground,
          onPressed: () {
            if (!formBloc.isAccepted) {
              return;
            }
            if (isValidPhoneNumber(formBloc.phoneController.text)) {
              // final String formattedPhone = formBloc.phoneNumber.phoneNumber!;
              // if (isExistingUser) {
              //   existingUserServiceBloc.resendCodeToPhoneNumber(formattedPhone);
              // } else {
              //   serviceBloc.createUserWithPhoneNumber(formattedPhone);
              // }
            }
          },
        );
      },
    );
  }

  Widget _buildTextInput(BuildContext context) {
    final bloc = BlocProvider.of<SignUpFormBloc>(context);
    return BlocBuilder<SignUpFormBloc, SignUpFormState>(
      buildWhen: (_, currState) => currState is ErrorState,
      builder: (context, state) {
        return SenpaiPhoneInput(
          placeholder: 'enter your phone number',
          controller: bloc.phoneController,
          onTextChanged: (PhoneNumber phoneNumber) {
            bloc.add(OnTextChangedEvent(phoneNumber: phoneNumber));
          },
          errorText: R.strings.invalidPhoneError,
          isError: state is ErrorState ? state.isEnabled : false,
          isValid: state is ValidState
              ? true
              : isValidPhoneNumber(bloc.phoneController.text),
        );
      },
    );
  }
}
