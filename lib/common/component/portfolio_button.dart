import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:webapp/common/theme/themes.dart';

class PortfolioButton extends HookWidget {
  final String text;
  final Color? color;
  final Function()? onPressed;

  const PortfolioButton({
    Key? key,
    required this.text,
    this.color,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onPressed!();
      },
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        backgroundColor: color ?? portfolioBlue,
        foregroundColor: portfolioWarm,
        padding: const EdgeInsets.all(16.0),
        elevation: 5,
        minimumSize: const Size(300, 50),
        textStyle: GoogleFonts.sanchez(
          fontSize: 24,
          fontWeight: FontWeight.w500,
        ),
      ),
      child: Text(text),
    );
  }
}
