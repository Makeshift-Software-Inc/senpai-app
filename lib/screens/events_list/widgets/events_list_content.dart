import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fresh_graphql/fresh_graphql.dart';
import 'package:senpai/core/events/blocs/fetch_conventions/fetch_conventions_bloc.dart';
import 'package:senpai/core/events/blocs/fetch_events/fetch_events_bloc.dart';
import 'package:senpai/core/graphql/blocs/query/query_bloc.dart';
import 'package:senpai/core/widgets/loading.dart';
import 'package:senpai/data/path_constants.dart';
import 'package:senpai/dependency_injection/injection.dart';
import 'package:senpai/l10n/resources.dart';
import 'package:senpai/models/auth/auth_model.dart';
import 'package:senpai/models/events/convention/convention_model.dart';
import 'package:senpai/models/events/event/event_model.dart';
import 'package:senpai/routes/app_router.dart';
import 'package:senpai/screens/events_list/bloc/events_list_bloc.dart';
import 'package:senpai/screens/events_list/widgets/empty_events_widget.dart';
import 'package:senpai/screens/events_list/widgets/event_list_tile.dart';
import 'package:senpai/utils/constants.dart';
import 'package:senpai/utils/helpers/snack_bar_helpers.dart';
import 'package:senpai/utils/methods/aliases.dart';
import 'package:senpai/utils/methods/utils.dart';

enum EventsListType { normal, conventions, yourEvents }

class EventsListContent extends StatefulWidget {
  const EventsListContent({super.key});

  @override
  State<StatefulWidget> createState() => _EventsListContentState();
}

class _EventsListContentState extends State<EventsListContent> {
  final ValueNotifier<EventsListType> eventsListType =
      ValueNotifier(EventsListType.normal);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Builder(builder: (context) {
      return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (_) => EventsListBloc()..add(OnLoadEventList(1))),
          BlocProvider(
              create: (_) => getIt<FetchEventsBloc>()
                ..fetchEvents(startDate: DateTime.now())),
          BlocProvider(create: (_) => getIt<FetchConventionsBloc>()),
        ],
        child: Stack(
          children: [
            BlocBuilder<EventsListBloc, EventsListState>(
                builder: (context, state) {
              return Column(
                children: [
                  _buildHeader(),
                  _buildContent(state),
                ],
              );
            }),
            _buildFetchEventsListeners(),
            _buildFetchConventionsListeners(),
            Align(
                alignment: Alignment.bottomCenter,
                child: _buildCreateEventButton(context)),
          ],
        ),
      );
    }));
  }

  Widget _buildHeader() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.75,
              margin: EdgeInsets.only(
                top: $constants.insets.md,
                left: $constants.insets.sm,
              ),
              child: TextField(
                maxLines: 1,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(right: $constants.insets.xs),
                  hintText: R.strings.searchText,
                  hintStyle: getTextTheme(context)
                      .bodySmall!
                      .apply(color: $constants.palette.darkGrey),
                  enabledBorder: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular($constants.corners.xxl),
                      borderSide:
                          BorderSide(color: $constants.palette.buttonBorder)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular($constants.corners.xxl),
                      borderSide:
                          BorderSide(color: $constants.palette.buttonBorder)),
                  prefixIcon: Icon(
                    Icons.search,
                    color: $constants.palette.white,
                  ),
                ),
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
              valueListenable: eventsListType,
              builder: (context, type, child) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        if (type == EventsListType.normal) return;
                        onNormalEventsTapped(context);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: $constants.insets.sm,
                            vertical: $constants.insets.xs),
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular($constants.corners.xlg),
                            color: type == EventsListType.normal
                                ? $constants.palette.white
                                : $constants.palette.black,
                            border: Border.all(
                                color: $constants.palette.buttonBorder)),
                        child: Text(
                          R.strings.normalEvents,
                          style: getTextTheme(context).headlineSmall!.copyWith(
                              color: type == EventsListType.normal
                                  ? $constants.palette.black
                                  : $constants.palette.white,
                              fontSize: 14),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        if (type == EventsListType.conventions) return;
                        onConventionsTapped(context);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: $constants.insets.sm,
                            vertical: $constants.insets.xs),
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular($constants.corners.xlg),
                            color: type == EventsListType.conventions
                                ? $constants.palette.white
                                : $constants.palette.black,
                            border: Border.all(
                                color: $constants.palette.buttonBorder)),
                        child: Text(
                          R.strings.conventionsText,
                          style: getTextTheme(context).headlineSmall!.copyWith(
                              color: type == EventsListType.conventions
                                  ? $constants.palette.black
                                  : $constants.palette.white,
                              fontSize: 14),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        if (type == EventsListType.yourEvents) return;
                        onYourEventsTapped(context);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: $constants.insets.sm,
                            vertical: $constants.insets.xs),
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular($constants.corners.xlg),
                          border: Border.all(
                              color: $constants.palette.buttonBorder),
                          gradient: type == EventsListType.yourEvents
                              ? $constants.palette.mainGradient
                              : null,
                          color: type == EventsListType.yourEvents
                              ? $constants.palette.white
                              : $constants.palette.black,
                        ),
                        child: Text(
                          R.strings.yourEvents,
                          style: getTextTheme(context).headlineSmall!.copyWith(
                              color: $constants.palette.white, fontSize: 14),
                        ),
                      ),
                    )
                  ],
                );
              }),
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
          return Flexible(
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
                  );
                }),
          );
        case LoadedConventionsListState:
          final conventionsList =
              (state as LoadedConventionsListState).conventionsList;
          return Flexible(
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
                  );
                }),
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

  Widget _buildFetchEventsListeners() {
    return BlocListener<FetchEventsBloc, QueryState>(
      listener: (context, state) {
        state.whenOrNull(
          loading: (result) {},
          error: (error, result) {
            showSnackBarError(context, R.strings.serverError);
          },
          loaded: (data, result) {
            final response = result.data;
            if (response == null) {
              showSnackBarError(context, R.strings.nullUser);
              logIt.wtf("A successful empty response just got set events");
              return;
            }
            List<dynamic>? events;
            try {
              events = response["fetchEvents"];
              final eventsList =
                  events!.map((e) => EventModel.fromJson(e)).toList();
              final bloc = BlocProvider.of<EventsListBloc>(context);
              if (eventsListType.value == EventsListType.normal) {
                bloc.add(OnEventsListLoaded(eventsList));
              } else if (eventsListType.value == EventsListType.yourEvents) {
                bloc.add(OnYourEventsListLoaded(eventsList));
              }
            } catch (e) {
              logIt.error("Error accessing FetchEvents from response: $e");
              events = null;
            }
            if (events == null) {
              showSnackBarError(context, R.strings.serverError);
              logIt.error("A FetchEvents with error");
            }
          },
        );
      },
      child: BlocBuilder<FetchEventsBloc, QueryState>(
        builder: (context, state) {
          return state.maybeWhen<Widget>(
            loading: (result) => const SenpaiLoading(),
            orElse: () => const SizedBox.shrink(),
          );
        },
      ),
    );
  }

  Widget _buildFetchConventionsListeners() {
    return BlocListener<FetchConventionsBloc, QueryState>(
      listener: (context, state) {
        state.whenOrNull(
          loading: (result) {},
          error: (error, result) {
            showSnackBarError(context, R.strings.serverError);
          },
          loaded: (data, result) {
            final response = result.data;
            if (response == null) {
              showSnackBarError(context, R.strings.nullUser);
              logIt.wtf("A successful empty response just got set conventions");
              return;
            }
            List<dynamic>? conventions;
            try {
              conventions = response["fetchConventions"];
              final conventionsList =
                  conventions!.map((e) => ConventionModel.fromJson(e)).toList();
              final bloc = BlocProvider.of<EventsListBloc>(context);
              bloc.add(OnConventionsListLoaded(conventionsList));
            } catch (e) {
              logIt.error("Error accessing FetchConventions from response: $e");
              conventions = null;
            }
            if (conventions == null) {
              showSnackBarError(context, R.strings.serverError);
              logIt.error("A FetchConventions with error");
            }
          },
        );
      },
      child: BlocBuilder<FetchConventionsBloc, QueryState>(
        builder: (context, state) {
          return state.maybeWhen<Widget>(
            loading: (result) => const SenpaiLoading(),
            orElse: () => const SizedBox.shrink(),
          );
        },
      ),
    );
  }

  Widget _buildCreateEventButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.router.push(
          const NewEventRoute(),
        );
      },
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          SvgPicture.asset(
            PathConstants.eventButtonIcon,
            height: $constants.corners.xxl,
          ),
          Text(
            R.strings.createEventTitle,
            style: getTextTheme(context).bodyMedium?.copyWith(
                color: $constants.palette.white, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }

  void onNormalEventsTapped(BuildContext context) {
    eventsListType.value = EventsListType.normal;
    final eventsListBloc = context.read<EventsListBloc>();
    if (eventsListBloc.eventsList.isNotEmpty) {
      eventsListBloc.add(OnEventsListLoaded(const []));
    } else {
      final fetchEventsBloc = BlocProvider.of<FetchEventsBloc>(context);
      fetchEventsBloc.fetchEvents(startDate: DateTime.now());
    }
  }

  void onConventionsTapped(BuildContext context) {
    eventsListType.value = EventsListType.conventions;
    final eventsListBloc = context.read<EventsListBloc>();
    if (eventsListBloc.conventionsList.isNotEmpty) {
      eventsListBloc.add(OnConventionsListLoaded(const []));
    } else {
      final fetchConventionsBloc =
          BlocProvider.of<FetchConventionsBloc>(context);
      fetchConventionsBloc.fetchConventions(startDate: DateTime.now());
    }
  }

  Future<void> onYourEventsTapped(BuildContext context) async {
    eventsListType.value = EventsListType.yourEvents;
    final eventsListBloc = context.read<EventsListBloc>();
    if (eventsListBloc.yourEventsList.isNotEmpty) {
      eventsListBloc.add(OnEventsListLoaded(const []));
    } else {
      final fetchEventsBloc = BlocProvider.of<FetchEventsBloc>(context);
      final storage = getIt<TokenStorage<AuthModel>>();
      final userData = await storage.read();
      if (userData != null) {
        fetchEventsBloc.fetchEvents(
            startDate: DateTime.now(), userId: userData.user.id);
      }
    }
  }

  @override
  void dispose() {
    eventsListType.dispose();
    super.dispose();
  }
}
