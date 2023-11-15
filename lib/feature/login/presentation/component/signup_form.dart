import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:glass/glass.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:webapp/common/component/components.dart';
import 'package:webapp/common/route/location/dashboard/dashboard.dart';
import 'package:webapp/feature/login/presentation/component/components.dart';
import 'package:webapp/feature/login/presentation/provider/providers.dart';

class SignUpForm extends HookConsumerWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(signupProvider.notifier);

    final usernameController = useTextEditingController();
    final passwordController = useTextEditingController();
    final confirmPasswordController = useTextEditingController();

    final errorMessage = useState('');
    final hasError = useState(false);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const LoginHeader(text: 'Create an account'),
        const SizedBox(height: 30),
        Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              PortfolioTextFormField.primary(
                label: 'USERNAME',
                prefixIcon: Icons.face,
                hasError: hasError,
                controller: usernameController,
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
                hasError: hasError,
                controller: passwordController,
                onChanged: (val) {
                  errorMessage.value == '';
                  hasError.value = false;
                  notifier.onPasswordChanged(val);
                },
              ),
              const SizedBox(height: 20),
              PortfolioTextFormField.obscured(
                label: 'CONFIRM PASSWORD',
                prefixIcon: Icons.password,
                hasError: hasError,
                controller: confirmPasswordController,
                onChanged: (val) {
                  errorMessage.value == '';
                  hasError.value = false;
                  notifier.onConfirmPasswordChanged(val);
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
          text: 'SIGN UP',
          color: hasError.value ? Colors.grey : null,
          onPressed: () {
            final validationRes = notifier.validate();

            if (validationRes == '') {
              notifier.signup().then((res) {
                if (res == '') {
                  errorMessage.value = '';
                  hasError.value = false;
                  Beamer.of(context).beamToNamed(DashboardLocation.route);
                } else {
                  errorMessage.value = res;
                  hasError.value = true;
                }
              });
            } else {
              errorMessage.value = validationRes;
              hasError.value = true;
            }
          },
        ),
      ],
    );
  }
}
