import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:senpai/l10n/resources.dart';
import 'package:senpai/models/events/event_details/event_details_model.dart';
import 'package:senpai/screens/event_details/bloc/event_details_bloc.dart';
import 'package:senpai/screens/event_details/widgets/event_details_description_widget.dart';
import 'package:senpai/screens/event_details/widgets/event_details_header.dart';
import 'package:senpai/screens/event_details/widgets/event_details_members_widget.dart';
import 'package:senpai/screens/event_details/widgets/event_details_paid_widget.dart';
import 'package:senpai/screens/events_list/widgets/event_map_widget.dart';
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
                  fullAddress: bloc.eventModel?.fullAddress ?? '',
                ),
                SizedBox(height: $constants.insets.sm),
                const EventDetailsMembersWidget(),
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
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLocationEvent(
    BuildContext context, {
    required String lonLat,
    required String fullAddress,
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
          _buildLocationTitle(context, fullAddress),
          SizedBox(height: $constants.insets.sm),
          ClipRRect(
            borderRadius: BorderRadius.circular($constants.insets.md),
            child: SizedBox(
              height: $constants.events.eventDetailsLocationHeight,
              child: EventMapWidget(
                eventCoordinates: stringToLatLng(lonLat),
              ),
            ),
          ),
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
        Flexible(
          child: RichText(
            text: TextSpan(
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
      ],
    );
  }
}