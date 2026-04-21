import 'package:flutter/material.dart';
import 'package:lupus_app/core/constants/app_constants.dart';
import 'package:lupus_app/core/constants/app_text.dart';
import 'package:lupus_app/core/services/routes.dart';
import 'package:lupus_app/features/auth/presentation/views/widgets/auth_banner.dart';
import 'package:lupus_app/features/auth/presentation/views/widgets/label_dropdown_menu.dart';
import 'package:lupus_app/features/auth/presentation/views/widgets/label_text_form_field.dart';
import 'package:lupus_app/features/auth/presentation/views/widgets/label_radio_button.dart';
import 'package:lupus_app/features/auth/presentation/views/widgets/step_indicator.dart';

class PatientSignupStep1View extends StatelessWidget {
  const PatientSignupStep1View({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedCountry = ValueNotifier<String?>(AppConstants.countries.first.name);
    final selectedCity = ValueNotifier<String?>(AppConstants.citiesList.first);
    final selectedGender = ValueNotifier<String?>(AppText.male);
    final isObscure = ValueNotifier<bool>(true);
    final TextEditingController birthDateController = TextEditingController();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              AuthBanner(title: AppText.patientSignupTitle),
              const SizedBox(height: 16),
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
                                child: Icon(
                                  value ? Icons.visibility_off : Icons.visibility,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      LabelTextFormField(label: AppText.birthDate, hintText: AppText.birthDateHint),
                      LabelTextFormField(
                        label: AppText.birthDate,
                        hintText: AppText.birthDateHint,
                        controller: birthDateController,
                        readOnly: true,
                        onTap: () async {
                          final pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime(2000),
                            firstDate: DateTime(1950),
                            lastDate: DateTime.now(),
                          );

                          if (pickedDate != null) {
                            birthDateController.text = "${pickedDate.year}/${pickedDate.month}/${pickedDate.day}";
                          }
                        },
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: ValueListenableBuilder<String?>(
                              valueListenable: selectedCountry,
                              builder: (context, value, _) {
                                return LabelDropdownMenu<String>(
                                  label: AppText.country,
                                  initialSelection: value,
                                  onSelected: (v) => selectedCountry.value = v,
                                  dropdownMenuEntries: AppConstants.countries.map((c) => DropdownMenuEntry(value: c.name, label: c.name)).toList(),
                                );
                              },
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: ValueListenableBuilder<String?>(
                              valueListenable: selectedCity,
                              builder: (context, value, _) {
                                return LabelDropdownMenu<String>(
                                  label: AppText.city,
                                  initialSelection: value,
                                  onSelected: (v) => selectedCity.value = v,
                                  dropdownMenuEntries: AppConstants.citiesList.map((c) => DropdownMenuEntry(value: c, label: c)).toList(),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppText.gender,
                            style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 12,
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: ValueListenableBuilder<String?>(
                                  valueListenable: selectedGender,
                                  builder: (context, value, _) {
                                    return LabelRadioButton<String>(
                                      label: AppText.male,
                                      value: AppText.male,
                                      groupValue: value,
                                      onChanged: (v) => selectedGender.value = v,
                                    );
                                  },
                                ),
                              ),
                              Expanded(
                                child: ValueListenableBuilder<String?>(
                                  valueListenable: selectedGender,
                                  builder: (context, value, _) {
                                    return LabelRadioButton<String>(
                                      label: AppText.female,
                                      value: AppText.female,
                                      groupValue: value,
                                      onChanged: (v) => selectedGender.value = v,
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          StepIndicator(
                            stepText: AppText.page1Of2,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed(Routes.patientRegisterStep2);
                            },
                            child: const Text(AppText.continueText),
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
