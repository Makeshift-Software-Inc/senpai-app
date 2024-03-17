import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:senpai/core/widgets/senpai_toogle_buttons.dart';
import 'package:senpai/l10n/resources.dart';
import 'package:senpai/screens/new_event/bloc/new_event_bloc.dart';
import 'package:senpai/screens/new_event/enums/new_event_enums.dart';

import 'package:senpai/utils/constants.dart';
import 'package:senpai/utils/methods/utils.dart';

class NewEventPaymentWidget extends StatelessWidget {
  final int? paymentRequiredIndex;

  const NewEventPaymentWidget({
    super.key,
    this.paymentRequiredIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all($constants.insets.sm),
      decoration: profileBoxDecoration(),
      width: double.maxFinite,
      child: Wrap(
        runSpacing: $constants.insets.sm,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Text(
            R.strings.requiresPaymentText,
            style: getTextTheme(context).bodyMedium?.copyWith(
                  color: $constants.palette.white,
                  fontWeight: FontWeight.w600,
                ),
          ),
          SizedBox(width: $constants.insets.md),
          SenpaiToggleButtons(
            items: PaymentRequired.values
                .map((item) => paymentToString(item))
                .toList(),
            onTapItem: (index) {
              final bloc = BlocProvider.of<NewEventBloc>(context);
              bloc.add(OnChangeRequiredPaymentEvent(index));
            },
            selectedIndex: paymentRequiredIndex,
          ),
        ],
      ),
    );
  }
}
