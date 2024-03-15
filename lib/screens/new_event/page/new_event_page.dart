import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:senpai/core/events/blocs/create_event/create_event_bloc.dart';
import 'package:senpai/core/events/blocs/fetch_conventions/fetch_conventions_bloc.dart';
import 'package:senpai/core/graphql/blocs/mutation/mutation_bloc.dart';
import 'package:senpai/core/graphql/blocs/query/query_bloc.dart';
import 'package:senpai/core/widgets/loading.dart';
import 'package:senpai/core/widgets/senpai_app_bar.dart';
import 'package:senpai/dependency_injection/injection.dart';
import 'package:senpai/l10n/resources.dart';
import 'package:senpai/models/events/convention/convention_model.dart';
import 'package:senpai/screens/new_event/bloc/new_event_bloc.dart';
import 'package:senpai/screens/new_event/bloc/new_event_convention_bloc/new_event_convention_bloc.dart';

import 'package:senpai/screens/new_event/widgets/new_event_content.dart';
import 'package:senpai/utils/constants.dart';
import 'package:senpai/utils/helpers/snack_bar_helpers.dart';
import 'package:senpai/utils/methods/aliases.dart';

@RoutePage()
class NewEventPage extends StatelessWidget {
  const NewEventPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => NewEventBloc()..add(OnInitNewEvent())),
        BlocProvider(create: (_) => NewEventConventionBloc()),
        BlocProvider(create: (_) => getIt<CreateEventBloc>()),
        BlocProvider(
            create: (_) => getIt<FetchConventionsBloc>()
              ..fetchConventions(startDate: DateTime.now())),
      ],
      child: Scaffold(
        backgroundColor: $constants.palette.darkBlue,
        appBar: SenpaiAppBar(
          title: R.strings.createEventTitle,
        ),
        body: Stack(
          children: [
            const SafeArea(child: NewEventContent()),
            _buildCreateEventListeners(),
            _buildFetchConventionsListeners(),
          ],
        ),
      ),
    );
  }

  Widget _buildCreateEventListeners() {
    return BlocListener<CreateEventBloc, MutationState>(
      listener: (context, state) {
        state.whenOrNull(
          failed: (error, result) {
            showSnackBarError(context, R.strings.serverError);
          },
          succeeded: (data, result) {
            final response = result.data;
            if (response == null) {
              logIt.wtf("A successful empty response just got set event");
              return;
            }
            dynamic model;
            try {
              model = response["createEvent"]["event"];
              context.router.pop();
            } catch (e) {
              logIt.error(
                  "Error accessing createEvent or event from response: $e");
              model = null;
            }
            if (model == null) {
              showSnackBarError(context, R.strings.serverError);
              logIt.error("A event with error");
            }
          },
        );
      },
      child: BlocBuilder<CreateEventBloc, MutationState>(
        builder: (context, state) {
          return state.maybeWhen<Widget>(
            loading: () => const SenpaiLoading(),
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
              final bloc = BlocProvider.of<NewEventConventionBloc>(context);
              bloc.add(OnInitNewEventConvention(conventionsList));
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
}
