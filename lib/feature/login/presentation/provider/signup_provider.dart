import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:webapp/common/service/services.dart';
import 'package:webapp/common/user/users.dart';
import 'package:webapp/feature/login/dependency_injection/dependency_injections.dart';
import 'package:webapp/feature/login/domain/entity/entities.dart';
import 'package:webapp/feature/login/domain/use_case/use_cases.dart';

class SignupNotifier extends StateNotifier<SignupEntity> {
  SignupNotifier({required this.loginUseCase, required this.ref})
      : super(const SignupEntity.inital());

  final LoginUseCase loginUseCase;
  final Ref ref;

  void onUsernameChanged(String username) =>
      state = state.copyWith(username: username);

  void onPasswordChanged(String password) =>
      state = state.copyWith(password: password);

  void onConfirmPasswordChanged(String password) =>
      state = state.copyWith(confirmPassword: password);

  String validate() {
    if (state.password != state.confirmPassword) {
      return 'Password does not match.';
    }
    return '';
  }

  Future<dynamic> signup() async {
    final response = await loginUseCase.signup(
      info: state,
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

      ref.read(graphQLService.notifier).updateBearerToken(response.accessToken);

      return '';
    }
  }
}

final signupProvider =
    StateNotifierProvider<SignupNotifier, SignupEntity>((ref) {
  final loginUseCase = ref.read(loginUseCaseDi);
  return SignupNotifier(
    loginUseCase: loginUseCase,
    ref: ref,
  );
});
