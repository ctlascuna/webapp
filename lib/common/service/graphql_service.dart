import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GraphQLService extends StateNotifier<GraphQLClient> {
  GraphQLService({
    GraphQLClient? state,
  }) : super(state ?? _initialState);

  static GraphQLClient get _initialState {
    return GraphQLClient(
      link: HttpLink('http://localhost:3000/graphql'),
      cache: GraphQLCache(),
      defaultPolicies: DefaultPolicies(
        query: Policies(fetch: FetchPolicy.noCache),
        mutate: Policies(fetch: FetchPolicy.noCache),
      ),
    );
  }

  GraphQLClient get client => state;
}

final graphQLService = StateNotifierProvider<GraphQLService, GraphQLClient>(
  (ref) {
    return GraphQLService();
  },
);
