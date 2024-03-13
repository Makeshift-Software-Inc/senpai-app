import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:senpai/core/graphql/blocs/query/query_bloc.dart';
import 'package:senpai/core/graphql/models/graphql_api.dart';

@injectable
class FetchConventionsBloc extends QueryBloc<FetchConventions$Query> {
  FetchConventionsBloc() : super(options: _fetchConventionsQueryOptions());

  static WatchQueryOptions<Object?> _fetchConventionsQueryOptions() {
    return WatchQueryOptions(
      document: FETCH_CONVENTIONS_QUERY_DOCUMENT,
      fetchPolicy: FetchPolicy.noCache,
    );
  }

  fetchConventions({
    required DateTime startDate,
    String? searchText,
  }) {
    final variables = FetchConventionsArguments(
      params: SearchEventInput(
        startDate: startDate,
        query: searchText,
      ),
    ).toJson();

    run(variables: variables);
  }

  @override
  FetchConventions$Query parseData(Map<String, dynamic>? data) {
    return FetchConventions$Query.fromJson(data ?? <String, dynamic>{});
  }
}
