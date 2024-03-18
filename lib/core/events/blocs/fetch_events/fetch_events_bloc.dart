import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:senpai/core/graphql/blocs/query/query_bloc.dart';
import 'package:senpai/core/graphql/models/graphql_api.dart';

@injectable
class FetchEventsBloc extends QueryBloc<FetchEvents$Query> {
  FetchEventsBloc() : super(options: _fetchEventsQueryOptions());

  static WatchQueryOptions<Object?> _fetchEventsQueryOptions() {
    return WatchQueryOptions(
      document: FETCH_EVENTS_QUERY_DOCUMENT,
      fetchPolicy: FetchPolicy.noCache,
    );
  }

  fetchEvents({
    required DateTime startDate,
    String? searchText,
    String? userId,
  }) {
    final variables = FetchEventsArguments(
      params: SearchEventInput(
        startDate: startDate,
        query: searchText,
        userId: userId,
      ),
    ).toJson();

    run(variables: variables);
  }

  @override
  FetchEvents$Query parseData(Map<String, dynamic>? data) {
    return FetchEvents$Query.fromJson(data ?? <String, dynamic>{});
  }
}
