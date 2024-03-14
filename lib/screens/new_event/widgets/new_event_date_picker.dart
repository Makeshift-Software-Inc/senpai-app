import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:senpai/l10n/resources.dart';
import 'package:senpai/screens/new_event/bloc/new_event_bloc.dart';
import 'package:senpai/screens/new_event/widgets/new_event_item_button.dart';
import 'package:senpai/utils/constants.dart';
import 'package:senpai/utils/methods/utils.dart';

class NewEventDatePicker extends StatelessWidget {
  const NewEventDatePicker({super.key});

  void showEventDateDialog(BuildContext context) {
    final bloc = BlocProvider.of<NewEventBloc>(context);

    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => BlocProvider.value(
        value: bloc,
        child: _buildEventDateDialog(context, bloc),
      ),
    );
  }

  void showEventTimeDialog(BuildContext context) {
    final bloc = BlocProvider.of<NewEventBloc>(context);
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => BlocProvider.value(
        value: bloc,
        child: _buildEventTimeDialog(context, bloc),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewEventBloc, NewEventState>(
      builder: (context, state) {
        final bloc = BlocProvider.of<NewEventBloc>(context);
        final date = DateFormat('dd/MM/yyyy').format(bloc.newEvent.startDate);
        final startTime = DateFormat.jmz().format(bloc.startTimeEvent);
        final endTime = DateFormat.jmz().format(bloc.endTimeEvent);
        return Column(
          children: [
            SizedBox(height: $constants.insets.sm),
            NewEventItemButton(
              title: R.strings.dateText,
              description: R.strings.canBeRangeText,
              onTap: () => showEventDateDialog(context),
              customWidget: Text(
                date,
                style: getTextTheme(context)
                    .bodyMedium!
                    .copyWith(color: $constants.palette.grey),
              ),
            ),
            SizedBox(height: $constants.insets.sm),
            NewEventItemButton(
              title: R.strings.timeText,
              onTap: () => showEventTimeDialog(context),
              customWidget: Text(
                '$startTime - $endTime',
                style: getTextTheme(context)
                    .bodyMedium!
                    .copyWith(color: $constants.palette.grey),
              ),
            ),
            SizedBox(height: $constants.insets.sm),
          ],
        );
      },
    );
  }

  Widget _buildEventDateDialog(BuildContext context, NewEventBloc bloc) {
    return Container(
      height: $constants.match.matchBottomHeight,
      padding: EdgeInsets.only(top: $constants.corners.xs),
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      color: CupertinoColors.systemBackground.resolveFrom(context),
      child: SafeArea(
        top: false,
        child: CupertinoDatePicker(
          initialDateTime: bloc.newEvent.startDate,
          mode: CupertinoDatePickerMode.date,
          onDateTimeChanged: (DateTime newDate) {
            bloc.add(OnChangeDateEvent(newDate));
          },
        ),
      ),
    );
  }

  Widget _buildEventTimeDialog(BuildContext context, NewEventBloc bloc) {
    return Container(
      height: $constants.match.matchBottomHeight,
      padding: EdgeInsets.only(top: $constants.corners.xs),
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      color: CupertinoColors.systemBackground.resolveFrom(context),
      child: SafeArea(
        top: false,
        child: Row(
          children: [
            Flexible(
              child: CupertinoDatePicker(
                initialDateTime: bloc.startTimeEvent,
                mode: CupertinoDatePickerMode.time,
                onDateTimeChanged: (DateTime newDate) {
                  bloc.add(OnChangeStartTimeEvent(newDate));
                },
              ),
            ),
            Flexible(
              child: CupertinoDatePicker(
                initialDateTime: bloc.endTimeEvent,
                mode: CupertinoDatePickerMode.time,
                onDateTimeChanged: (DateTime newDate) {
                  bloc.add(OnChangeEndTimeEvent(newDate));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
