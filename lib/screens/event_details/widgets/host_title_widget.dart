import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:senpai/l10n/resources.dart';
import 'package:senpai/utils/constants.dart';
import 'package:senpai/utils/methods/utils.dart';

class HostTitleWidget extends StatelessWidget {
  final String firstName;

  const HostTitleWidget({
    super.key,
    required this.firstName,
  });

  @override
  Widget build(BuildContext context) {
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
              firstName,
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
