import 'package:flutter/material.dart';
import 'package:lupus_app/core/constants/app_text.dart';
import 'package:lupus_app/core/shared_widgets/label_text_form_field.dart';

class AuthPasswordField extends StatelessWidget {
  const AuthPasswordField({
    super.key,
    required this.isObscure,
    this.onSaved,
    this.validator,
  });
  final ValueNotifier<bool> isObscure;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: isObscure,
      builder: (context, value, _) {
        return LabelTextFormField(
          label: AppText.password,
          hintText: AppText.enterPassword,
          obscureText: value,
          suffixIcon: GestureDetector(
            onTap: () => isObscure.value = !isObscure.value,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: value ? Icon(Icons.visibility_off) : Icon(Icons.visibility),
            ),
          ),
          onSaved: onSaved,
          validator: validator,
        );
      },
    );
  }
}
