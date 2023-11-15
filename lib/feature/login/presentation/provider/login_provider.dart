import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:webapp/common/service/services.dart';
import 'package:webapp/common/user/users.dart';
import 'package:webapp/feature/login/dependency_injection/dependency_injections.dart';
import 'package:webapp/feature/login/domain/entity/entities.dart';
import 'package:webapp/feature/login/domain/use_case/use_cases.dart';

class LoginNotifier extends StateNotifier<LoginEntity> {
  LoginNotifier({required this.loginUseCase, required this.ref})
      : super(const LoginEntity.inital());

  final LoginUseCase loginUseCase;
  final Ref ref;

  void onUsernameChanged(String username) =>
      state = state.copyWith(username: username);

  void onPasswordChanged(String password) =>
      state = state.copyWith(password: password);

  Future<String> login() async {
    final response = await loginUseCase.login(
      credentials: state,
    );

    if (response is String) {
      return response;
    } else {
      ref.read(userProvider.notifier).updateCurrentUser(response);

      ref
          .read(secureStorageServiceProvider.notifier)
          .storeToken(response.accessToken);
      ref.read(secureStorageServiceProvider.notifier).storeUserID(response.id);
      ref
          .read(secureStorageServiceProvider.notifier)
          .storeUsername(response.username);

      return '';
    }
  }
}

final loginProvider = StateNotifierProvider<LoginNotifier, LoginEntity>((ref) {
  final loginUseCase = ref.read(loginUseCaseDi);
  return LoginNotifier(
    loginUseCase: loginUseCase,
    ref: ref,
  );
});
