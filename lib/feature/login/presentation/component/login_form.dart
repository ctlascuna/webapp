import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:glass/glass.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:webapp/common/component/components.dart';
import 'package:webapp/common/route/location/dashboard/dashboard.dart';
import 'package:webapp/feature/login/presentation/component/components.dart';
import 'package:webapp/feature/login/presentation/provider/login_provider.dart';

class LoginForm extends HookConsumerWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(loginProvider.notifier);

    final usernameController = useTextEditingController();
    final passwordController = useTextEditingController();

    final hasError = useState(false);
    final errorMessage = useState('');

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const LoginHeader(text: 'Sign in with your account'),
        const SizedBox(height: 30),
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Column(
            children: [
              PortfolioTextFormField.primary(
                label: 'USERNAME',
                prefixIcon: Icons.face,
                controller: usernameController,
                hasError: hasError,
                onChanged: (val) {
                  errorMessage.value == '';
                  hasError.value = false;
                  notifier.onUsernameChanged(val);
                },
              ),
              const SizedBox(height: 20),
              PortfolioTextFormField.obscured(
                label: 'PASSWORD',
                prefixIcon: Icons.password,
                controller: passwordController,
                hasError: hasError,
                onChanged: (val) {
                  errorMessage.value == '';
                  hasError.value = false;
                  notifier.onPasswordChanged(val);
                },
              ),
            ],
          ),
        ).asGlass(
          clipBorderRadius: BorderRadius.circular(12),
        ),
        if (hasError.value) ...[
          const SizedBox(height: 15),
          Text(
            errorMessage.value,
            style: const TextStyle(
              color: Colors.red,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
        const SizedBox(height: 50),
        PortfolioButton(
          text: 'LOGIN',
          color: hasError.value ? Colors.grey : null,
          onPressed: () async {
            await notifier.login().then((res) {
              if (res == '') {
                errorMessage.value = '';
                hasError.value = false;
                Beamer.of(context).beamToNamed(DashboardLocation.route);
              } else {
                errorMessage.value = res;
                hasError.value = true;
              }
            });
          },
        ),
      ],
    );
  }
}
