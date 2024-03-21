import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:senpai/core/widgets/events/senpai_cosplay_widget.dart';
import 'package:senpai/data/path_constants.dart';
import 'package:senpai/screens/events_list/widgets/senpai_custom_clipper.dart';
import 'package:senpai/screens/new_event/enums/new_event_enums.dart';
import 'package:senpai/utils/constants.dart';
import 'package:senpai/utils/methods/utils.dart';

class NotchedContainerWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final CosplayRequired? cosplayRequired;

  const NotchedContainerWidget({
    super.key,
    required this.title,
    required this.subtitle,
    this.cosplayRequired,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: SenpaiCustomClipper(),
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: $constants.match.blur,
            sigmaY: $constants.match.blur,
          ),
          child: Container(
            width: MediaQuery.of(context).size.width - $constants.insets.lg * 2,
            height: $constants.events.eventListNotchedContainerHeight,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular($constants.corners.xlg),
              color: $constants.palette.darkGrey2.withOpacity(0.8),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(
                      $constants.insets.md,
                      $constants.insets.xs,
                      0,
                      $constants.insets.xs,
                    ),
                    child: _buildTitle(context),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: isCosplayRequired(cosplayRequired)
                      ? const SenpaiCosplayWidget()
                      : SizedBox(
                          width: $constants.insets.lg,
                          child: SvgPicture.asset(
                            PathConstants.arrowsForward,
                            width: $constants.corners.sm,
                            height: $constants.corners.sm,
                            fit: BoxFit.contain,
                          ),
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: $constants.events.eventListNotchedContainerHeight,
        ),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  style: getTextTheme(context).headlineSmall!,
                ),
              ),
              Flexible(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.location_pin,
                      size: $constants.insets.sm,
                      color: $constants.palette.white,
                    ),
                    SizedBox(
                      width: $constants.insets.xxs,
                    ),
                    Expanded(
                      child: Text(
                        subtitle,
                        overflow: TextOverflow.ellipsis,
                        style: getTextTheme(context).labelMedium!,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
