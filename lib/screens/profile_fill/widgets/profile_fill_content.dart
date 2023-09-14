import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:senpai/screens/profile_fill/biography/page/biography_page.dart';
import 'package:senpai/screens/profile_fill/birthday/page/birthday_page.dart';
import 'package:senpai/screens/profile_fill/bloc/profile_fill_bloc.dart';
import 'package:senpai/screens/profile_fill/desired_gender/page/desired_gender_page.dart';
import 'package:senpai/screens/profile_fill/first_name/page/first_name_page.dart';
import 'package:senpai/screens/profile_fill/occupation/page/occupation_page.dart';
import 'package:senpai/screens/profile_fill/user_gender/page/gender_page.dart';
import 'package:senpai/screens/profile_fill/widgets/progress_line_widget.dart';
import 'package:senpai/utils/constants.dart';

import 'welcome_senpai_content.dart';

class ProfileFillContent extends StatelessWidget {
  const ProfileFillContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileFillBloc, ProfileFillState>(
      builder: (context, state) {
        return SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: $constants.insets.sm,
              ),
              _buildProgressLine(context),
              Expanded(
                child: _buildProfileFillContent(
                  context,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildProfileFillContent(BuildContext context) {
    final bloc = BlocProvider.of<ProfileFillBloc>(context);

    if (bloc.step == ProfileFillStep.welcome) {
      return const WelcomeSenpaiContent();
    } else if (bloc.step == ProfileFillStep.firstName) {
      return FirstNamePage(firstName: bloc.user.firstName);
    } else if (bloc.step == ProfileFillStep.birthday) {
      return BirthdayPage(birthday: bloc.user.birthday);
    } else if (bloc.step == ProfileFillStep.gender) {
      return UserGenderPage(gender: bloc.user.gender);
    } else if (bloc.step == ProfileFillStep.desiredGender) {
      return DesiredGenderPage(gender: bloc.user.desiredGender);
    } else if (bloc.step == ProfileFillStep.occupation) {
      return OccupationPage(
        school: bloc.user.school,
        occupation: bloc.user.occupation,
      );
    } else if (bloc.step == ProfileFillStep.biography) {
      return BiographyPage(bio: bloc.user.bio);
    } else {
      return const WelcomeSenpaiContent();
    }
  }

  Widget _buildProgressLine(BuildContext context) {
    final bloc = BlocProvider.of<ProfileFillBloc>(context);
    return ProgressLineWidget(progressIndex: bloc.step.index);
  }
}
