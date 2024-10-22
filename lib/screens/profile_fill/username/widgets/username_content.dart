import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:senpai/core/widgets/icon_rounded_button.dart';

import 'package:senpai/core/widgets/primary_button.dart';
import 'package:senpai/core/widgets/senpai_input.dart';
import 'package:senpai/data/path_constants.dart';
import 'package:senpai/l10n/resources.dart';
import 'package:senpai/screens/profile_fill/bloc/profile_fill_bloc.dart';
import 'package:senpai/screens/profile_fill/username/bloc/username_bloc.dart';
import 'package:senpai/utils/constants.dart';
import 'package:senpai/utils/methods/utils.dart';

class UsernameContent extends StatelessWidget {
  const UsernameContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: $constants.insets.sm),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
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
                    "Forge Your Legendary\nUsername",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: getWidthSize(context, 0.064),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: getWidthSize(context, 0.032)),
                  Text(
                    "Claim your identity and start your epic journey",
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
                      "Username",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: getWidthSize(context, 0.037),
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  SizedBox(height: getWidthSize(context, 0.022)),
                  _buildUsernameInput(context),
                  SizedBox(height: getWidthSize(context, 0.042)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Full name",
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
                  SizedBox(height: getWidthSize(context, 0.022)),
                  _buildFullNameInput(context),
                ],
              ),
            ),
          ),
          SizedBox(
            height: $constants.insets.sm,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: _buildSubmitButton(context),
          ),
          SizedBox(
            height: $constants.insets.sm,
          ),
        ],
      ),
    );
  }

  Widget _buildUsernameInput(BuildContext context) {
    final bloc = BlocProvider.of<UsernameBloc>(context);
    return BlocBuilder<UsernameBloc, UsernameState>(
      builder: (context, state) {
        return SenpaiInput(
          placeholder: "create your username",
          controller: bloc.usernameController,
          onTextChanged: (String username) {
            bloc.add(OnUsernameChangedEvent(username: username));
          },
          errorText: R.strings.serverError,
          isError: state is ErrorState ? state.isEnabled : false,
          isValid: state is ValidState
              ? true
              : bloc.usernameController.text.isNotEmpty,
        );
      },
    );
  }

  Widget _buildFullNameInput(BuildContext context) {
    final bloc = BlocProvider.of<UsernameBloc>(context);
    return BlocBuilder<UsernameBloc, UsernameState>(
      builder: (context, state) {
        return SenpaiInput(
          placeholder: "enter your full name",
          controller: bloc.fullNameController,
          onTextChanged: (String fullName) {
            bloc.add(OnUsernameChangedEvent(fullName: fullName));
          },
          errorText: R.strings.serverError,
          isError: state is ErrorState ? state.isEnabled : false,
          isValid: state is ValidState
              ? true
              : bloc.fullNameController.text.isNotEmpty,
        );
      },
    );
  }

  Widget _buildSubmitButton(BuildContext context) {
    final bloc = BlocProvider.of<UsernameBloc>(context);
    final blocProfileFill = BlocProvider.of<ProfileFillBloc>(context);

    return BlocListener<UsernameBloc, UsernameState>(
      listenWhen: (_, currState) => currState is UsernameSuccessfulState,
      listener: (context, state) {
        blocProfileFill.add(OnUsernameSaveEvent(
            username: bloc.username, fullName: bloc.fullName));
      },
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
