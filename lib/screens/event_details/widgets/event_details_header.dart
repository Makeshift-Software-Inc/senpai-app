import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:senpai/utils/constants.dart';
import 'package:senpai/utils/methods/utils.dart';

class EventDetailsHeader extends StatelessWidget {
  final String title;
  final String subtitle;
  final DateTime startDate;

  const EventDetailsHeader({
    super.key,
    required this.title,
    required this.subtitle,
    required this.startDate,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRect(
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
          child: Icon(
            Icons.calendar_month,
            size: $constants.insets.sm,
            color: $constants.palette.white,
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
