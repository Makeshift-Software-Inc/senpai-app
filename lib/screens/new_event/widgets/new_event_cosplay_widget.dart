import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:senpai/l10n/resources.dart';
import 'package:senpai/screens/new_event/bloc/new_event_bloc.dart';
import 'package:senpai/screens/new_event/enums/new_event_enums.dart';

import 'package:senpai/utils/constants.dart';
import 'package:senpai/utils/methods/utils.dart';

class NewEventCosplayWidget extends StatelessWidget {
  final int? cosplayRequiredIndex;

  const NewEventCosplayWidget({
    super.key,
    this.cosplayRequiredIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all($constants.insets.sm),
      decoration: profileBoxDecoration(),
      width: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            R.strings.cosplayText,
            style: getTextTheme(context).bodyMedium?.copyWith(
                  color: $constants.palette.white,
                  fontWeight: FontWeight.w600,
                ),
          ),
          SizedBox(height: $constants.insets.xs),
          Wrap(
            children: CosplayRequired.values
                .asMap()
                .entries
                .map(
                  (entry) => Padding(
                    padding: EdgeInsets.only(right: $constants.insets.xs),
                    child: _buildItem(
                      context,
                      cosplayToString(entry.value),
                      entry.key,
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildItem(
    BuildContext context,
    String title,
    int index,
  ) {
    final isSelected = index == cosplayRequiredIndex;
    return ElevatedButton(
      onPressed: () {
        final bloc = BlocProvider.of<NewEventBloc>(context);
        bloc.add(OnChangeCosplayInfoEvent(index));
      },
      style: ElevatedButton.styleFrom(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular($constants.corners.xxl),
        ),
        shadowColor: Colors.transparent,
        backgroundColor: isSelected
            ? $constants.palette.buttonBorder
            : $constants.palette.darkBlue,
        padding: EdgeInsets.symmetric(
          horizontal: $constants.corners.md,
          vertical: $constants.insets.xs,
        ),
      ),
      child: Text(
        title,
        style: getTextTheme(context).headlineSmall?.copyWith(
              color: isSelected
                  ? $constants.palette.white
                  : $constants.palette.disabledTextButton,
            ),
      ),
    );
  }
}
