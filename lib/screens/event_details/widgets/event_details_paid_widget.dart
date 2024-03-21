import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:senpai/data/path_constants.dart';
import 'package:senpai/l10n/resources.dart';
import 'package:senpai/utils/constants.dart';
import 'package:senpai/utils/methods/utils.dart';

class EventDetailsPaidWidget extends StatelessWidget {
  final bool paymentRequired;

  const EventDetailsPaidWidget({
    super.key,
    required this.paymentRequired,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: $constants.corners.rounded,
      height: $constants.insets.md,
      alignment: Alignment.topCenter,
      decoration: ShapeDecoration(
        shape: StadiumBorder(
          side: BorderSide(
            color: $constants.palette.darkBlue,
            width: $constants.insets.xs,
            strokeAlign: 1,
          ),
        ),
      ),
      child: Container(
        alignment: Alignment.center,
        decoration: ShapeDecoration(
          color: $constants.palette.darkBlue,
          shape: StadiumBorder(
            side: BorderSide(
              color: paymentRequired
                  ? $constants.palette.blue
                  : $constants.palette.green,
              width: 1,
            ),
          ),
        ),
        child: _buildPaidWidget(context, paymentRequired),
      ),
    );
  }

  Widget _buildPaidWidget(BuildContext context, bool paymentRequired) {
    if (paymentRequired) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            PathConstants.eventPaidIcon,
            width: $constants.corners.lg,
            height: $constants.corners.lg,
            fit: BoxFit.contain,
          ),
          SizedBox(width: $constants.insets.xxs),
          Text(
            R.strings.paidEntryText,
            style: getTextTheme(context).headlineSmall?.copyWith(
                  color: $constants.palette.white,
                  fontSize: 10,
                  fontWeight: FontWeight.w900,
                ),
          ),
        ],
      );
    } else {
      return Text(
        R.strings.freeTitle,
        style: getTextTheme(context).headlineSmall?.copyWith(
              color: $constants.palette.white,
              fontSize: 13,
              fontWeight: FontWeight.w900,
            ),
      );
    }
  }
}
