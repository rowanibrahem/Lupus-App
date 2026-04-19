import 'package:flutter/material.dart';
import 'package:lupus_app/core/theme/color_app.dart';
import 'package:lupus_app/core/theme/styles.dart';

class InputField extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController? controller;
  final TextInputType? type;
  final Function(String)? onChange;
  final FormFieldValidator? validate;
  final Function()? pressed;
  final Function()? tap;
  final bool? enable;
  final Icon? prefix;
  final FocusNode? focusNode;
  final bool obscureText;
  final Icon? suffix;
  final List<String>? autofillHints;
  final IconData? suffixIcon;
  final Function()? suffixPressed;
  const InputField({
    super.key,
    required this.label,
    required this.hint,
    this.controller,
    this.type,
    this.onChange,
    this.validate,
    this.pressed,
    this.prefix,
    this.suffix,
    this.tap,
    this.enable,
    this.focusNode,
    this.autofillHints,
    this.obscureText = false,
    this.suffixIcon,
    this.suffixPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onTap: tap,
      enabled: enable,
      controller: controller,
      autofillHints: autofillHints,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: Styles.text12Gray(context),
        hintText: hint,
        hintStyle: Styles.text12Gray(context),
        contentPadding: const EdgeInsets.symmetric(horizontal: 7),
        prefixIcon: prefix,
        suffixIcon: suffixIcon != null
            ? IconButton(
                icon: Icon(suffixIcon, color: Colors.grey.shade700),
                onPressed: suffixPressed,
              )
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade700),
          borderRadius: BorderRadius.circular(2),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.primaryColor),
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      style: const TextStyle(fontSize: 14),
      keyboardType: type,
      onChanged: onChange,
      validator: validate,
    );
  }
}
