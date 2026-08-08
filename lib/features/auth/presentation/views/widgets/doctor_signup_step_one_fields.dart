import 'package:flutter/material.dart';
import 'package:lupus_app/core/constants/app_constants.dart';
import 'package:lupus_app/core/shared_widgets/label_text_form_field.dart';
import 'package:lupus_app/core/constants/app_text.dart';
import 'package:lupus_app/features/auth/presentation/views/widgets/auth_birthdate_field.dart';
import 'package:lupus_app/features/auth/presentation/views/widgets/auth_country_city_field.dart';
import 'package:lupus_app/features/auth/presentation/views/widgets/auth_password_field.dart';

class DoctorSignupStepOneFields extends StatefulWidget {
  const DoctorSignupStepOneFields({super.key});

  @override
  State<DoctorSignupStepOneFields> createState() => _DoctorSignupStepOneFieldsState();
}

class _DoctorSignupStepOneFieldsState extends State<DoctorSignupStepOneFields> {
  final ValueNotifier<bool> isObscure = ValueNotifier(true);
  final ValueNotifier<String?> selectedCountry = ValueNotifier<String?>(AppConstants.countries.first.name);
  final ValueNotifier<String?> selectedCity = ValueNotifier<String?>(AppConstants.getCitiesForCountry(AppConstants.countries.first.name).first);
  final ValueNotifier<DateTime?> _birthDateNotifier = ValueNotifier(null);

  @override

  void dispose() {
    isObscure.dispose();
    selectedCountry.dispose();
    selectedCity.dispose();
    _birthDateNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 18,
      children: [
        LabelTextFormField(
          label: AppText.doctorName,
          hintText: AppText.enterPatientName,
          //!:Todo validator: (value) => FormValidatorsAr.validateName(value),
          //!:Todo onSaved: (value) => cubit.formData.email = value!.trim(),
        ),
        LabelTextFormField(label: AppText.phoneNumber, hintText: AppText.enterPhoneNumber),
        LabelTextFormField(label: AppText.email, hintText: AppText.enterEmail),
        AuthPasswordField(isObscure: isObscure),
        AuthBirthdateField(birthDateNotifier: _birthDateNotifier),
        AuthCountryCityField(selectedCountry: selectedCountry, selectedCity: selectedCity),
        const SizedBox(height: 16),
      ],
    );
  }
}
