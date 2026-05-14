import 'package:flutter/material.dart';
import 'package:lupus_app/core/theme/color_app.dart';

class LabelTextFormField extends StatelessWidget {
  final String label;
  final String hintText;
  final TextEditingController? controller;
  final String? initialValue; // ← added
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final bool obscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final void Function(String)? onChanged;
  final VoidCallback? onTap;
  final bool readOnly;
  final void Function(String?)? onSaved;

  const LabelTextFormField({
    super.key,
    required this.label,
    required this.hintText,
    this.controller,
    this.initialValue, // ← added
    this.validator,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.suffixIcon,
    this.prefixIcon,
    this.onChanged,
    this.onTap,
    this.readOnly = false,
    this.onSaved,
  }) : assert(
          // ← guard: Flutter rule
          controller == null || initialValue == null,
          'Cannot use both controller and initialValue at the same time.',
        );

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          textAlign: TextAlign.right,
          style: const TextStyle(
            color: AppColors.blackColor,
            fontWeight: FontWeight.w600,
            fontSize: 12,
            height: 1.0,
            letterSpacing: 0.0,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          initialValue: initialValue, // ← added
          validator: validator,
          keyboardType: keyboardType,
          obscureText: obscureText,
          onChanged: onChanged,
          readOnly: readOnly,
          onTap: onTap,
          onSaved: onSaved,
          decoration: InputDecoration(
            hintText: hintText,
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
          ),
        ),
      ],
    );
  }
}
