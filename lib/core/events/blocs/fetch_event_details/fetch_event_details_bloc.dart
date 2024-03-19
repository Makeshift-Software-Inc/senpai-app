import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:senpai/core/graphql/blocs/query/query_bloc.dart';
import 'package:senpai/core/graphql/models/graphql_api.dart';

@injectable
class FetchEventDetailsBloc extends QueryBloc<FetchEvent$Query> {
  FetchEventDetailsBloc() : super(options: _fetchEventQueryOptions());

  static WatchQueryOptions<Object?> _fetchEventQueryOptions() {
    return WatchQueryOptions(
      document: FETCH_EVENT_QUERY_DOCUMENT,
      fetchPolicy: FetchPolicy.noCache,
    );
  }

  fetchEventDetails({
    required String eventId,
  }) {
    final variables = FetchEventArguments(
      eventId: eventId,
    ).toJson();

    run(variables: variables);
  }

  @override
  FetchEvent$Query parseData(Map<String, dynamic>? data) {
    return FetchEvent$Query.fromJson(data ?? <String, dynamic>{});
  }
}
