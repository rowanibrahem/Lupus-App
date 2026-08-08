import 'package:flutter/material.dart';
import 'package:lupus_app/core/constants/app_constants.dart';
import 'package:lupus_app/core/constants/app_text.dart';
import 'package:lupus_app/core/shared_widgets/label_text_form_field.dart';
import 'package:lupus_app/features/auth/presentation/views/widgets/auth_birthdate_field.dart';
import 'package:lupus_app/features/auth/presentation/views/widgets/auth_country_city_field.dart';
import 'package:lupus_app/features/auth/presentation/views/widgets/auth_gender_field.dart';
import 'package:lupus_app/features/auth/presentation/views/widgets/auth_password_field.dart';

class PatientSignupStepOneFields extends StatefulWidget {
  const PatientSignupStepOneFields({super.key});

  @override
  State<PatientSignupStepOneFields> createState() => _PatientSignupStepOneFieldsState();
}

class _PatientSignupStepOneFieldsState extends State<PatientSignupStepOneFields> {
  final isObscure = ValueNotifier(true);
  final selectedGender = ValueNotifier<String?>(AppText.male);
  final selectedCountry = ValueNotifier<String?>(AppConstants.countries.first.name);
  final selectedCity = ValueNotifier<String?>(AppConstants.citiesList.first);
  final selectedDose = ValueNotifier<String?>(AppConstants.doses.first);
  final selectedFrequency = ValueNotifier<String?>(AppConstants.frequencyOptions.first);
  final selectedLupusType = ValueNotifier<String?>(AppConstants.lupusTypes.first);
  final ValueNotifier<DateTime?> birthDateNotifier = ValueNotifier(DateTime.now());

  @override
  void dispose() {
    isObscure.dispose();
    selectedGender.dispose();
    selectedCountry.dispose();
    selectedCity.dispose();
    selectedDose.dispose();
    selectedFrequency.dispose();
    selectedLupusType.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LabelTextFormField(label: AppText.patientName, hintText: AppText.enterPatientName),
        LabelTextFormField(label: AppText.phoneNumber, hintText: AppText.enterPhoneNumber),
        LabelTextFormField(label: AppText.email, hintText: AppText.enterEmail),
        AuthPasswordField(isObscure: isObscure),
        AuthBirthdateField(birthDateNotifier: birthDateNotifier),
        AuthCountryCityField(selectedCountry: selectedCountry, selectedCity: selectedCity),
        GenderField(selectedGender: selectedGender),
      ],
    );
  }
}
