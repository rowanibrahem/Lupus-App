import 'package:flutter/material.dart';
import 'package:lupus_app/core/constants/app_text.dart';
import 'package:lupus_app/core/shared_widgets/label_text_form_field.dart';
import 'package:lupus_app/features/auth/presentation/views/widgets/auth_password_field.dart';

class PharmacySignupFields extends StatefulWidget {
  const PharmacySignupFields({super.key});

  @override
  State<PharmacySignupFields> createState() => _PharmacySignupFieldsState();
}

class _PharmacySignupFieldsState extends State<PharmacySignupFields> {
  final ValueNotifier<bool> isObscure = ValueNotifier(true);
  @override
  void dispose() {
    isObscure.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        spacing: 18,
        children: [
          LabelTextFormField(label: AppText.pharmacyName, hintText: AppText.enterPatientName),
          LabelTextFormField(label: AppText.phoneNumber, hintText: AppText.enterPhoneNumber),
          LabelTextFormField(label: AppText.email, hintText: AppText.enterEmail),
          AuthPasswordField(isObscure: isObscure),
          LabelTextFormField(label: AppText.contactNumber, hintText: AppText.enterContactNumber),
          LabelTextFormField(label: AppText.address, hintText: AppText.enterAddress),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
