import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:senpai/core/graphql/blocs/mutation/mutation_bloc.dart';
import 'package:senpai/core/graphql/models/graphql_api.dart';

@injectable
class CreateJoinRequestBloc extends MutationBloc<CreateJoinRequest$Mutation> {
  CreateJoinRequestBloc() : super(options: _createJoinRequestMutationOptions());

  static WatchQueryOptions<Object?> _createJoinRequestMutationOptions() {
    return WatchQueryOptions(
      document: CREATE_JOIN_REQUEST_MUTATION_DOCUMENT,
      fetchPolicy: FetchPolicy.noCache,
    );
  }

  createJoinRequest({
    required String eventId,
    required String userId,
    String? description,
  }) {
    final variables = CreateJoinRequestArguments(
      input: CreateJoinRequestInput(
        params: JoinRequestInput(
          userId: userId,
          eventId: eventId,
          description: description,
        ),
      ),
    ).toJson();

    run(variables);
  }

  @override
  CreateJoinRequest$Mutation parseData(Map<String, dynamic>? data) {
    return CreateJoinRequest$Mutation.fromJson(data ?? <String, dynamic>{});
  }
}
