import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:senpai/data/path_constants.dart';
import 'package:senpai/l10n/resources.dart';
import 'package:senpai/screens/events_list/events_list_filter/bloc/events_list_filter_bloc.dart';
import 'package:senpai/screens/profile_fill/widgets/custom_close_button.dart';
import 'package:senpai/utils/constants.dart';
import 'package:senpai/utils/methods/utils.dart';

class HostRaitingWidget extends StatelessWidget {
  final double initialRating;

  const HostRaitingWidget({
    super.key,
    required this.initialRating,
  });

  void _openRaiting(BuildContext context) {
    final bloc = BlocProvider.of<EventsListFilterBloc>(context);
    showDialog<void>(
      context: context,
      builder: (BuildContext context) => BlocProvider.value(
        value: bloc,
        child: Dialog(
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          insetPadding: EdgeInsets.zero,
          child: Center(
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(
                    vertical: $constants.corners.sm,
                    horizontal: $constants.insets.md,
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: $constants.insets.sm,
                  ),
                  height: $constants.events.eventMembersCircleBGHeight,
                  decoration: BoxDecoration(
                    color: $constants.palette.appBackground,
                    borderRadius: BorderRadius.circular($constants.insets.sm),
                  ),
                  child: Center(
                    child: RatingBar.builder(
                      initialRating: initialRating,
                      minRating: 0,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: EdgeInsets.symmetric(
                        horizontal: $constants.insets.xxs,
                      ),
                      itemBuilder: (context, _) => SvgPicture.asset(
                        PathConstants.starIcon,
                        width: $constants.insets.md,
                        height: $constants.insets.md,
                      ),
                      onRatingUpdate: (rating) {
                        bloc.add(OnChangeHostRating(rating));
                      },
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  right: $constants.insets.sm,
                  child: CustomCloseButton(
                    borderColor: $constants.palette.black.withOpacity(0.6),
                    backgroundColor: $constants.palette.appBackground,
                    onTapButton: () {
                      context.router.pop();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _openRaiting(context),
      behavior: HitTestBehavior.opaque,
      child: Container(
        height: $constants.insets.xxl,
        margin: EdgeInsets.symmetric(horizontal: $constants.insets.sm),
        decoration: profileBoxDecoration(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(width: $constants.corners.md),
            Text(
              R.strings.hostRatingFromText,
              style: getTextTheme(context).bodyMedium?.copyWith(
                    color: $constants.palette.white,
                    fontWeight: FontWeight.w600,
                  ),
            ),
            SizedBox(width: $constants.insets.xxs),
            SvgPicture.asset(
              PathConstants.starIcon,
              width: $constants.insets.md,
              height: $constants.insets.md,
            ),
            Expanded(
              child: Text(
                '$initialRating',
                style: getTextTheme(context)
                    .bodyMedium!
                    .copyWith(color: $constants.palette.grey),
                textAlign: TextAlign.right,
              ),
            ),
            SizedBox(width: $constants.insets.sm),
          ],
        ),
      ),
    );
  }
}
