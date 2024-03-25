import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:senpai/data/path_constants.dart';
import 'package:senpai/screens/events_list/events_list_filter/bloc/events_list_filter_bloc.dart';
import 'package:senpai/utils/constants.dart';
import 'package:senpai/utils/methods/utils.dart';

class EventFilterDateWidget extends StatelessWidget {
  final String title;
  final DateTime date;
  final ValueChanged<DateTime> onDateTimeChanged;

  const EventFilterDateWidget({
    super.key,
    required this.title,
    required this.date,
    required this.onDateTimeChanged,
  });

  void showEventDateDialog(BuildContext context) {
    final bloc = BlocProvider.of<EventsListFilterBloc>(context);

    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => BlocProvider.value(
        value: bloc,
        child: _buildEventDateDialog(context, bloc),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showEventDateDialog(context),
      behavior: HitTestBehavior.opaque,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: $constants.insets.sm),
        decoration: profileBoxDecoration(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(width: $constants.corners.md),
            Text(
              title,
              style: getTextTheme(context).bodyMedium,
            ),
            Expanded(
              child: Text(
                DateFormat('dd/MM/yyyy').format(date),
                style: getTextTheme(context)
                    .bodyMedium!
                    .copyWith(color: $constants.palette.grey),
                textAlign: TextAlign.right,
              ),
            ),
            SizedBox(width: $constants.corners.md),
            Container(
              height: $constants.insets.xxl,
              width: $constants.insets.xl,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular($constants.corners.md),
                  bottomRight: Radius.circular($constants.corners.md),
                ),
                color: $constants.palette.buttonBorder,
              ),
              child: Center(
                child: SvgPicture.asset(
                  PathConstants.calendarIcon,
                  width: $constants.insets.md,
                  height: $constants.insets.md,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEventDateDialog(
      BuildContext context, EventsListFilterBloc bloc) {
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
          initialDateTime: date,
          mode: CupertinoDatePickerMode.date,
          onDateTimeChanged: (DateTime newDate) {
            onDateTimeChanged(newDate);
          },
        ),
      ),
    );
  }
}
