import 'package:auto_route/auto_route.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_graphql/fresh_graphql.dart';
import 'package:senpai/core/events/blocs/fetch_conventions/fetch_conventions_bloc.dart';
import 'package:senpai/core/events/blocs/fetch_events/fetch_events_bloc.dart';
import 'package:senpai/core/user/blocs/fetch_user/fetch_user_bloc.dart';
import 'package:senpai/core/widgets/icon_input.dart';
import 'package:senpai/data/path_constants.dart';
import 'package:senpai/dependency_injection/injection.dart';
import 'package:senpai/l10n/resources.dart';
import 'package:senpai/models/auth/auth_model.dart';
import 'package:senpai/routes/app_router.dart';
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
  final searchController = TextEditingController();
  final eventScrollController = ScrollController();
  final conventionScrollController = ScrollController();
  final yourEventsScrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    addScrollListeners();
  }

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
                      onNormalEventsTapped(
                        context,
                        needToLoad: bloc.eventsList.isEmpty ||
                            searchController.text.isNotEmpty,
                        isRefresh: searchController.text.isNotEmpty,
                      );
                    },
                  ),
                  SizedBox(width: $constants.insets.xs),
                  _buildItemEventType(
                    title: R.strings.conventionsText,
                    type: EventsListType.conventions,
                    selectedType: type,
                    onTap: () {
                      if (type == EventsListType.conventions) return;
                      onConventionsTapped(
                        context,
                        needToLoad: bloc.conventionsList.isEmpty ||
                            searchController.text.isNotEmpty,
                        isRefresh: searchController.text.isNotEmpty,
                      );
                    },
                  ),
                  SizedBox(width: $constants.insets.xs),
                  _buildItemEventType(
                    title: R.strings.yourEvents,
                    type: EventsListType.yourEvents,
                    selectedType: type,
                    onTap: () {
                      if (type == EventsListType.yourEvents) return;
                      onYourEventsTapped(context,
                          needToLoad: bloc.yourEventsList.isEmpty ||
                              searchController.text.isNotEmpty,
                          isRefresh: searchController.text.isNotEmpty);
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
                  controller: eventScrollController,
                  shrinkWrap: true,
                  padding: EdgeInsets.only(bottom: $constants.insets.xl),
                  itemBuilder: (_, i) {
                    final event = eventsList[i];
                    return GestureDetector(
                      onTap: () {
                        context.router.push(EventsDetailsRoute(
                          eventId: event.id,
                          eventName: event.title,
                        ));
                      },
                      child: EventListTile(
                        coverImageUrl: event.coverImageUrl,
                        startDate: event.startDate,
                        title: event.title,
                        city: event.displayCity ?? '',
                        state: event.displayState ?? '',
                        paymentRequired: event.paymentRequired ?? false,
                        cosplayRequired: event.cosplayRequired,
                      ),
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
                  controller: conventionScrollController,
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
                      paymentRequired: convention.paymentRequired ?? false,
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

  void onNormalEventsTapped(BuildContext context,
      {bool isRefresh = false, bool needToLoad = true}) {
    final eventsListBloc = context.read<EventsListBloc>();
    eventsListBloc.eventsListType.value = EventsListType.normal;
    if (isRefresh) {
      eventsListBloc.eventsList.clear();
      eventsListBloc.eventsPage = 1;
    }
    if (needToLoad) {
      final fetchEventsBloc = BlocProvider.of<FetchEventsBloc>(context);
      fetchEventsBloc.fetchEvents(
          startDate: DateTime.now(),
          page: eventsListBloc.eventsPage,
          searchText: searchController.text);
    } else {
      eventsListBloc.add(OnEventsListLoaded(const []));
    }
  }

  void onConventionsTapped(BuildContext context,
      {bool isRefresh = false, bool needToLoad = true}) {
    final eventsListBloc = context.read<EventsListBloc>();
    eventsListBloc.eventsListType.value = EventsListType.conventions;
    if (isRefresh) {
      eventsListBloc.conventionsList.clear();
      eventsListBloc.conventionsPage = 1;
    }
    if (needToLoad) {
      final fetchConventionsBloc =
          BlocProvider.of<FetchConventionsBloc>(context);
      fetchConventionsBloc.fetchConventions(
          startDate: DateTime.now(),
          page: eventsListBloc.conventionsPage,
          searchText: searchController.text);
    } else {
      eventsListBloc.add(OnConventionsListLoaded(const []));
    }
  }

  Future<void> onYourEventsTapped(BuildContext context,
      {bool isRefresh = false, bool needToLoad = true}) async {
    final eventsListBloc = context.read<EventsListBloc>();
    eventsListBloc.eventsListType.value = EventsListType.yourEvents;
    if (isRefresh) {
      eventsListBloc.yourEventsList.clear();
      eventsListBloc.yourEventsPage = 1;
    }
    if (needToLoad) {
      final fetchUserBloc = BlocProvider.of<FetchUserBloc>(context);
      final storage = getIt<TokenStorage<AuthModel>>();
      final userData = await storage.read();
      fetchUserBloc.fetchUser(
          userId: int.parse(userData?.user.id ?? '0'),
          page: eventsListBloc.yourEventsPage);
    } else {
      eventsListBloc.add(OnYourEventsListLoaded(const []));
    }
  }

  Widget _buildSearch(BuildContext context) {
    return SenpaiIconInput(
      hintText: R.strings.searchText,
      borderRadius: $constants.corners.xxl,
      controller: searchController,
      onChange: (String search) {
        if (searchController.text.length > 2 || searchController.text.isEmpty) {
          EasyDebounce.debounce(
            $constants.events.searchTag,
            Duration(milliseconds: $constants.times.fast.inMilliseconds),
            () {
              final eventsListBloc = context.read<EventsListBloc>();
              eventsListBloc.eventsList.clear();
              eventsListBloc.conventionsList.clear();
              eventsListBloc.yourEventsList.clear();
              eventsListBloc.eventsPage = 1;
              eventsListBloc.conventionsPage = 1;
              eventsListBloc.yourEventsPage = 1;
              switch (eventsListBloc.eventsListType.value) {
                case EventsListType.normal:
                  onNormalEventsTapped(context);
                  break;
                case EventsListType.conventions:
                  onConventionsTapped(context);
                  break;
                case EventsListType.yourEvents:
                  onYourEventsTapped(context);
                  break;
              }
            },
          );
        }
      },
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

  void addScrollListeners() {
    eventScrollController.addListener(() {
      if (eventScrollController.position.pixels ==
          eventScrollController.position.maxScrollExtent) {
        final eventsListBloc = context.read<EventsListBloc>();
        final needToLoadMoreEvents = eventsListBloc.eventsList.length % 10 == 0;
        if (needToLoadMoreEvents) {
          eventsListBloc.eventsPage++;
          onNormalEventsTapped(context);
        }
      }
    });

    conventionScrollController.addListener(() {
      if (conventionScrollController.position.pixels ==
          conventionScrollController.position.maxScrollExtent) {
        final eventsListBloc = context.read<EventsListBloc>();
        final needToLoadMoreConventions =
            eventsListBloc.conventionsList.length % 10 == 0;
        if (needToLoadMoreConventions) {
          eventsListBloc.conventionsPage++;
          onConventionsTapped(context);
        }
      }
    });

    yourEventsScrollController.addListener(() {
      if (yourEventsScrollController.position.pixels ==
          yourEventsScrollController.position.maxScrollExtent) {
        final eventsListBloc = context.read<EventsListBloc>();
        final needToLoadMoreYourEvents =
            eventsListBloc.yourEventsList.length % 10 == 0;
        if (needToLoadMoreYourEvents) {
          eventsListBloc.yourEventsPage++;
          onYourEventsTapped(context);
        }
      }
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    eventScrollController.dispose();
    conventionScrollController.dispose();
    yourEventsScrollController.dispose();
    super.dispose();
  }
}
