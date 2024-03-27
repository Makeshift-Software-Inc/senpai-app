import 'package:flutter/material.dart';
import 'package:senpai/data/path_constants.dart';
import 'package:senpai/l10n/resources.dart';
import 'package:senpai/screens/events_list/bloc/events_list_bloc.dart';
import 'package:senpai/utils/constants.dart';
import 'package:senpai/utils/methods/utils.dart';

class EmptyEventsWidget extends StatelessWidget {
  final EventsListType eventsListType;

  const EmptyEventsWidget({
    super.key,
    required this.eventsListType,
  });

  String _descriptionText() {
    if (eventsListType == EventsListType.yourEvents) {
      //add to localization
      return 'You need to host an event for them to show here';
    }
    return R.strings.noEventsFoundDescription;
  }

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
          Padding(
            padding: EdgeInsets.symmetric(horizontal: $constants.insets.sm),
            child: _buildDescriptionWidget(context),
          ),
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
      _descriptionText(),
      textAlign: TextAlign.center,
      style: getTextTheme(context).bodyMedium,
    );
  }
}
