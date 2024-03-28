import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:senpai/data/path_constants.dart';
import 'package:senpai/l10n/resources.dart';
import 'package:senpai/screens/profile_fill/widgets/custom_close_button.dart';
import 'package:senpai/utils/constants.dart';
import 'package:senpai/utils/methods/utils.dart';

class PremiumSuccessDialog extends StatelessWidget {
  const PremiumSuccessDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: $constants.referral.premiumDialogContainerHeight2,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: $constants.referral.premiumDialogContainerHeight,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: $constants.insets.sm),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular($constants.corners.xlg),
                color: $constants.palette.lightBlue,
              ),
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.only(
                    bottom: $constants.insets.md, left: $constants.insets.sm),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      R.strings.congratulationsTitle,
                      style: getTextTheme(context)
                          .headlineSmall
                          ?.copyWith(fontSize: 20),
                    ),
                    Container(
                      padding: EdgeInsets.all($constants.insets.xs),
                      margin: EdgeInsets.only(
                          top: $constants.insets.md,
                          bottom: $constants.insets.sm),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: $constants.palette.lightBlue,
                          border: Border.all(color: $constants.palette.green2)),
                      child: Icon(Icons.check,
                          size: 32, color: $constants.palette.white),
                    ),
                    Text(
                      R.strings.youHavePremiumAccountForMonth,
                      style: getTextTheme(context)
                          .displaySmall
                          ?.copyWith(color: $constants.palette.grey),
                    ),
                    Container(
                        padding: EdgeInsets.all($constants.insets.sm),
                        margin: EdgeInsets.only(
                            top: $constants.insets.sm,
                            right: $constants.insets.sm),
                        decoration: BoxDecoration(
                            color: $constants.palette.black,
                            borderRadius:
                                BorderRadius.circular($constants.corners.lg)),
                        child: Row(
                          children: [
                            SvgPicture.asset(PathConstants.premiumProfileImage),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Text(
                                R.strings
                                    .higherVisibilityRatesSuperLikesAndMuchMore,
                                style: getTextTheme(context)
                                    .headlineSmall
                                    ?.copyWith(fontSize: 14),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        )),
                    Material(
                      elevation: 2,
                      child: InkWell(
                        onTap: () => Navigator.of(context).pop(),
                        child: Container(
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.all($constants.insets.sm),
                            margin: EdgeInsets.only(
                                top: $constants.insets.sm,
                                right: $constants.insets.sm),
                            decoration: BoxDecoration(
                                color: $constants.palette.lightBlue,
                                borderRadius: BorderRadius.circular(
                                    $constants.corners.md)),
                            alignment: Alignment.center,
                            child: Text(
                              R.strings.backHomeTitle,
                              style: getTextTheme(context)
                                  .headlineSmall
                                  ?.copyWith(fontSize: 14),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            right: $constants.insets.sm,
            child: CustomCloseButton(
              borderColor: $constants.palette.black.withOpacity(0.6),
              backgroundColor: $constants.palette.appBackground,
              onTapButton: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        ],
      ),
    );
  }
}
