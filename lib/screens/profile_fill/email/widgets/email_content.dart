import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:senpai/core/user/blocs/update_user/update_user_bloc.dart';
import 'package:senpai/core/widgets/icon_rounded_button.dart';

import 'package:senpai/core/widgets/primary_button.dart';
import 'package:senpai/core/widgets/senpai_input.dart';
import 'package:senpai/data/path_constants.dart';
import 'package:senpai/l10n/resources.dart';
import 'package:senpai/screens/profile_fill/bloc/profile_fill_bloc.dart';
import 'package:senpai/screens/profile_fill/email/bloc/email_bloc.dart';
import 'package:senpai/utils/constants.dart';
import 'package:senpai/utils/methods/utils.dart';

class EmailContent extends StatelessWidget {
  const EmailContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(width: $constants.insets.sm),
                    SenpaiIconRoundedButton(
                      onPressed: () {
                        final bloc = BlocProvider.of<ProfileFillBloc>(context);
                        bloc.add(
                          OnChangeStepEvent(
                            step: ProfileFillStep.userName,
                          ),
                        );
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
                  "Add Your Email\nto Get Out Updates",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: getWidthSize(context, 0.064),
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: getWidthSize(context, 0.032)),
                Text(
                  "Get various updates from us\njust for you anime lovers",
                  style: TextStyle(
                    color: $constants.palette.grey3,
                    fontWeight: FontWeight.w400,
                    fontSize: getWidthSize(context, 0.037),
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: getWidthSize(context, 0.085)),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: $constants.insets.sm),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Email",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: getWidthSize(context, 0.037),
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        "Optional",
                        style: TextStyle(
                          color: $constants.palette.grey4,
                          fontWeight: FontWeight.w400,
                          fontSize: getWidthSize(context, 0.032),
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: getWidthSize(context, 0.022)),
                _buildEmailInput(context),
                SizedBox(height: getWidthSize(context, 0.042)),
              ],
            ),
          ),
        ),
        SizedBox(
          height: $constants.insets.sm,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: $constants.insets.sm),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: _buildSubmitButton(context),
          ),
        ),
        SizedBox(
          height: $constants.insets.sm,
        ),
      ],
    );
  }

  Widget _buildEmailInput(BuildContext context) {
    final bloc = BlocProvider.of<EmailBloc>(context);
    return BlocBuilder<EmailBloc, EmailState>(
      builder: (context, state) {
        return SenpaiInput(
          placeholder: "enter your email",
          controller: bloc.emailController,
          onTextChanged: (String email) {
            bloc.add(OnEmailChangedEvent(email: email));
          },
          errorText: R.strings.serverError,
          isError: state is ErrorState ? state.isEnabled : false,
          isValid:
              state is ValidState ? true : bloc.emailController.text.isNotEmpty,
        );
      },
    );
  }

  Widget _buildSubmitButton(BuildContext context) {
    final bloc = BlocProvider.of<EmailBloc>(context);
    final blocProfileFill = BlocProvider.of<ProfileFillBloc>(context);

    return MultiBlocListener(
      listeners: [
        BlocListener<EmailBloc, EmailState>(
          listenWhen: (_, currState) => currState is EmailSuccessfulState,
          listener: (context, state) {
            blocProfileFill.add(OnEmailSaveEvent(email: bloc.email));
          },
        ),
        BlocListener<ProfileFillBloc, ProfileFillState>(
          listenWhen: (_, currState) => currState is ProfileFillingDoneState,
          listener: (context, state) {
            if (state is ProfileFillingDoneState) {
              final serverBloc = BlocProvider.of<UpdateUserBloc>(context);
              serverBloc.updateUserInfo(user: state.user);
            }
          },
        )
      ],
      child: PrimaryButton(
        text: R.strings.nextText,
        backgroundColor: $constants.palette.buttonBackground,
        onPressed: () async {
          bloc.add(NextTappedEvent());
        },
      ),
    );
  }
}
