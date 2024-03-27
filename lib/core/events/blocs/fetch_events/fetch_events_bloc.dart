import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:senpai/core/graphql/blocs/query/query_bloc.dart';
import 'package:senpai/core/graphql/models/graphql_api.dart';
import 'package:senpai/models/events/events_list_filter/events_list_filter_model.dart';
import 'package:senpai/screens/new_event/enums/new_event_enums.dart';

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
    required int page,
    required EventsListFilterModel filters,
    String? searchText,
  }) {
    final variables = FetchEventsArguments(
      params: SearchEventInput(
        startDate: filters.startDate,
        page: page,
        query: searchText,
        cosplayRequired: filters.cosplayStatus != null
            ? cosplayToServer(filters.cosplayStatus)
            : null,
        endDate: filters.endDate,
        hostRating: filters.hostRating,
        milesAway: filters.userId != null ? filters.milesAway : null,
        paymentRequired: filters.paymentRequired,
        userId: filters.userId,
      ),
    ).toJson();

    run(variables: variables);
  }

  @override
  FetchEvents$Query parseData(Map<String, dynamic>? data) {
    return FetchEvents$Query.fromJson(data ?? <String, dynamic>{});
  }
}
