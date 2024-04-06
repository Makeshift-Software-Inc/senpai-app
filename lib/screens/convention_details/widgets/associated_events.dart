import 'package:flutter/material.dart';
import 'package:senpai/l10n/resources.dart';
import 'package:senpai/utils/constants.dart';
import 'package:senpai/utils/methods/utils.dart';

class AssociatedEvents extends StatelessWidget {
  const AssociatedEvents({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: $constants.palette.white,
        borderRadius: BorderRadius.circular($constants.corners.xlg),
      ),
      child: Column(
        children: [
          SizedBox(
            height: $constants.corners.xxl,
            child: Text(
              R.strings.associatedEventsTitle,
              style: getTextTheme(context).headlineSmall,
            ),
          )
        ],
      ),
    );
  }
}
