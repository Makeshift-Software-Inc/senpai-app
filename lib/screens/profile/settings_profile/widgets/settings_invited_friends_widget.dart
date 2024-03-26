import 'package:flutter/material.dart';
import 'package:senpai/data/path_constants.dart';
import 'package:senpai/l10n/resources.dart';
import 'package:senpai/utils/constants.dart';
import 'package:senpai/utils/methods/utils.dart';

class SettingsInvitedFriendsWidget extends StatelessWidget {
  final invitedFriends = 7;

  const SettingsInvitedFriendsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final invitedFriendsPercent = invitedFriends / 15;
    final gradientContainerWidth = MediaQuery.of(context).size.width -
        $constants.insets.xxl * 2 -
        $constants.insets.xs * 2;
    final gradientWidth = gradientContainerWidth * invitedFriendsPercent;
    return Stack(
      children: [
        Image.asset(
          PathConstants.invitedFriendsContainerBackgroundImage,
          width: MediaQuery.of(context).size.width - $constants.insets.sm * 2,
          fit: BoxFit.cover,
        ),
        Positioned(
          top: 10,
          child: Image.asset(
            PathConstants.invitedFriendsContainerImage,
            width: MediaQuery.of(context).size.width -
                $constants.insets.sm * 2 -
                $constants.insets.sm,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: 10,
          child: ClipRect(
            child: Container(
              width:
                  MediaQuery.of(context).size.width - $constants.insets.sm * 2,
              padding: EdgeInsets.only(
                top: $constants.insets.xs,
              ),
              height: 144,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: $constants.insets.sm),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              left: $constants.insets.offset,
                            ),
                            child: Text(R.strings.inviteFriendsGetPremiumText,
                                overflow: TextOverflow.ellipsis,
                                style: getTextTheme(context)
                                    .headlineSmall
                                    ?.copyWith(fontSize: 18)),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: $constants.insets.offset,
                            ),
                            child: Text(
                              R.strings.keepInvitingPeopleDescription,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: getTextTheme(context)
                                  .displaySmall
                                  ?.apply(color: $constants.palette.grey),
                            ),
                          ),
                          const Spacer(),
                          Container(
                            height: 36,
                            padding: EdgeInsets.only(
                              left: $constants.insets.sm,
                            ),
                            decoration: BoxDecoration(
                                color: $constants.palette.lightBlue,
                                borderRadius: BorderRadius.circular(
                                    $constants.corners.xl)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: gradientContainerWidth,
                                  height: 6,
                                  alignment: Alignment.centerLeft,
                                  decoration: BoxDecoration(
                                      color: $constants.palette.black,
                                      borderRadius: BorderRadius.circular(
                                          $constants.corners.sm)),
                                  child: Container(
                                    width: gradientWidth,
                                    height: 6,
                                    decoration: BoxDecoration(
                                        gradient:
                                            $constants.palette.lineGradient,
                                        borderRadius: BorderRadius.circular(
                                            $constants.corners.sm)),
                                  ),
                                ),
                                Container(
                                  width: 36,
                                  height: 36,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: $constants.palette.black,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color: $constants.palette.darkGrey3)),
                                  child: Text(
                                    '$invitedFriends/15',
                                    style: getTextTheme(context)
                                        .displaySmall
                                        ?.copyWith(fontWeight: FontWeight.w800),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          left: 0,
          top: 2,
          child: Image.asset(
            'assets/images/premium.png',
            width: 89,
            height: 83,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
