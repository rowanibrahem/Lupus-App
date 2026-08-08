import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:lupus_app/core/constants/app_constants.dart';
import 'package:lupus_app/core/constants/app_text.dart';
import 'package:lupus_app/core/shared_widgets/label_dropdown_menu.dart';
import 'package:lupus_app/core/shared_widgets/label_text_form_field.dart';
import 'package:lupus_app/features/auth/presentation/views/widgets/step_indicator.dart';

class Step1DoctorSignupFields extends StatelessWidget {
  const Step1DoctorSignupFields({super.key});

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<bool> isObscure = ValueNotifier(true);
    final ValueNotifier<String?> selectedCountry = ValueNotifier<String?>(AppConstants.countries.first.name);
    final ValueNotifier<String?> selectedCity = ValueNotifier<String?>(AppConstants.citiesList.first);

    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          LabelTextFormField(label: AppText.doctorName, hintText: AppText.enterPatientName),
          LabelTextFormField(label: AppText.phoneNumber, hintText: AppText.enterPhoneNumber),
          LabelTextFormField(label: AppText.email, hintText: AppText.enterEmail),
          ValueListenableBuilder<bool>(valueListenable: isObscure, builder: (context, value, _) => _builderPasswordField(value, isObscure)),
          Row(
            children: [
              Expanded(
                child: ValueListenableBuilder<String?>(
                  valueListenable: selectedCountry,
                  builder: (context, value, _) {
                    return LabelDropdownMenu<String>(
                        label: AppText.country,
                        leadingIcon: value == null ? null : Padding(padding: const EdgeInsets.all(16), child: CountryFlag.fromCountryCode(AppConstants.getCountryCode(value), width: 20, height: 20)),
                        initialSelection: value,
                        onSelected: (v) => selectedCountry.value = v,
                        dropdownMenuEntries: AppConstants.countries.map((country) => DropdownMenuEntry(value: country.name, label: country.name, leadingIcon: CountryFlag.fromCountryCode(country.code, width: 20, height: 20))).toList());
                  },
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: ValueListenableBuilder<String?>(
                  valueListenable: selectedCity,
                  builder: (context, value, _) {
                    return LabelDropdownMenu<String>(
                      label: AppText.city,
                      initialSelection: value,
                      onSelected: (v) => selectedCity.value = v,
                      dropdownMenuEntries: AppConstants.citiesList.map((city) => DropdownMenuEntry(value: city, label: city)).toList(),
                    );
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              StepIndicator(stepText: AppText.page1Of2),
              ElevatedButton(
                onPressed: () {
                  // 🔥 collect step 1
                  // model.name = nameController.text;
                  // model.phone = phoneController.text;
                  // model.email = emailController.text;
                  // model.password = passwordController.text;
                  // model.country = selectedCountry.value;
                  // model.city = selectedCity.value;
                  // nextPage();
                },
                child: Text(AppText.continueText),
              ),
            ],
          ),
        ],
      ),
    );
  }

  LabelTextFormField _builderPasswordField(bool value, ValueNotifier<bool> isObscure) {
    return LabelTextFormField(
      label: AppText.password,
      hintText: AppText.enterPassword,
      obscureText: value,
      suffixIcon: GestureDetector(
        onTap: () => isObscure.value = !isObscure.value,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: value ? const Icon(Icons.visibility_off) : const Icon(Icons.visibility),
        ),
      ),
    );
  }
}
