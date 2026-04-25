import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:lupus_app/core/constants/app_constants.dart';
import 'package:lupus_app/core/constants/app_text.dart';
import 'package:lupus_app/core/services/routes.dart';
import 'package:lupus_app/features/auth/presentation/views/widgets/auth_banner.dart';
import 'package:lupus_app/features/auth/presentation/views/widgets/label_dropdown_menu.dart';
import 'package:lupus_app/features/auth/presentation/views/widgets/label_text_form_field.dart';
import 'package:lupus_app/features/auth/presentation/views/widgets/step_indicator.dart';

class DoctorSignupStep1View extends StatelessWidget {
  const DoctorSignupStep1View({super.key});

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<bool> isObscure = ValueNotifier(true);
    final ValueNotifier<String?> selectedCountry = ValueNotifier<String?>(AppConstants.countries.first.name);
    final ValueNotifier<String?> selectedCity = ValueNotifier<String?>(AppConstants.citiesList.first);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            spacing: 16,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AuthBanner(title: AppText.doctorSignupTitle),
              Form(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    spacing: 18,
                    children: [
                      LabelTextFormField(label: AppText.doctorName, hintText: AppText.enterPatientName),
                      LabelTextFormField(label: AppText.phoneNumber, hintText: AppText.enterPhoneNumber),
                      LabelTextFormField(label: AppText.email, hintText: AppText.enterEmail),
                      ValueListenableBuilder<bool>(
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
                          );
                        },
                      ),
                      Row(
                        spacing: 42,
                        children: [
                          Expanded(
                            child: ValueListenableBuilder<String?>(
                              valueListenable: selectedCountry,
                              builder: (context, value, _) {
                                return LabelDropdownMenu<String>(
                                  label: AppText.country,
                                  leadingIcon: value == null
                                      ? null
                                      : Padding(
                                          padding: const EdgeInsets.all(12),
                                          child: CountryFlag.fromCountryCode(AppConstants.getCountryCode(value), width: 24, height: 24),
                                        ),
                                  initialSelection: value,
                                  onSelected: (newValue) {
                                    selectedCountry.value = newValue;
                                    final cities = AppConstants.citiesList;
                                    selectedCity.value = cities.isNotEmpty ? cities.first : null;
                                  },
                                  dropdownMenuEntries: AppConstants.countries
                                      .map(
                                        (country) => DropdownMenuEntry<String>(
                                          value: country.name,
                                          label: country.name,
                                          leadingIcon: CountryFlag.fromCountryCode(country.code, width: 24, height: 24),
                                        ),
                                      )
                                      .toList(),
                                );
                              },
                            ),
                          ),
                          Expanded(
                            child: ValueListenableBuilder<String?>(
                              valueListenable: selectedCountry,
                              builder: (context, country, _) {
                                return ValueListenableBuilder<String?>(
                                  valueListenable: selectedCity,
                                  builder: (context, city, _) {
                                    return LabelDropdownMenu<String>(
                                      key: ValueKey(country),
                                      label: AppText.city,
                                      initialSelection: city,
                                      onSelected: (v) => selectedCity.value = v,
                                      dropdownMenuEntries: AppConstants.citiesList.map((c) => DropdownMenuEntry(value: c, label: c)).toList(),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          StepIndicator(stepText: AppText.page1Of2),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed(Routes.doctorRegisterStep2);
                            },
                            child: Text(AppText.continueText),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
