import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:senpai/core/events/blocs/fetch_event_details/fetch_event_details_bloc.dart';
import 'package:senpai/core/events/blocs/fetch_convention_details/fetch_convention_details_bloc.dart';

import 'package:senpai/core/graphql/blocs/query/query_bloc.dart';
import 'package:senpai/core/widgets/loading.dart';
import 'package:senpai/core/widgets/senpai_app_bar.dart';
import 'package:senpai/dependency_injection/injection.dart';
import 'package:senpai/l10n/resources.dart';
import 'package:senpai/models/events/convention/convention_model.dart';
import 'package:senpai/models/events/event_details/event_details_model.dart';
import 'package:senpai/screens/event_details/bloc/event_details_bloc.dart';
import 'package:senpai/screens/event_details/widgets/event_details_content.dart';
import 'package:senpai/utils/constants.dart';
import 'package:senpai/utils/helpers/snack_bar_helpers.dart';
import 'package:senpai/utils/methods/aliases.dart';

@RoutePage()
class EventsDetailsPage extends StatelessWidget {
  final String eventName;
  final String eventId;

  const EventsDetailsPage({
    super.key,
    required this.eventId,
    required this.eventName,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => EventDetailsBloc()),
        BlocProvider(
            create: (_) => getIt<FetchEventDetailsBloc>()
              ..fetchEventDetails(eventId: eventId)),
        BlocProvider(create: (_) => getIt<FetchConventionDetailsBloc>()),
      ],
      child: Scaffold(
        backgroundColor: $constants.palette.darkBlue,
        appBar: SenpaiAppBar(
          title: eventName,
          hasLeading: true,
        ),
        body: Stack(
          children: [
            const EventDetailsContent(),
            _buildFetchEventDetailsListeners(),
            _buildFetchConventionDetailsListeners(),
          ],
        ),
      ),
    );
  }

  Widget _buildFetchEventDetailsListeners() {
    return BlocListener<FetchEventDetailsBloc, QueryState>(
      listener: (context, state) {
        state.whenOrNull(
          loading: (result) {},
          error: (error, result) {
            showSnackBarError(context, R.strings.serverError);
          },
          loaded: (data, result) {
            final response = result.data;
            if (response == null) {
              showSnackBarError(context, R.strings.serverError);
              logIt.wtf(
                  "A successful empty response just got set event details");
              return;
            }
            dynamic model;
            try {
              model = response["fetchEvent"];
              EventDetailsModel event = EventDetailsModel.fromJson(model);
              final bloc = BlocProvider.of<EventDetailsBloc>(context);
              bloc.add(OnInitEventDetails(event, eventId));
              if (event.conventionId != null) {
                final serverBloc =
                    BlocProvider.of<FetchConventionDetailsBloc>(context);
                serverBloc.fetchConventionDetails(
                  conventionId: event.conventionId!.toString(),
                );
              }
            } catch (e) {
              logIt.error("Error accessing FetchEvent from response: $e");
              model = null;
            }
            if (model == null) {
              showSnackBarError(context, R.strings.serverError);
              logIt.error("A FetchEvent with error");
            }
          },
        );
      },
      child: BlocBuilder<FetchEventDetailsBloc, QueryState>(
        builder: (context, state) {
          return state.maybeWhen<Widget>(
            loading: (result) => const SenpaiLoading(),
            orElse: () => const SizedBox.shrink(),
          );
        },
      ),
    );
  }

  Widget _buildFetchConventionDetailsListeners() {
    return BlocListener<FetchConventionDetailsBloc, QueryState>(
      listener: (context, state) {
        state.whenOrNull(
          loading: (result) {},
          error: (error, result) {
            showSnackBarError(context, R.strings.serverError);
          },
          loaded: (data, result) {
            final response = result.data;
            if (response == null) {
              showSnackBarError(context, R.strings.serverError);
              logIt.wtf(
                  "A successful empty response just got set Convention details");
              return;
            }
            dynamic model;
            try {
              model = response["fetchConvention"];
              ConventionModel convention = ConventionModel.fromJson(model);
              final bloc = BlocProvider.of<EventDetailsBloc>(context);
              bloc.add(OnInitConventionDetails(convention));
            } catch (e) {
              logIt.error("Error accessing FetchConvention from response: $e");
              model = null;
            }
            if (model == null) {
              showSnackBarError(context, R.strings.serverError);
              logIt.error("A FetchConvention with error");
            }
          },
        );
      },
      child: BlocBuilder<FetchConventionDetailsBloc, QueryState>(
        builder: (context, state) {
          return state.maybeWhen<Widget>(
            loading: (result) => const SenpaiLoading(),
            orElse: () => const SizedBox.shrink(),
          );
        },
      ),
    );
  }
}
