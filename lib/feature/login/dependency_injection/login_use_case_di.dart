import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:webapp/feature/login/dependency_injection/dependency_injections.dart';
import 'package:webapp/feature/login/domain/use_case/login_use_case.dart';

final loginUseCaseDi = Provider(
  (ref) {
    final repository = ref.watch(loginRepositoryDi);

    return LoginUseCase(repository: repository);
  },
  dependencies: [loginRepositoryDi],
);
