import 'package:flutter/material.dart';

import 'package:webapp/common/theme/themes.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          text,
          style: const TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.bold,
            color: portfolioBlack,
          ),
        ),
        const SizedBox(height: 24),
        Container(
          width: 84,
          height: 8,
          decoration: BoxDecoration(
            color: portfolioGreen,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ],
    );
  }
}
