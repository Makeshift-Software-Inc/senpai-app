import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:senpai/core/widgets/primary_button.dart';
import 'package:senpai/data/path_constants.dart';
import 'package:senpai/l10n/resources.dart';
import 'package:senpai/models/user_profile/user_profile_model.dart';
import 'package:senpai/screens/event_details/widgets/event_details_partisipants_list.dart';
import 'package:senpai/screens/event_details/widgets/host_title_widget.dart';
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
        ClipRRect(
          borderRadius: BorderRadius.all(
            Radius.circular($constants.insets.md),
          ),
          child: Image.asset(
            PathConstants.eventMembersBackground,
            width: getSize(context).width - $constants.insets.lg,
            height: $constants.events.eventDetailsMembersHeight,
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: EdgeInsets.all($constants.insets.sm),
          child: Column(
            children: [
              Row(
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
                        style: getTextTheme(context).bodySmall?.copyWith(
                            letterSpacing: 0.5, fontWeight: FontWeight.w600),
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
              ),
              const EventDetailsPartisipantsList(),
            ],
          ),
        ),
        Positioned.fill(
          child: Center(
            child: ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular($constants.insets.offset),
              ),
              child: Image.network(
                hostModel.gallery!.photos.first.url!,
                height: $constants.events.eventMembersCenterImageSize,
                width: $constants.events.eventMembersCenterImageSize,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Positioned.fill(
          child: Center(
            child: HostTitleWidget(
              firstName: hostModel.firstName ?? '',
            ),
          ),
        ),
        Positioned(
          bottom: $constants.insets.sm,
          left: $constants.insets.md,
          right: $constants.insets.md,
          child: PrimaryButton(
            text: R.strings.attendButton,
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
