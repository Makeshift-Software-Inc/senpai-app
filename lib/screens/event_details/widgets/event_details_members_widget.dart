import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:senpai/data/path_constants.dart';
import 'package:senpai/l10n/resources.dart';
import 'package:senpai/utils/constants.dart';
import 'package:senpai/utils/methods/utils.dart';

class EventDetailsMembersWidget extends StatelessWidget {
  const EventDetailsMembersWidget({
    super.key,
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
              ],
            ),
          ),
        ),
        Positioned.fill(
          child: Center(
            child: Container(
              height: $constants.events.eventMembersCenterBGHeight,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular($constants.insets.md),
                ),
                shape: BoxShape.rectangle,
                image: const DecorationImage(
                  image: AssetImage(PathConstants.eventHostBGImage),
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
          ),
        ),
        Positioned.fill(
          child: Center(
            child: Container(
              margin: const EdgeInsets.only(top: 3, left: 3),
              height: $constants.events.eventMembersCircleBGHeight,
              width: $constants.events.eventMembersCircleBGHeight,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(PathConstants.eventHostBgCircle),
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
          ),
        ),
        Positioned.fill(
          child: Center(
            child: Container(
              margin: const EdgeInsets.only(top: 4, left: 4),
              height: $constants.events.eventMembersCenterImageSize,
              width: $constants.events.eventMembersCenterImageSize,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(
                    'https://d2dafkwzq2hfgj.cloudfront.net/stage/g8zrrvfjbwr273up3hu2l9nmbwqw',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ],
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
}
