import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:senpai/core/events/blocs/fetch_conventions/fetch_conventions_bloc.dart';
import 'package:senpai/core/events/blocs/fetch_events/fetch_events_bloc.dart';
import 'package:senpai/core/graphql/blocs/query/query_bloc.dart';
import 'package:senpai/core/user/blocs/fetch_user/fetch_user_bloc.dart';
import 'package:senpai/core/widgets/loading.dart';
import 'package:senpai/core/widgets/senpai_app_bar.dart';
import 'package:senpai/data/path_constants.dart';
import 'package:senpai/dependency_injection/injection.dart';
import 'package:senpai/l10n/resources.dart';
import 'package:senpai/models/events/convention/convention_model.dart';
import 'package:senpai/models/events/event/event_model.dart';
import 'package:senpai/routes/app_router.dart';
import 'package:senpai/screens/events_list/bloc/events_list_bloc.dart';
import 'package:senpai/screens/events_list/widgets/events_list_content.dart';
import 'package:senpai/utils/constants.dart';
import 'package:senpai/utils/helpers/snack_bar_helpers.dart';
import 'package:senpai/utils/methods/aliases.dart';
import 'package:senpai/utils/methods/utils.dart';

@RoutePage()
class EventsListPage extends StatelessWidget {
  const EventsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => EventsListBloc()..add(OnLoadEventList(1))),
        BlocProvider(
            create: (_) => getIt<FetchEventsBloc>()
              ..fetchEvents(startDate: DateTime.now(), page: 1)),
        BlocProvider(create: (_) => getIt<FetchConventionsBloc>()),
        BlocProvider(create: (_) => getIt<FetchUserBloc>()),
      ],
      child: Scaffold(
        backgroundColor: $constants.palette.darkBlue,
        appBar: SenpaiAppBar(
          title: R.strings.eventsConventionsTitle,
          hasLeading: false,
        ),
        // Herbert Joseph 11.03
        // Just a note: until Events & Conventions are fully complete,
        // let's leave the Events tab as "To be Implemented"
        // body: const EventsListContent(),
        body: Stack(
          children: [
            const EventsListContent(),
            _buildFetchEventsListeners(),
            _buildFetchConventionsListeners(),
            _buildFetchYourEventsListener(),
            Align(
                alignment: Alignment.bottomCenter,
                child: _buildCreateEventButton(context)),
          ],
        ),
      ),
    );
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
              bloc.add(OnEventsListLoaded(eventsList));
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

  Widget _buildFetchYourEventsListener() {
    return BlocListener<FetchUserBloc, QueryState>(
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
              logIt.wtf("A successful empty response just got set your events");
              return;
            }
            List<dynamic>? events;
            try {
              events = response["fetchUser"]["events"];
              final eventsList =
                  events!.map((e) => EventModel.fromJson(e)).toList();
              final bloc = BlocProvider.of<EventsListBloc>(context);
              bloc.add(OnYourEventsListLoaded(eventsList));
            } catch (e) {
              logIt.error("Error accessing FetchYourEvents from response: $e");
              events = null;
            }
            if (events == null) {
              showSnackBarError(context, R.strings.serverError);
              logIt.error("A FetchYourEvents with error");
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

  Widget _buildCreateEventButton(BuildContext context) {
    return BlocBuilder<EventsListBloc, EventsListState>(
      builder: (context, state) {
        final bloc = BlocProvider.of<EventsListBloc>(context);
        if (bloc.eventsListType.value == EventsListType.yourEvents) {
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
                      color: $constants.palette.white,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
