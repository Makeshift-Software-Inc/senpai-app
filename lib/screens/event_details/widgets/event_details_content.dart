import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:senpai/l10n/resources.dart';
import 'package:senpai/models/events/event_details/event_details_model.dart';
import 'package:senpai/routes/app_router.dart';
import 'package:senpai/screens/event_details/bloc/event_details_bloc.dart';
import 'package:senpai/screens/event_details/widgets/event_details_description_widget.dart';
import 'package:senpai/screens/event_details/widgets/event_details_header.dart';
import 'package:senpai/screens/event_details/widgets/event_details_members_widget.dart';
import 'package:senpai/screens/event_details/widgets/event_details_paid_widget.dart';
import 'package:senpai/screens/new_event/enums/new_event_enums.dart';
import 'package:senpai/utils/constants.dart';
import 'package:senpai/utils/methods/utils.dart';

class EventDetailsContent extends StatelessWidget {
  const EventDetailsContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EventDetailsBloc, EventDetailsState>(
      builder: (context, state) {
        final bloc = BlocProvider.of<EventDetailsBloc>(context);
        if (bloc.eventModel == null) {
          return const SizedBox();
        }
        return Padding(
          padding: EdgeInsets.all($constants.insets.sm),
          child: SingleChildScrollView(
            child: Column(
              children: [
                _buildImageWidget(bloc.eventModel!),
                SizedBox(height: $constants.insets.sm),
                EventDetailsDescriptionWidget(
                  description: bloc.eventModel?.description ?? '',
                  convention: bloc.conventionModel,
                ),
                SizedBox(height: $constants.insets.sm),
                _buildLocationEvent(
                  context,
                  lonLat: bloc.eventModel?.lonlat ?? '',
                  venue: bloc.eventModel?.venue ?? '',
                ),
                SizedBox(height: $constants.insets.sm),
                if (bloc.hostModel != null)
                  EventDetailsMembersWidget(hostModel: bloc.hostModel!),
                SizedBox(height: $constants.insets.sm),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildImageWidget(EventDetailsModel eventModel) {
    return Stack(
      children: [
        Container(
          height: $constants.events.eventDetailsImageHeight,
          margin: EdgeInsets.only(
            top: $constants.insets.sm,
            bottom: $constants.insets.md,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular($constants.corners.xlg),
            image: DecorationImage(
              image: NetworkImage(eventModel.coverImageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.topCenter,
            child: EventDetailsPaidWidget(
              paymentRequired: eventModel.paymentRequired ?? false,
            ),
          ),
        ),
        Positioned.fill(
          bottom: 0,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: EventDetailsHeader(
              title: eventModel.title,
              subtitle: '${eventModel.displayCity}, ${eventModel.displayState}',
              startDate: eventModel.startDate,
              cosplayStatus: CosplayStatus.cosplayFromServer(
                eventModel.cosplayRequired,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLocationEvent(
    BuildContext context, {
    required String lonLat,
    required String venue,
  }) {
    return Container(
      padding: EdgeInsets.all($constants.insets.sm),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular($constants.insets.md),
        ),
        shape: BoxShape.rectangle,
        gradient: $constants.palette.aboutEventGradient,
      ),
      width: getSize(context).width - $constants.insets.lg,
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              context.router.push(
                EventMapRoute(
                  eventCoordinates: stringToLatLng(lonLat),
                ),
              );
            },
            child: _buildLocationTitle(context, venue),
          ),
          //delete it after test
          // SizedBox(height: $constants.insets.sm),
          // ClipRRect(
          //   borderRadius: BorderRadius.circular($constants.insets.md),
          //   child: SizedBox(
          //     height: $constants.events.eventDetailsLocationHeight,
          //     child: EventMapPage(
          //       eventCoordinates: stringToLatLng(lonLat),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget _buildLocationTitle(
    BuildContext context,
    String fullAddress,
  ) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all($constants.insets.xs),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: $constants.palette.darkGrey,
              width: 1.0,
            ),
          ),
          child: Icon(
            Icons.location_on_outlined,
            size: $constants.insets.md,
            color: $constants.palette.white,
          ),
        ),
        SizedBox(width: $constants.insets.sm),
        Expanded(
          child: SelectableText.rich(
            TextSpan(
              style: getTextTheme(context)
                  .bodyMedium
                  ?.copyWith(fontWeight: FontWeight.w600),
              children: [
                TextSpan(text: R.strings.locationTitle),
                const TextSpan(text: '\n'),
                TextSpan(
                  text: fullAddress,
                  style: getTextTheme(context)
                      .bodySmall
                      ?.copyWith(letterSpacing: 0.5),
                ),
              ],
            ),
          ),
        ),
        Icon(
          Icons.chevron_right,
          color: $constants.palette.white,
        ),
      ],
    );
  }
}
