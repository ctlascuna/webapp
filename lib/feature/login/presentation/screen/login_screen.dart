import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:webapp/common/component/components.dart';
import 'package:webapp/common/theme/themes.dart';
import 'package:webapp/feature/login/presentation/component/components.dart';

class LoginScreen extends HookConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: portfolioBackground,
      body: _MyLoginScreen(),
    );
  }
}

class _MyLoginScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final showSignUp = useState(false);
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        const PortfolioBackgroundContainer(),
        SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              showSignUp.value ? const SignUpForm() : const LoginForm(),
              const SizedBox(height: 10),
              LoginSwitchButton(showSignUp: showSignUp),
            ],
          ),
        ),
      ],
    );
  }
}
