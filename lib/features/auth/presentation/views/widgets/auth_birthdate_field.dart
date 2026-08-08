import 'package:flutter/material.dart';
import 'package:lupus_app/core/shared_widgets/label_text_form_field.dart';
import 'package:lupus_app/core/constants/app_text.dart';

class AuthBirthdateField extends StatelessWidget {
  const AuthBirthdateField({
    super.key,
    required ValueNotifier<DateTime?> birthDateNotifier,
    this.onSaved,
    this.validator,
  }) : _birthDateNotifier = birthDateNotifier;

  final ValueNotifier<DateTime?> _birthDateNotifier;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<DateTime?>(
      valueListenable: _birthDateNotifier,
      builder: (context, pickedDate, _) {
        return LabelTextFormField(
          key: ValueKey(pickedDate),
          label: AppText.birthDate,
          hintText: AppText.birthDateHint,
          readOnly: true,
          initialValue: pickedDate != null ? '${pickedDate.day}/${pickedDate.month}/${pickedDate.year}' : '',
          onTap: () async {
            final DateTime? picked = await showDatePicker(
              context: context,
              initialDate: _birthDateNotifier.value ?? DateTime.now(),
              firstDate: DateTime(1900),
              lastDate: DateTime.now(),
              locale: const Locale('ar'),
              builder: (context, child) {
                return Theme(
                  data: Theme.of(context).copyWith(
                    colorScheme: ColorScheme.light(
                      primary: const Color(0xff6C18D8),
                      onPrimary: Colors.white,
                      onSurface: const Color(0xff6C18D8),
                    ),
                    textButtonTheme: TextButtonThemeData(
                      style: TextButton.styleFrom(
                        foregroundColor: const Color(0xff6C18D8),
                      ),
                    ),
                  ),
                  child: child!,
                );
              },
            );

            if (picked != null) {
              _birthDateNotifier.value = picked; // ← one line, no setState, no controller
            }
          },
          onSaved: onSaved,
          validator: validator,
        );
      },
    );
  }
}
