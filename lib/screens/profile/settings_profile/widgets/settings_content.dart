import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:senpai/core/application_locale/blocs/application_locale_bloc.dart';
import 'package:senpai/core/user/blocs/update_user/update_user_bloc.dart';
import 'package:senpai/core/widgets/secondary_button.dart';
import 'package:senpai/core/widgets/senpai_cupertino_switch.dart';
import 'package:senpai/l10n/local_key.dart';
import 'package:senpai/l10n/resources.dart';
import 'package:senpai/models/user_profile/mappers/user_profile_mapper.dart';
import 'package:senpai/screens/profile/settings_profile/bloc/settings_profile_bloc.dart';
import 'package:senpai/screens/profile/settings_profile/widgets/cupertino_logout_widget.dart';
import 'package:senpai/screens/profile/settings_profile/widgets/delete_account_widget.dart';
import 'package:senpai/screens/profile/settings_profile/widgets/setting_premium_widget.dart';
import 'package:senpai/screens/profile/widgets/profile_app_bar.dart';
import 'package:senpai/screens/profile/widgets/profile_item_header.dart';
import 'package:senpai/utils/constants.dart';
import 'package:senpai/utils/methods/utils.dart';

class SettingsContent extends StatelessWidget {
  const SettingsContent({
    super.key,
  });

  void _showActionSheet(BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (_) => BlocProvider.value(
        value: BlocProvider.of<SettingsProfileBloc>(context),
        child: const CupertinoLogoutWidget(),
      ),
    );
  }

  void _onDoneTap(BuildContext context) {
    final bloc = BlocProvider.of<SettingsProfileBloc>(context);
    final serverBloc = BlocProvider.of<UpdateUserBloc>(context);
    serverBloc.updateUserInfo(
      user: bloc.user.toUpdateModel(),
      verified: bloc.user.verified,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfileAppBar(
          title: R.strings.settingsTitle,
          onDoneTap: () => _onDoneTap(context),
        ),
        _buildPremiumWidget(context),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: $constants.insets.sm),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: _buildSettingsContent(context),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPremiumWidget(BuildContext context) {
    final bloc = BlocProvider.of<SettingsProfileBloc>(context);

    return BlocBuilder<SettingsProfileBloc, SettingsProfileState>(
        builder: (context, state) {
      return bloc.user.premium == true
          ? const SizedBox()
          : const SettingsPremiumWidget();
    });
  }

  Widget _buildSettingsContent(BuildContext context) {
    return BlocBuilder<SettingsProfileBloc, SettingsProfileState>(
      builder: (context, state) {
        final bloc = BlocProvider.of<SettingsProfileBloc>(context);

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              R.strings.accountSettingsTitle,
              style: getTextTheme(context).headlineSmall,
            ),
            SizedBox(height: $constants.insets.sm),
            _buildPhoneNumberWidget(context),

            SizedBox(height: $constants.insets.sm),
            _buildLanguageWidget(context),
            SizedBox(height: $constants.insets.xs),
            Container(
              padding: EdgeInsets.all($constants.insets.sm),
              decoration: profileBoxDecoration(),
              child: ProfileItemHeader(
                title: R.strings.addLanguageTitle,
                onTap: () {
                  bloc.add(
                    OnChangeSettingsStepEvent(
                      step: SettingsStep.language,
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: $constants.insets.md),
            Container(
              padding: EdgeInsets.all($constants.insets.sm),
              decoration: profileBoxDecoration(),
              child: ProfileItemHeader(
                title: R.strings.pushNotificationsTitle,
                onTap: () {
                  bloc.add(
                    OnChangeSettingsStepEvent(
                      step: SettingsStep.pushNotifications,
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: $constants.insets.md),
            Text(
              R.strings.activityStatusTitle,
              style: getTextTheme(context).headlineSmall,
            ),
            SizedBox(height: $constants.insets.sm),
            SenpaiSwitchWithTitle(
              value: bloc.isShowActiveStatus,
              title: R.strings.showActiveStatusTitle,
              onChanged: (isOn) {
                bloc.add(OnChangeActiveStatusEvent(isStatusOn: isOn));
              },
              description: R.strings.showActiveStatusDescription,
            ),
            SizedBox(height: $constants.insets.sm),
            SenpaiSwitchWithTitle(
              value: bloc.isRecentlyActiveStatus,
              title: R.strings.showRecentlyActivetatusTitle,
              onChanged: (isOn) {
                bloc.add(OnChangeRecentlyActiveStatusEvent(isStatusOn: isOn));
              },
              description: R.strings.showRecentlyActivetatusDescription,
            ),
            SizedBox(height: $constants.insets.md),
            // 24.01 Herbert Joseph: Let's remove/hide for now.
            // Container(
            //   padding: EdgeInsets.all($constants.insets.sm),
            //   decoration: profileBoxDecoration(),
            //   child: ProfileItemHeader(
            //     title: R.strings.feedbackOnSenpaiTitle,
            //     onTap: () {
            //       bloc.add(
            //         OnChangeSettingsStepEvent(
            //           step: SettingsStep.feedback,
            //         ),
            //       );
            //     },
            //   ),
            // ),
            // 24.01 Herbert Joseph: Let's remove/hide for now.
            // SizedBox(height: $constants.insets.xxl),
            // SecondaryButton(
            //   text: R.strings.restorePurchasesButton,
            //   onPressed: () {},
            //   hasBackgroundColor: true,
            // ),
            SizedBox(height: $constants.insets.sm),
            SecondaryButton(
              text: R.strings.logoutTitle,
              onPressed: () {
                _showActionSheet(context);
              },
              hasBackgroundColor: true,
            ),
            SizedBox(height: $constants.insets.xs),
            const Center(
              child: DeleteAccountWidget(),
            ),
            SizedBox(height: MediaQuery.of(context).padding.bottom),
          ],
        );
      },
    );
  }

  Widget _buildPhoneNumberWidget(BuildContext context) {
    final bloc = BlocProvider.of<SettingsProfileBloc>(context);

    return Container(
      padding: EdgeInsets.all($constants.insets.sm),
      decoration: profileBoxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProfileItemHeader(
            title: R.strings.phoneNumberTitle,
            onTap: () {
              bloc.add(
                OnChangeSettingsStepEvent(
                  step: SettingsStep.phoneNumber,
                ),
              );
            },
          ),
          Text(
            bloc.user.phone,
            style: getTextTheme(context)
                .labelMedium
                ?.copyWith(color: $constants.palette.grey),
          ),
        ],
      ),
    );
  }

  Widget _buildLanguageWidget(BuildContext context) {
    return Container(
      padding: EdgeInsets.all($constants.insets.sm),
      decoration: profileBoxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            R.strings.languageTitle,
            style: getTextTheme(context)
                .bodyMedium
                ?.copyWith(color: $constants.palette.white),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BlocBuilder<ApplicationLocaleBloc, ApplicationLocaleState>(
                builder: (context, state) {
                  return Text(
                    LocaleKeyExtension.parse(state.locale!.languageCode).name,
                    style: getTextTheme(context)
                        .labelMedium
                        ?.copyWith(color: $constants.palette.grey),
                  );
                },
              ),
              Icon(
                Icons.done,
                color: $constants.palette.white,
                size: 14,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
