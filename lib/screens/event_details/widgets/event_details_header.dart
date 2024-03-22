import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:senpai/core/widgets/events/senpai_cosplay_widget.dart';
import 'package:senpai/data/path_constants.dart';
import 'package:senpai/screens/events_list/widgets/senpai_custom_clipper.dart';
import 'package:senpai/screens/new_event/enums/new_event_enums.dart';

import 'package:senpai/utils/constants.dart';
import 'package:senpai/utils/methods/utils.dart';

class EventDetailsHeader extends StatelessWidget {
  final String title;
  final String subtitle;
  final DateTime startDate;
  final CosplayStatus? cosplayStatus;

  const EventDetailsHeader({
    super.key,
    required this.title,
    required this.subtitle,
    required this.startDate,
    this.cosplayStatus,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(top: $constants.corners.xxl),
          child: ClipPath(
            clipper: isCosplayRequired(cosplayStatus)
                ? SenpaiCosplayCustomClipper()
                : null,
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: $constants.match.blur,
                  sigmaY: $constants.match.blur,
                ),
                child: Container(
                  width: getSize(context).width - $constants.insets.lg * 2,
                  height: $constants.corners.rounded,
                  padding: EdgeInsets.symmetric(
                    horizontal: $constants.insets.sm,
                    vertical: $constants.insets.xs,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular($constants.corners.xlg),
                    color: $constants.palette.darkGrey2.withOpacity(0.8),
                  ),
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
                      Flexible(child: _buildLocationWidget(context)),
                      SizedBox(height: $constants.insets.xs),
                      _buildDateWidget(context),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        if (isCosplayRequired(cosplayStatus))
          Positioned(
            top: 0,
            right: $constants.corners.md,
            child: const SenpaiCosplayWidget(),
          ),
      ],
    );
  }

  Widget _buildLocationWidget(BuildContext context) {
    return Row(
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
    );
  }

  Widget _buildDateWidget(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all($constants.insets.xs),
          margin: EdgeInsets.only(right: $constants.insets.xxs),
          decoration: BoxDecoration(
            color: $constants.palette.black,
            shape: BoxShape.circle,
          ),
          child: SvgPicture.asset(
            PathConstants.calendarIcon,
            width: $constants.insets.sm,
            height: $constants.insets.sm,
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: $constants.insets.sm,
            vertical: $constants.insets.xxs,
          ),
          decoration: BoxDecoration(
            color: $constants.palette.black,
            borderRadius: BorderRadius.circular($constants.corners.xlg),
          ),
          child: Text(
            DateFormat.yMMMMEEEEd().format(startDate),
            style: getTextTheme(context).displaySmall!.copyWith(
                  color: $constants.palette.white,
                ),
          ),
        )
      ],
    );
  }
}
