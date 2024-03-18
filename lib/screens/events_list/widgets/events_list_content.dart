import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:fresh_graphql/fresh_graphql.dart';
import 'package:senpai/core/events/blocs/fetch_conventions/fetch_conventions_bloc.dart';
import 'package:senpai/core/events/blocs/fetch_events/fetch_events_bloc.dart';

import 'package:senpai/core/widgets/icon_input.dart';

import 'package:senpai/data/path_constants.dart';
import 'package:senpai/dependency_injection/injection.dart';
import 'package:senpai/l10n/resources.dart';
import 'package:senpai/models/auth/auth_model.dart';

import 'package:senpai/screens/events_list/bloc/events_list_bloc.dart';
import 'package:senpai/screens/events_list/widgets/empty_events_widget.dart';
import 'package:senpai/screens/events_list/widgets/event_list_tile.dart';
import 'package:senpai/utils/constants.dart';

import 'package:senpai/utils/methods/utils.dart';

class EventsListContent extends StatefulWidget {
  const EventsListContent({super.key});

  @override
  State<StatefulWidget> createState() => _EventsListContentState();
}

class _EventsListContentState extends State<EventsListContent> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EventsListBloc, EventsListState>(
      builder: (context, state) {
        return Column(
          children: [
            _buildHeader(),
            _buildContent(state),
          ],
        );
      },
    );
  }

  Widget _buildHeader() {
    final bloc = BlocProvider.of<EventsListBloc>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.only(
                  top: $constants.insets.md,
                  left: $constants.insets.sm,
                ),
                child: _buildSearch(context),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.all($constants.insets.xs),
                margin: EdgeInsets.only(
                  top: $constants.insets.md,
                  left: $constants.insets.sm,
                  right: $constants.insets.sm,
                ),
                decoration: BoxDecoration(
                    border: Border.all(color: $constants.palette.buttonBorder),
                    shape: BoxShape.circle),
                child: Icon(
                  Icons.tune,
                  size: $constants.corners.xl,
                  color: $constants.palette.white,
                ),
              ),
            )
          ],
        ),
        Padding(
          padding: EdgeInsets.only(
              left: $constants.insets.sm,
              right: $constants.insets.sm,
              top: $constants.insets.md,
              bottom: $constants.insets.sm),
          child: ValueListenableBuilder(
            valueListenable: bloc.eventsListType,
            builder: (context, type, child) {
              return Wrap(
                runSpacing: $constants.insets.xs,
                children: [
                  _buildItemEventType(
                    title: R.strings.normalEvents,
                    type: EventsListType.normal,
                    selectedType: type,
                    onTap: () {
                      if (type == EventsListType.normal) return;
                      onNormalEventsTapped(context);
                    },
                  ),
                  SizedBox(width: $constants.insets.xs),
                  _buildItemEventType(
                    title: R.strings.conventionsText,
                    type: EventsListType.conventions,
                    selectedType: type,
                    onTap: () {
                      if (type == EventsListType.conventions) return;
                      onConventionsTapped(context);
                    },
                  ),
                  SizedBox(width: $constants.insets.xs),
                  _buildItemEventType(
                    title: R.strings.yourEvents,
                    type: EventsListType.yourEvents,
                    selectedType: type,
                    onTap: () {
                      if (type == EventsListType.yourEvents) return;
                      onYourEventsTapped(context);
                    },
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildContent(EventsListState state) {
    return Builder(builder: (context) {
      switch (state.runtimeType) {
        case LoadedEventsListState || LoadedYourEventsListState:
          final eventsList = state.runtimeType == LoadedEventsListState
              ? (state as LoadedEventsListState).eventsList
              : (state as LoadedYourEventsListState).eventsList;
          return Expanded(
            child: RefreshIndicator(
              onRefresh: () async => state.runtimeType == LoadedEventsListState
                  ? onNormalEventsTapped(context, isRefresh: true)
                  : onYourEventsTapped(context, isRefresh: true),
              child: ListView.builder(
                  itemCount: eventsList.length,
                  shrinkWrap: true,
                  padding: EdgeInsets.only(bottom: $constants.insets.xl),
                  itemBuilder: (_, i) {
                    final event = eventsList[i];
                    return EventListTile(
                      coverImageUrl: event.coverImageUrl,
                      startDate: event.startDate,
                      title: event.title,
                      city: event.displayCity ?? '',
                      state: event.displayState ?? '',
                      paymentRequired: event.paymentRequired ?? false,
                    );
                  }),
            ),
          );
        case LoadedConventionsListState:
          final conventionsList =
              (state as LoadedConventionsListState).conventionsList;
          return Expanded(
            child: RefreshIndicator(
              onRefresh: () async =>
                  onConventionsTapped(context, isRefresh: true),
              child: ListView.builder(
                  itemCount: conventionsList.length,
                  shrinkWrap: true,
                  padding: EdgeInsets.only(bottom: $constants.insets.xl),
                  itemBuilder: (_, i) {
                    final convention = conventionsList[i];
                    return EventListTile(
                      coverImageUrl: convention.coverImageUrl,
                      startDate: convention.startDate,
                      title: convention.title,
                      city: convention.displayCity ?? '',
                      state: convention.displayState ?? '',
                      paymentRequired: false,
                    );
                  }),
            ),
          );
        case EmptyEventsListState || EmptyConventionsListState:
          return const Expanded(
            child: Center(
              child: EmptyEventsWidget(),
            ),
          );
      }
      return const SizedBox.shrink();
    });
  }

  void onNormalEventsTapped(BuildContext context, {bool isRefresh = false}) {
    final bloc = BlocProvider.of<EventsListBloc>(context);
    bloc.eventsListType.value = EventsListType.normal;
    final eventsListBloc = context.read<EventsListBloc>();
    if (isRefresh) {
      eventsListBloc.eventsList.clear();
      final fetchEventsBloc = BlocProvider.of<FetchEventsBloc>(context);
      fetchEventsBloc.fetchEvents(startDate: DateTime.now());
    } else {
      if (eventsListBloc.eventsList.isNotEmpty) {
        eventsListBloc.add(OnEventsListLoaded(const []));
      } else {
        final fetchEventsBloc = BlocProvider.of<FetchEventsBloc>(context);
        fetchEventsBloc.fetchEvents(startDate: DateTime.now());
      }
    }
  }

  void onConventionsTapped(BuildContext context, {bool isRefresh = false}) {
    final bloc = BlocProvider.of<EventsListBloc>(context);
    bloc.eventsListType.value = EventsListType.conventions;
    final eventsListBloc = context.read<EventsListBloc>();
    if (isRefresh) {
      eventsListBloc.conventionsList.clear();
      final fetchConventionsBloc =
          BlocProvider.of<FetchConventionsBloc>(context);
      fetchConventionsBloc.fetchConventions(startDate: DateTime.now());
    } else {
      if (eventsListBloc.conventionsList.isNotEmpty) {
        eventsListBloc.add(OnConventionsListLoaded(const []));
      } else {
        final fetchConventionsBloc =
            BlocProvider.of<FetchConventionsBloc>(context);
        fetchConventionsBloc.fetchConventions(startDate: DateTime.now());
      }
    }
  }

  Future<void> onYourEventsTapped(BuildContext context,
      {bool isRefresh = false}) async {
    final bloc = BlocProvider.of<EventsListBloc>(context);
    bloc.eventsListType.value = EventsListType.yourEvents;
    final eventsListBloc = context.read<EventsListBloc>();
    if (isRefresh || eventsListBloc.yourEventsList.isEmpty) {
      eventsListBloc.yourEventsList.clear();
      final fetchEventsBloc = BlocProvider.of<FetchEventsBloc>(context);
      final storage = getIt<TokenStorage<AuthModel>>();
      final userData = await storage.read();
      if (userData != null) {
        fetchEventsBloc.fetchEvents(
            startDate: DateTime.now(), userId: userData.user.id);
      }
    } else {
      eventsListBloc.add(OnEventsListLoaded(const []));
    }
  }

  Widget _buildSearch(BuildContext context) {
    return SenpaiIconInput(
      hintText: R.strings.searchText,
      borderRadius: $constants.corners.xxl,
      controller: TextEditingController(),
      onChange: (String search) {},
      iconPath: PathConstants.searchIcon,
      focusNode: FocusNode(),
    );
  }

  Widget _buildItemEventType({
    required EventsListType type,
    required EventsListType selectedType,
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
          color: type == selectedType
              ? $constants.palette.white
              : $constants.palette.black,
          border: Border.all(
            color: $constants.palette.buttonBorder,
          ),
          gradient: type == EventsListType.yourEvents && selectedType == type
              ? $constants.palette.mainGradient
              : null,
        ),
        child: Text(
          title,
          style: getTextTheme(context).headlineSmall!.copyWith(
                color: type == selectedType &&
                        selectedType != EventsListType.yourEvents
                    ? $constants.palette.black
                    : $constants.palette.white,
                fontSize: 14,
              ),
        ),
      ),
    );
  }
}
