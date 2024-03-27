import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:senpai/core/graphql/blocs/query/query_bloc.dart';
import 'package:senpai/core/graphql/models/graphql_api.dart';

@injectable
class FetchJoinRequestsBloc extends QueryBloc<FetchJoinRequests$Query> {
  FetchJoinRequestsBloc() : super(options: _fetchJoinRequestsQueryOptions());

  static WatchQueryOptions<Object?> _fetchJoinRequestsQueryOptions() {
    return WatchQueryOptions(
      document: FETCH_JOIN_REQUESTS_QUERY_DOCUMENT,
      fetchPolicy: FetchPolicy.noCache,
    );
  }

  fetchJoinRequests({
    required String eventId,
    required String applicantId,
    int? page,
  }) {
    final variables = FetchJoinRequestsArguments(
      eventId: eventId,
      page: page ?? 1,
      applicantId: applicantId,
    ).toJson();

    run(variables: variables);
  }

  @override
  FetchJoinRequests$Query parseData(Map<String, dynamic>? data) {
    return FetchJoinRequests$Query.fromJson(data ?? <String, dynamic>{});
  }
}
