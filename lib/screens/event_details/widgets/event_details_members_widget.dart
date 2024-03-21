import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:senpai/core/widgets/primary_button.dart';
import 'package:senpai/data/path_constants.dart';
import 'package:senpai/l10n/resources.dart';
import 'package:senpai/models/user_profile/user_profile_model.dart';
import 'package:senpai/screens/event_details/widgets/event_details_partisipants_list.dart';
import 'package:senpai/utils/constants.dart';
import 'package:senpai/utils/methods/utils.dart';

class EventDetailsMembersWidget extends StatelessWidget {
  final UserProfileModel hostModel;

  const EventDetailsMembersWidget({
    super.key,
    required this.hostModel,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: $constants.events.eventDetailsMembersHeight,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular($constants.insets.md),
            ),
            shape: BoxShape.rectangle,
            image: const DecorationImage(
              image: AssetImage(PathConstants.eventMembersBackground),
              fit: BoxFit.cover,
            ),
          ),
          width: getSize(context).width - $constants.insets.lg,
          child: Padding(
            padding: EdgeInsets.all($constants.insets.sm),
            child: Column(
              children: [
                _buildMembersTitle(context),
                const EventDetailsPartisipantsList(),
              ],
            ),
          ),
        ),
        Positioned.fill(
          child: Center(
            child: _buildHostImage(),
          ),
        ),
        Positioned.fill(
          child: Center(
            child: _buildHostTitle(context),
          ),
        ),
        Positioned(
          bottom: $constants.insets.sm,
          left: $constants.insets.md,
          right: $constants.insets.md,
          child: _buildAttendButton(context),
        ),
      ],
    );
  }

  Widget _buildAttendButton(BuildContext context) {
    return PrimaryButton(
      text: R.strings.attendButton,
      onPressed: () {},
    );
  }

  Widget _buildMembersTitle(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all($constants.corners.sm),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: $constants.palette.darkGrey,
              width: 1.0,
            ),
          ),
          child: SvgPicture.asset(
            PathConstants.peopleIcon,
            width: $constants.insets.sm,
            height: $constants.insets.sm,
          ),
        ),
        SizedBox(width: $constants.insets.sm),
        Flexible(
          child: RichText(
            text: TextSpan(
              style: getTextTheme(context)
                  .bodySmall
                  ?.copyWith(letterSpacing: 0.5, fontWeight: FontWeight.w600),
              children: [
                TextSpan(text: R.strings.maximumPartyMemberLimit),
                const TextSpan(text: '\n'),
                TextSpan(
                  text: R.strings.youCanParticipateInPartyDescription,
                  style: getTextTheme(context).labelMedium,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildHostImage() {
    return Container(
      height: $constants.events.eventMembersCenterImageSize,
      width: $constants.events.eventMembersCenterImageSize,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: NetworkImage(
            hostModel.gallery!.photos.first.url!,
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildHostTitle(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: $constants.events.eventMembersCenterBGHeight,
      ),
      padding: EdgeInsets.all($constants.insets.xxs),
      height: $constants.events.eventListRoundContainerSize,
      width: $constants.events.eventHostHeight,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: $constants.palette.progressBackground.withOpacity(0.9),
        borderRadius: BorderRadius.circular($constants.corners.lg),
        boxShadow: [
          BoxShadow(
            color: $constants.palette.black.withOpacity(0.5),
            blurRadius: 1,
            spreadRadius: -4,
            offset: Offset(0, $constants.corners.sm),
          ),
          BoxShadow(
            color: $constants.palette.black.withOpacity(0.5),
            blurRadius: 0.5,
            spreadRadius: -4,
            offset: Offset(0, -$constants.insets.xs),
          ),
        ],
      ),
      child: Column(
        children: [
          Flexible(
            child: Text(
              hostModel.firstName ?? '',
              style: getTextTheme(context).labelMedium,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Container(
            height: 1,
            margin: EdgeInsets.all($constants.insets.xxs),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              gradient: $constants.palette.eventHostGradient,
              borderRadius: BorderRadius.circular($constants.corners.lg),
            ),
          ),
          Flexible(
            child: AutoSizeText(
              R.strings.hostTheEventText,
              minFontSize: 8,
              style: getTextTheme(context)
                  .labelMedium
                  ?.copyWith(color: $constants.palette.disabledTextButton),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
