import 'package:graphql_flutter/graphql_flutter.dart';

import 'package:webapp/common/user/user_model.dart';
import 'package:webapp/feature/login/data/data_source/remote_source/remote_sources.dart';
import 'package:webapp/feature/login/domain/entity/login_entity.dart';
import 'package:webapp/feature/login/domain/entity/signup_entity.dart';

class LoginRemoteSourceImpl implements LoginRemoteSource {
  const LoginRemoteSourceImpl({
    required GraphQLClient client,
  }) : _client = client;

  final GraphQLClient _client;

  @override
  Future<dynamic> login({required LoginEntity credentials}) async {
    try {
      const loginQuery = r'''
        query login ($username: String!, $password: String!) {
          login(username: $username, password: $password) {
            accessToken
            userId
            username
          }
        }
      ''';

      final options = QueryOptions(
        document: gql(loginQuery),
        variables: <String, dynamic>{
          'username': credentials.username,
          'password': credentials.password
        },
      );

      final response = await _client.query(options);

      if (response.hasException || response.data?['login'] == null) {
        return response.exception?.graphqlErrors[0].message;
      }

      final data = response.data?['login'] as Map<String, dynamic>;

      return UserModel?.fromJson(data);
    } on GraphQLError catch (_) {
      return 'Oops, something went wrong. Pelase try again.';
    }
  }

  @override
  Future<dynamic> signup({required SignupEntity info}) async {
    try {
      const signupMutation = r'''
        mutation createUser (
          $username: String!, 
          $password: String!,
        ) {
          createUser(
            username: $username,
            password: $password
          ) {
            accessToken
            userId
            username
          }
        }
      ''';

      final options = MutationOptions(
        document: gql(signupMutation),
        variables: <String, dynamic>{
          'username': info.username,
          'password': info.password,
        },
      );

      final response = await _client.mutate(options);

      if (response.hasException || response.data?['createUser'] == null) {
        return response.exception?.graphqlErrors[0].message;
      }

      final data = response.data?['createUser'] as Map<String, dynamic>;

      return UserModel?.fromJson(data);
    } on GraphQLError catch (_) {
      return 'Oops, something went wrong. Pelase try again.';
    }
  }
}
