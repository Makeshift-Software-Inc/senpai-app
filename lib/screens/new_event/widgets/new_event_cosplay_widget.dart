import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:senpai/l10n/resources.dart';
import 'package:senpai/screens/new_event/bloc/new_event_bloc.dart';
import 'package:senpai/screens/new_event/enums/new_event_enums.dart';

import 'package:senpai/core/widgets/senpai_toogle_buttons.dart';
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
          SizedBox(height: $constants.insets.sm),
          SenpaiToggleButtons(
            items: CosplayRequired.values
                .map((item) => cosplayToString(item))
                .toList(),
            onTapItem: (index) {
              final bloc = BlocProvider.of<NewEventBloc>(context);
              bloc.add(OnChangeCosplayInfoEvent(index));
            },
            selectedIndex: cosplayRequiredIndex,
          ),
        ],
      ),
    );
  }
}
