import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:webapp/common/theme/themes.dart';

class LoginSwitchButton extends HookConsumerWidget {
  final ValueNotifier<bool> showSignUp;

  const LoginSwitchButton({
    super.key,
    required this.showSignUp,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: RichText(
        text: TextSpan(
          text: !showSignUp.value
              ? 'First time using this app? '
              : 'Already have an account? ',
          style: GoogleFonts.sanchez(
              fontWeight: FontWeight.w500, fontSize: 16, color: portfolioBlack),
          children: [
            TextSpan(
              text: !showSignUp.value ? 'Sign Up' : 'Login',
              recognizer: TapGestureRecognizer()
                ..onTap = () => showSignUp.value = !showSignUp.value,
              style: GoogleFonts.sanchez(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: portfolioBlue,
              ),
            )
          ],
        ),
      ),
    );
  }
}
