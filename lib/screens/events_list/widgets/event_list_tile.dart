import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:senpai/core/widgets/loading.dart';
import 'package:senpai/data/path_constants.dart';
import 'package:senpai/l10n/resources.dart';
import 'package:senpai/screens/events_list/widgets/notched_container_widget.dart';
import 'package:senpai/screens/new_event/enums/new_event_enums.dart';
import 'package:senpai/utils/constants.dart';
import 'package:senpai/utils/methods/utils.dart';

class EventListTile extends StatelessWidget {
  const EventListTile({
    Key? key,
    required this.coverImageUrl,
    required this.startDate,
    required this.title,
    required this.city,
    required this.state,
    required this.paymentRequired,
    this.cosplayRequired,
  }) : super(key: key);

  final String coverImageUrl;
  final DateTime startDate;
  final String title;
  final String city;
  final String state;
  final bool paymentRequired;
  final String? cosplayRequired;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: $constants.events.eventListItemHeight,
      child: Stack(
        children: [
          Container(
            height: $constants.events.eventListImageHeight,
            margin: EdgeInsets.all($constants.insets.sm),
            decoration: BoxDecoration(
              color: $constants.palette.white,
              borderRadius: BorderRadius.circular($constants.corners.xlg),
            ),
            child: CachedNetworkImage(
              imageUrl: coverImageUrl,
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular($constants.corners.xlg),
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              placeholder: (context, url) => const Center(
                child: SenpaiLoading(),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: $constants.insets.md, right: $constants.insets.lg),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: EdgeInsets.all($constants.insets.xs),
                  margin: EdgeInsets.only(right: $constants.insets.xs),
                  decoration: BoxDecoration(
                      color: $constants.palette.black.withOpacity(0.4),
                      shape: BoxShape.circle),
                  child: Icon(
                    Icons.calendar_month,
                    size: $constants.insets.sm,
                    color: $constants.palette.white,
                  ),
                ),
                Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: $constants.insets.xs,
                        vertical: $constants.insets.xxs),
                    decoration: BoxDecoration(
                        color: $constants.palette.black,
                        borderRadius:
                            BorderRadius.circular($constants.corners.xlg)),
                    child: Text(
                      DateFormat.yMMMMEEEEd().format(startDate),
                      style: getTextTheme(context).displaySmall!.copyWith(
                            color: $constants.palette.white,
                          ),
                    ))
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: NotchedContainerWidget(
              title: title,
              subtitle: '$city, $state',
              cosplayRequired: CosplayRequired.cosplayFromServer(
                cosplayRequired,
              ),
            ),
          ),
          Positioned(
            bottom: 35,
            left: 57,
            child: Container(
              width: $constants.events.eventListRoundContainerSize,
              height: $constants.events.eventListRoundContainerSize,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                gradient: $constants.palette.mainGradient,
                shape: BoxShape.circle,
              ),
              child: Container(
                width: $constants.insets.xl,
                height: $constants.insets.xl,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: $constants.palette.black,
                  shape: BoxShape.circle,
                ),
                child: _buildPaidWidget(context),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildPaidWidget(BuildContext context) {
    if (paymentRequired) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            PathConstants.eventPaidIcon,
            width: $constants.corners.xlg,
            height: $constants.corners.xlg,
            fit: BoxFit.contain,
          ),
          Text(
            R.strings.paidEntryText,
            style: getTextTheme(context).headlineSmall?.copyWith(
                  color: $constants.palette.white,
                  fontSize: 8,
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
              fontSize: 10,
              fontWeight: FontWeight.w900,
            ),
      );
    }
  }
}
