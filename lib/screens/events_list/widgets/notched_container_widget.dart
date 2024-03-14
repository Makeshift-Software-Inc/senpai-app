import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:senpai/data/path_constants.dart';
import 'package:senpai/screens/events_list/widgets/senpai_custom_clipper.dart';
import 'package:senpai/utils/constants.dart';
import 'package:senpai/utils/methods/utils.dart';

class NotchedContainerWidget extends StatelessWidget {
  final String title;
  final String subtitle;

  const NotchedContainerWidget({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: SenpaiCustomClipper(),
      child: Container(
        width: MediaQuery.of(context).size.width - $constants.insets.lg * 2,
        height: $constants.events.eventListNotchedContainerHeight,
        padding: EdgeInsets.symmetric(
            horizontal: $constants.insets.md, vertical: $constants.insets.xs),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular($constants.corners.xlg),
          color: $constants.palette.darkGrey2.withOpacity(0.8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              children: [
                Text(
                  title,
                  style: getTextTheme(context).headlineSmall!,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.location_pin,
                      size: $constants.insets.xs,
                      color: $constants.palette.white,
                    ),
                    SizedBox(
                      width: $constants.insets.xxs,
                    ),
                    Text(
                      subtitle,
                      style: getTextTheme(context).labelMedium!,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              width: $constants.insets.xl,
            ),
            SvgPicture.asset(
              PathConstants.arrowsForward,
              width: $constants.corners.sm,
              height: $constants.corners.sm,
              fit: BoxFit.contain,
            ),
            SizedBox(
              width: $constants.insets.sm,
            ),
          ],
        ),
      ),
    );
  }
}
