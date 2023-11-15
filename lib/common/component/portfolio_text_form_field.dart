import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:webapp/common/theme/themes.dart';

enum PortfolioTextFormFieldType { primary, obscured }

class PortfolioTextFormField extends HookWidget {
  final String label;
  final IconData? prefixIcon;
  final bool obscured;
  final ValueNotifier<bool>? hasError;
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;

  const PortfolioTextFormField({
    super.key,
    required this.label,
    this.prefixIcon,
    this.obscured = false,
    this.hasError,
    required this.controller,
    this.onChanged,
  });

  factory PortfolioTextFormField.primary({
    required String label,
    IconData? prefixIcon,
    ValueNotifier<bool>? hasError,
    required TextEditingController controller,
    ValueChanged<String>? onChanged,
  }) =>
      PortfolioTextFormField(
        label: label,
        hasError: hasError,
        prefixIcon: prefixIcon,
        controller: controller,
        onChanged: onChanged,
      );

  factory PortfolioTextFormField.obscured({
    required String label,
    IconData? prefixIcon,
    ValueNotifier<bool>? hasError,
    required TextEditingController controller,
    ValueChanged<String>? onChanged,
  }) =>
      PortfolioTextFormField(
        label: label,
        hasError: hasError,
        prefixIcon: prefixIcon,
        obscured: true,
        controller: controller,
        onChanged: onChanged,
      );

  @override
  Widget build(BuildContext context) {
    final showText = useState(obscured);

    return SizedBox(
      width: 450,
      child: TextFormField(
        style: const TextStyle(
          color: portfolioGreen,
          fontWeight: FontWeight.w700,
        ),
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(
            color: portfolioGreen,
          ),
          prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
          suffixIcon: obscured
              ? IconButton(
                  onPressed: () {
                    showText.value = !showText.value;
                  },
                  icon: Icon(
                    showText.value ? Icons.visibility : Icons.visibility_off,
                  ),
                )
              : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              width: 3.0,
              color: hasError?.value == true ? Colors.red : portfolioBlack,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              width: 3.0,
              color: hasError?.value == true ? Colors.red : portfolioBlack,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              width: 3.0,
              color: hasError?.value == true ? Colors.red : portfolioBlack,
            ),
          ),
          focusColor: portfolioBlack,
          prefixIconColor: portfolioGreen,
          suffixIconColor: portfolioGreen,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        ),
        obscureText: showText.value,
        keyboardType:
            obscured ? TextInputType.visiblePassword : TextInputType.text,
        onChanged: onChanged,
      ),
    );
  }
}
