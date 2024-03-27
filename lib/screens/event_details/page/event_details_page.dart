import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:senpai/core/events/blocs/fetch_event_details/fetch_event_details_bloc.dart';
import 'package:senpai/core/events/blocs/fetch_convention_details/fetch_convention_details_bloc.dart';
import 'package:senpai/core/events/blocs/join_request/create_join_request_bloc.dart';
import 'package:senpai/core/events/blocs/join_request/fetch_join_requests_bloc.dart';
import 'package:senpai/core/graphql/blocs/mutation/mutation_bloc.dart';

import 'package:senpai/core/graphql/blocs/query/query_bloc.dart';
import 'package:senpai/core/user/blocs/fetch_user/fetch_user_bloc.dart';
import 'package:senpai/core/widgets/loading.dart';
import 'package:senpai/core/widgets/senpai_app_bar.dart';
import 'package:senpai/dependency_injection/injection.dart';
import 'package:senpai/l10n/resources.dart';
import 'package:senpai/models/events/convention/convention_model.dart';
import 'package:senpai/models/events/event_details/event_details_model.dart';
import 'package:senpai/models/events/join_request/join_request_model.dart';
import 'package:senpai/models/user_profile/user_profile_model.dart';
import 'package:senpai/screens/event_details/bloc/event_details_bloc.dart';
import 'package:senpai/screens/event_details/widgets/event_details_content.dart';
import 'package:senpai/screens/event_details/widgets/join_request_success_dialog.dart';
import 'package:senpai/utils/constants.dart';
import 'package:senpai/utils/helpers/snack_bar_helpers.dart';
import 'package:senpai/utils/methods/aliases.dart';

@RoutePage()
class EventsDetailsPage extends StatelessWidget {
  final String eventName;
  final String eventId;
  final String userId;

  const EventsDetailsPage({
    super.key,
    required this.eventId,
    required this.eventName,
    required this.userId,
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
        BlocProvider(create: (_) => getIt<FetchUserBloc>()),
        BlocProvider(create: (_) => getIt<CreateJoinRequestBloc>()),
        BlocProvider(create: (_) {
          return getIt<FetchJoinRequestsBloc>()
            ..fetchJoinRequests(eventId: eventId, applicantId: userId);
        }),
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
            _buildFetchUserListeners(),
            _buildFetchJoinRequestsListeners(),
            _buildCreateJoinRequestListeners(),
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

              if (event.hostId != null) {
                final serverBloc = BlocProvider.of<FetchUserBloc>(context);
                serverBloc.fetchUser(
                  userId: event.hostId!,
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

  Widget _buildFetchUserListeners() {
    return BlocListener<FetchUserBloc, QueryState>(
      listener: (context, state) {
        state.whenOrNull(
          error: (error, result) {
            showSnackBarError(context, R.strings.serverError);
          },
          loaded: (data, result) {
            final response = result.data;
            if (response == null) {
              showSnackBarError(context, R.strings.nullUser);
              logIt.wtf("A successful empty response just got set user");
              return;
            }
            UserProfileModel? user;
            try {
              user = UserProfileModel.fromJson(result.data!["fetchUser"]);
              final bloc = BlocProvider.of<EventDetailsBloc>(context);
              bloc.add(OnInitHostModelDetails(user));
            } catch (e) {
              logIt.error("Error accessing fetchUser from response: $e");
              user = null;
            }
            if (user == null) {
              showSnackBarError(context, R.strings.nullUser);
              logIt.error("A user with error");
            }
          },
        );
      },
      child: BlocBuilder<FetchUserBloc, QueryState>(
        builder: (context, state) {
          return state.maybeWhen<Widget>(
            loading: (result) => const SenpaiLoading(),
            orElse: () => const SizedBox.shrink(),
          );
        },
      ),
    );
  }

  Widget _buildFetchJoinRequestsListeners() {
    return BlocListener<FetchJoinRequestsBloc, QueryState>(
      listener: (context, state) {
        state.whenOrNull(
          error: (error, result) {
            showSnackBarError(context, R.strings.serverError);
          },
          loaded: (data, result) {
            final response = result.data;
            if (response == null) {
              showSnackBarError(context, R.strings.serverError);
              logIt.wtf("A successful empty response just got set requests");
              return;
            }
            List<dynamic>? requests;
            try {
              requests = result.data!["fetchJoinRequests"];
              final requestsList =
                  requests!.map((e) => JoinRequestModel.fromJson(e)).toList();
              final bloc = BlocProvider.of<EventDetailsBloc>(context);
              bloc.add(OnFetchJoinRequest(requestsList));
            } catch (e) {
              logIt
                  .error("Error accessing fetchJoinRequests from response: $e");
              requests = null;
            }
            if (requests == null) {
              showSnackBarError(context, R.strings.serverError);
              logIt.error("A fetchJoinRequests with error");
            }
          },
        );
      },
      child: BlocBuilder<FetchJoinRequestsBloc, QueryState>(
        builder: (context, state) {
          return state.maybeWhen<Widget>(
            loading: (result) => const SenpaiLoading(),
            orElse: () => const SizedBox.shrink(),
          );
        },
      ),
    );
  }

  Widget _buildCreateJoinRequestListeners() {
    return BlocListener<CreateJoinRequestBloc, MutationState>(
      listener: (context, state) {
        state.whenOrNull(
          failed: (error, result) {
            showSnackBarError(context, R.strings.serverError);
          },
          succeeded: (data, result) {
            final response = result.data;
            if (response == null) {
              logIt.wtf(
                  "A successful empty response just got Create Join Request");
              return;
            }
            dynamic model;
            try {
              model = response["createJoinRequest"]["joinRequest"]["id"];

              final requestId = model.toString();
              final bloc = BlocProvider.of<EventDetailsBloc>(context);
              bloc.add(OnSaveJoinRequestId(requestId));
              _showSuccessDialog(context);
            } catch (e) {
              logIt.error(
                  "Error accessing Create Join Request or joinRequest from response: $e");
              model = null;
            }
            if (model == null) {
              showSnackBarError(context, R.strings.serverError);
              logIt.error("A Create Join Request with error");
            }
          },
        );
      },
      child: BlocBuilder<CreateJoinRequestBloc, MutationState>(
        builder: (context, state) {
          return state.maybeWhen<Widget>(
            loading: () => const SenpaiLoading(),
            orElse: () => const SizedBox.shrink(),
          );
        },
      ),
    );
  }

  void _showSuccessDialog(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) => const Dialog(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        insetPadding: EdgeInsets.zero,
        child: Center(
          child: JoinRequestSuccessDialog(),
        ),
      ),
    );
  }
}
