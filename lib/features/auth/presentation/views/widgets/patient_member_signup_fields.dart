import 'package:flutter/material.dart';
import 'package:lupus_app/core/constants/app_constants.dart';
import 'package:lupus_app/core/constants/app_text.dart';
import 'package:lupus_app/core/shared_widgets/label_dropdown_menu.dart';
import 'package:lupus_app/core/shared_widgets/label_text_form_field.dart';
import 'package:lupus_app/features/auth/presentation/views/widgets/auth_country_city_field.dart';
import 'package:lupus_app/features/auth/presentation/views/widgets/auth_password_field.dart';

class PatientMemberSignupFields extends StatefulWidget {
  const PatientMemberSignupFields({super.key});

  @override
  State<PatientMemberSignupFields> createState() => _PatientMemberSignupFieldsState();
}

class _PatientMemberSignupFieldsState extends State<PatientMemberSignupFields> {
  final ValueNotifier<bool> isObscure = ValueNotifier(true);
  final ValueNotifier<String?> selectedKinship = ValueNotifier<String?>(AppConstants.kinship.first);
  final ValueNotifier<int?> selectedAge = ValueNotifier<int?>(AppConstants.ages.first);
  final ValueNotifier<String?> selectedCountry = ValueNotifier<String?>(AppConstants.countries.first.name);
  final ValueNotifier<String?> selectedCity = ValueNotifier<String?>(AppConstants.citiesList.first);

  @override
  void dispose() {
    isObscure.dispose();
    selectedKinship.dispose();
    selectedAge.dispose();
    selectedCountry.dispose();
    selectedCity.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        spacing: 18,
        children: [
          LabelTextFormField(label: AppText.patientName, hintText: AppText.enterPatientName),
          LabelTextFormField(label: AppText.phoneNumber, hintText: AppText.enterPhoneNumber),
          LabelTextFormField(label: AppText.email, hintText: AppText.enterEmail),
          AuthPasswordField(isObscure: isObscure),
          Row(
            spacing: 42,
            children: [
              Expanded(
                child: ValueListenableBuilder<String?>(
                  valueListenable: selectedKinship,
                  builder: (context, value, _) {
                    return LabelDropdownMenu<String>(
                        label: AppText.kinship,
                        initialSelection: value,
                        onSelected: (newValue) => selectedKinship.value = newValue,
                        dropdownMenuEntries: AppConstants.kinship.map((kinship) => DropdownMenuEntry<String>(value: kinship, label: kinship)).toList());
                  },
                ),
              ),
              Expanded(
                child: ValueListenableBuilder<int?>(
                  valueListenable: selectedAge,
                  builder: (context, value, _) {
                    return LabelDropdownMenu<int>(
                        label: AppText.age,
                        initialSelection: value,
                        onSelected: (newValue) => selectedAge.value = newValue,
                        dropdownMenuEntries: AppConstants.ages.map((age) => DropdownMenuEntry<int>(value: age, label: age.toString())).toList());
                  },
                ),
              ),
            ],
          ),
          AuthCountryCityField(selectedCountry: selectedCountry, selectedCity: selectedCity),
          SizedBox(height: 8),
        ],
      ),
    );
  }
}
