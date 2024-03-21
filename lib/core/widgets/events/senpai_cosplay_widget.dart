import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:senpai/data/path_constants.dart';
import 'package:senpai/l10n/resources.dart';

import 'package:senpai/utils/constants.dart';
import 'package:senpai/utils/methods/utils.dart';

class SenpaiCosplayWidget extends StatelessWidget {
  const SenpaiCosplayWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Container(
          width: $constants.events.eventListRoundContainerSize,
          height: $constants.events.eventListRoundContainerSize,
          decoration: BoxDecoration(
            color: $constants.palette.darkBlue,
            shape: BoxShape.circle,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                PathConstants.cosplayIcon,
                width: $constants.insets.md,
                height: $constants.insets.sm,
              ),
              Text(
                R.strings.cosplayText,
                style: getTextTheme(context).headlineSmall?.copyWith(
                      color: $constants.palette.white,
                      fontSize: 8,
                      fontWeight: FontWeight.w900,
                    ),
              ),
            ],
          ),
        ),
        Image.asset(
          PathConstants.cosplayBgImage,
          width: $constants.events.eventCosplaySize,
          height: $constants.events.eventCosplaySize,
          fit: BoxFit.cover,
        ),
      ],
    );
  }
}
