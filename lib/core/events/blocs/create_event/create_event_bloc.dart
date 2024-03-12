import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';
import 'package:senpai/core/graphql/blocs/mutation/mutation_bloc.dart';
import 'package:senpai/core/graphql/models/graphql_api.dart';
import 'package:senpai/models/events/new_event/new_event_model.dart';

@injectable
class CreateEventBloc extends MutationBloc<CreateEvent$Mutation> {
  CreateEventBloc() : super(options: _createEventMutationOptions());

  static WatchQueryOptions<Object?> _createEventMutationOptions() {
    return WatchQueryOptions(
      document: CREATE_EVENT_MUTATION_DOCUMENT,
      fetchPolicy: FetchPolicy.noCache,
    );
  }

  createEvent({
    required MultipartFile image,
    required NewEventModel model,
  }) {
    final variables = CreateEventArguments(
      input: CreateEventInput(
        params: EventInput(
          userId: model.userId,
          title: model.title,
          coverImage: image,
          description: model.description,
          startDate: model.startDate,
          fullAddress: model.fullAddress,
          venue: model.venue,
          paymentRequired: model.paymentRequired,
          memberLimit: model.memberLimit,
          cosplayRequired: model.cosplayRequired,
          endDate: model.endDate,
          conventionId: model.conventionId,
        ),
      ),
    ).toJson();

    run(variables);
  }

  @override
  CreateEvent$Mutation parseData(Map<String, dynamic>? data) {
    return CreateEvent$Mutation.fromJson(data ?? <String, dynamic>{});
  }
}
