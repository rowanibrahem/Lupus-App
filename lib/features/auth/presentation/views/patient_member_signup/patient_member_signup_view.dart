import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:lupus_app/core/constants/app_constants.dart';
import 'package:lupus_app/core/constants/app_text.dart';
import 'package:lupus_app/features/auth/presentation/views/widgets/already_have_account_text.dart';
import 'package:lupus_app/features/auth/presentation/views/widgets/auth_banner.dart';
import 'package:lupus_app/features/auth/presentation/views/widgets/label_dropdown_menu.dart';
import 'package:lupus_app/features/auth/presentation/views/widgets/label_text_form_field.dart';

class PatientMemberSignupView extends StatelessWidget {
  const PatientMemberSignupView({super.key});

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<bool> isObscure = ValueNotifier(true);
    final ValueNotifier<String?> selectedCountry = ValueNotifier<String?>(AppConstants.countries.first.name);
    final ValueNotifier<String?> selectedCity = ValueNotifier<String?>(AppConstants.citiesList.first);
    final ValueNotifier<String?> selectedKinship = ValueNotifier<String?>(AppConstants.kinship.first);
    final ValueNotifier<int?> selectedAge = ValueNotifier<int?>(AppConstants.ages.first);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            spacing: 16,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AuthBanner(title: AppText.patientFamilyTitle),
              Form(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    spacing: 18,
                    children: [
                      LabelTextFormField(label: AppText.patientName, hintText: AppText.enterPatientName),
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
                                onSelected: (newValue) => selectedCountry.value = newValue,
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
                          )),
                          Expanded(
                            child: ValueListenableBuilder<String?>(
                              valueListenable: selectedCity,
                              builder: (context, value, _) {
                                return LabelDropdownMenu<String>(
                                    label: AppText.city,
                                    initialSelection: value,
                                    onSelected: (newValue) => selectedCity.value = newValue,
                                    dropdownMenuEntries: AppConstants.citiesList.map((city) => DropdownMenuEntry<String>(value: city, label: city)).toList());
                              },
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 24),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => Scaffold()),
                            );
                          },
                          child: Text(AppText.confirm),
                        ),
                      ),
                      AlreadyHaveAccountText(),
                      const SizedBox(height: 16),
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
