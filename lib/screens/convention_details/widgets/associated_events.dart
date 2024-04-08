import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:senpai/core/widgets/events/folder_background.dart';
import 'package:senpai/l10n/resources.dart';
import 'package:senpai/models/events/event/event_model.dart';
import 'package:senpai/routes/app_router.dart';
import 'package:senpai/screens/convention_details/bloc/associated_events_bloc/associated_events_bloc.dart';
import 'package:senpai/screens/event_details/bloc/event_details_bloc.dart';
import 'package:senpai/screens/events_list/bloc/events_list_bloc.dart';
import 'package:senpai/screens/events_list/widgets/empty_events_widget.dart';
import 'package:senpai/screens/events_list/widgets/event_list_tile.dart';
import 'package:senpai/utils/constants.dart';
import 'package:senpai/utils/methods/utils.dart';

class AssociatedEvents extends StatelessWidget {
  const AssociatedEvents({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AssociatedEventsFilterCubit,
        AssociatedEventsFilterState>(
      builder: (context, state) {
        return FolderBackground(
          width: getSize(context).width * 0.5,
          height: 80,
          child: Container(
            padding: EdgeInsets.all($constants.insets.sm),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  R.strings.associatedEventsTitle,
                  style: getTextTheme(context).headlineSmall,
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: $constants.insets.lg),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _buildFilterButton(context,
                        title: R.strings.openInvitesFilterTitle,
                        isActive: state == AssociatedEventsFilterState.open,
                        onTap: () {
                      context
                          .read<AssociatedEventsFilterCubit>()
                          .setFilterToOpen();
                    }),
                    SizedBox(width: $constants.insets.sm),
                    _buildFilterButton(context,
                        title: R.strings.closedInvitesFilterTitle,
                        isActive: state == AssociatedEventsFilterState.filled,
                        onTap: () {
                      context
                          .read<AssociatedEventsFilterCubit>()
                          .setFilterToFilled();
                    }),
                  ],
                ),
                SizedBox(height: $constants.insets.sm),
                _buildAssociatedEvents(context),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildFilterButton(
    BuildContext context, {
    required bool isActive,
    required String title,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: $constants.insets.sm,
          vertical: $constants.insets.xs,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular($constants.corners.xlg),
          color: isActive ? $constants.palette.white : $constants.palette.black,
          border: Border.all(
            color: $constants.palette.buttonBorder,
          ),
        ),
        child: Text(
          title,
          style: getTextTheme(context).headlineSmall!.copyWith(
                color: isActive
                    ? $constants.palette.black
                    : $constants.palette.white,
                fontSize: 14,
              ),
        ),
      ),
    );
  }

  Widget _buildAssociatedEvents(BuildContext context) {
    return BlocBuilder<AssociatedEventsFilterCubit,
        AssociatedEventsFilterState>(builder: (context, state) {
      final bloc = BlocProvider.of<EventDetailsBloc>(context);
      if (bloc.conventionModel == null) {
        return const SizedBox();
      }

      final activeFilter = context.read<AssociatedEventsFilterCubit>().state;
      List<EventModel> events = [];
      if (activeFilter == AssociatedEventsFilterState.open) {
        events = bloc.conventionModel!.events
            .where((event) => event.party?.status == "open")
            .toList();
      } else {
        events = bloc.conventionModel!.events
            .where((event) => event.party?.status != "open")
            .toList();
      }

      if (events.isEmpty) {
        return const SizedBox(
          width: double.infinity,
          height: 400,
          child: EmptyEventsWidget(eventsListType: EventsListType.conventions),
        );
      }

      return ListView.builder(
        itemCount: events.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          final event = events[index];
          return GestureDetector(
            onTap: () {
              final bloc = BlocProvider.of<EventsListBloc>(context);
              context.router.push(EventsDetailsRoute(
                eventId: event.id,
                eventName: event.title,
                userId: bloc.userId,
              ));
            },
            child: EventListTile(
              coverImageUrl: event.coverImageUrl,
              startDate: event.startDate,
              title: event.title,
              city: event.displayCity ?? '',
              state: event.displayState ?? '',
              paymentRequired: event.paymentRequired ?? false,
              cosplayStatus: event.cosplayRequired,
            ),
          );
        },
      );
    });
  }
}
