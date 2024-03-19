import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:senpai/core/graphql/blocs/query/query_bloc.dart';
import 'package:senpai/core/graphql/models/graphql_api.dart';

@injectable
class FetchConventionDetailsBloc extends QueryBloc<FetchConvention$Query> {
  FetchConventionDetailsBloc() : super(options: _fetchConventionQueryOptions());

  static WatchQueryOptions<Object?> _fetchConventionQueryOptions() {
    return WatchQueryOptions(
      document: FETCH_CONVENTION_QUERY_DOCUMENT,
      fetchPolicy: FetchPolicy.noCache,
    );
  }

  fetchConventionDetails({
    required String conventionId,
  }) {
    final variables = FetchConventionArguments(
      conventionId: conventionId,
    ).toJson();

    run(variables: variables);
  }

  @override
  FetchConvention$Query parseData(Map<String, dynamic>? data) {
    return FetchConvention$Query.fromJson(data ?? <String, dynamic>{});
  }
}
