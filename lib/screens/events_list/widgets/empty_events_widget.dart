import 'package:flutter/material.dart';
import 'package:senpai/data/path_constants.dart';
import 'package:senpai/l10n/resources.dart';
import 'package:senpai/utils/constants.dart';
import 'package:senpai/utils/methods/utils.dart';

class EmptyEventsWidget extends StatelessWidget {
  const EmptyEventsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      final maxHeight = constraints.maxHeight;
      return Column(
        children: [
          Image.asset(
            PathConstants.emptyEventsImage,
            fit: BoxFit.fitWidth,
            width: getSize(context).width,
            height: maxHeight - $constants.events.eventMembersCircleBGHeight,
          ),
          _buildTitleWidget(context),
          _buildDescriptionWidget(context),
        ],
      );
    });
  }

  Widget _buildTitleWidget(BuildContext context) {
    return Text(
      R.strings.noEventsFoundText,
      style: getTextTheme(context).headlineSmall?.copyWith(fontSize: 24),
    );
  }

  Widget _buildDescriptionWidget(BuildContext context) {
    return Text(
      R.strings.noEventsFoundDescription,
      textAlign: TextAlign.center,
      style: getTextTheme(context).bodyMedium,
    );
  }
}
