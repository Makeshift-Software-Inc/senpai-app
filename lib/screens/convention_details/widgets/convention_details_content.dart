import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:senpai/data/path_constants.dart';
import 'package:senpai/l10n/resources.dart';
import 'package:senpai/screens/convention_details/widgets/associated_events.dart';
import 'package:senpai/screens/event_details/bloc/event_details_bloc.dart';
import 'package:senpai/screens/event_details/page/event_map_page.dart';
import 'package:senpai/screens/event_details/widgets/event_details_description_widget.dart';
import 'package:senpai/screens/event_details/widgets/event_details_header.dart';
import 'package:senpai/screens/new_event/enums/new_event_enums.dart';
import 'package:senpai/utils/constants.dart';
import 'package:senpai/utils/methods/utils.dart';

class ConventionDetailsContent extends StatelessWidget {
  const ConventionDetailsContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EventDetailsBloc, EventDetailsState>(
        builder: (context, state) {
      final bloc = BlocProvider.of<EventDetailsBloc>(context);
      if (bloc.conventionModel == null) {
        return const SizedBox();
      }

      return _buildConventionsContent(context);
    });
  }

  Widget _buildConventionsContent(BuildContext context) {
    final bloc = BlocProvider.of<EventDetailsBloc>(context);
    final conventionModel = bloc.conventionModel!;
    return Padding(
      padding: EdgeInsets.all($constants.insets.sm),
      child: SingleChildScrollView(
        child: Column(
          children: [
            _buildImageWidget(context),
            SizedBox(height: $constants.insets.sm),
            EventDetailsDescriptionWidget(
              description: conventionModel.description ?? '',
            ),
            SizedBox(height: $constants.insets.sm),
            _buildLocationEvent(
              context,
              lonLat: conventionModel.lonlat ?? '',
              venue: conventionModel.fullAddress ?? '',
            ),
            SizedBox(height: $constants.insets.sm),
            const AssociatedEvents(),
          ],
        ),
      ),
    );
  }

  Widget _buildImageWidget(BuildContext context) {
    final bloc = BlocProvider.of<EventDetailsBloc>(context);
    final conventionModel = bloc.conventionModel!;
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
              image: NetworkImage(conventionModel.coverImageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned.fill(
          bottom: 0,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: EventDetailsHeader(
              title: conventionModel.title,
              subtitle:
                  '${conventionModel.displayCity}, ${conventionModel.displayState}',
              startDate: conventionModel.startDate,
              cosplayStatus: CosplayStatus.required,
              additionalInfomationWidget: _buildWebsiteWidget(context),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildWebsiteWidget(BuildContext context) {
    final bloc = BlocProvider.of<EventDetailsBloc>(context);
    final conventionModel = bloc.conventionModel!;

    if (conventionModel.website == null ||
        conventionModel.website?.isEmpty == true) {
      return const SizedBox();
    }

    return Row(
      children: [
        Container(
          padding: EdgeInsets.all($constants.insets.xs),
          margin: EdgeInsets.only(right: $constants.insets.xxs),
          decoration: BoxDecoration(
            color: $constants.palette.black,
            shape: BoxShape.circle,
          ),
          child: SvgPicture.asset(
            PathConstants.eventWebsiteIcon,
            width: $constants.insets.sm,
            height: $constants.insets.sm,
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: $constants.insets.sm,
            vertical: $constants.insets.xxs,
          ),
          decoration: BoxDecoration(
            color: $constants.palette.black,
            borderRadius: BorderRadius.circular($constants.corners.xlg),
          ),
          child: Text(
            conventionModel.website!,
            style: getTextTheme(context).displaySmall!.copyWith(
                  color: $constants.palette.white,
                ),
          ),
        )
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
          _buildLocationTitle(context, venue),
          SizedBox(height: $constants.insets.sm),
          ClipRRect(
            borderRadius: BorderRadius.circular($constants.insets.md),
            child: SizedBox(
              height: $constants.events.eventDetailsLocationHeight,
              child: EventMapPage(
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
      ],
    );
  }
}
