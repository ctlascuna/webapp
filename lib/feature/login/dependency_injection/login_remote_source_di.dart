import 'package:webapp/common/service/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:webapp/feature/login/data/data_source/remote_source/remote_sources.dart';

final loginRemoteSourceDi = Provider(
  (ref) {
    final client = ref.watch(graphQLService);

    return LoginRemoteSourceImpl(client: client);
  },
  dependencies: [graphQLService],
);
