import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:webapp/feature/login/data/repository/repositories.dart';
import 'package:webapp/feature/login/dependency_injection/dependency_injections.dart';

final loginRepositoryDi = Provider(
  (ref) {
    final remoteSource = ref.watch(loginRemoteSourceDi);

    return LoginRepositoryImpl(remoteSource: remoteSource);
  },
  dependencies: [loginRemoteSourceDi],
);
