import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lupus_app/core/constants/app_constants.dart';
import 'package:lupus_app/core/constants/app_text.dart';
import 'package:lupus_app/core/constants/asset_images.dart';
import 'package:lupus_app/core/services/routes.dart';
import 'package:lupus_app/features/auth/presentation/views/widgets/auth_banner.dart';
import 'package:lupus_app/features/auth/presentation/views/widgets/label_dropdown_menu.dart';
import 'package:lupus_app/features/auth/presentation/views/widgets/label_radio_button.dart';
import 'package:lupus_app/features/auth/presentation/views/widgets/label_text_form_field.dart';
import 'package:lupus_app/features/auth/presentation/views/widgets/step_indicator.dart';

class PatientSignupModel {
  String? name, phone, email, password;
  String? birthDate, gender, country, city;
  String? medications, dose, frequency, diagnosisDate, lupusType;
  String? symptoms, otherDiseases, drugAllergies, specialNeeds, reports;
}

class PatientSignupView extends StatefulWidget {
  const PatientSignupView({super.key});

  @override
  State<PatientSignupView> createState() => _PatientSignupViewState();
}

class _PatientSignupViewState extends State<PatientSignupView> {
  final PageController _controller = PageController();
  final PatientSignupModel model = PatientSignupModel();

  void nextPage() => _controller.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
  void previousPage() => _controller.previousPage(duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);

  /// STEP 1
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final birthDateController = TextEditingController();

  final isObscure = ValueNotifier(true);
  final selectedGender = ValueNotifier<String?>(AppText.male);
  final selectedCountry = ValueNotifier<String?>(AppConstants.countries.first.name);
  final selectedCity = ValueNotifier<String?>(AppConstants.citiesList.first);

  /// STEP 2
  final medicationsController = TextEditingController();
  final diagnosisDateController = TextEditingController();

  final selectedDose = ValueNotifier<String?>(AppConstants.doses.first);
  final selectedFrequency = ValueNotifier<String?>(AppConstants.frequencyOptions.first);
  final selectedLupusType = ValueNotifier<String?>(AppConstants.lupusTypes.first);

  /// STEP 3
  final symptomsController = TextEditingController();
  final diseasesController = TextEditingController();
  final allergiesController = TextEditingController();
  final needsController = TextEditingController();
  final reportsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          controller: _controller,
          physics: const NeverScrollableScrollPhysics(),
          children: [_buildStep1(), _buildStep2(), _buildStep3()],
        ),
      ),
    );
  }

  /// ================= STEP 1 =================
  Widget _buildStep1() {
    return SingleChildScrollView(
      child: Column(
        children: [
          AuthBanner(title: AppText.patientSignupTitle),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              spacing: 18,
              children: [
                LabelTextFormField(label: AppText.patientName, hintText: AppText.enterPatientName, controller: nameController),
                LabelTextFormField(label: AppText.phoneNumber, hintText: AppText.enterPhoneNumber, controller: phoneController),
                LabelTextFormField(label: AppText.email, hintText: AppText.enterEmail, controller: emailController),
                ValueListenableBuilder(
                  valueListenable: isObscure,
                  builder: (context, value, _) {
                    return LabelTextFormField(
                      label: AppText.password,
                      hintText: AppText.enterPassword,
                      controller: passwordController,
                      obscureText: value,
                      suffixIcon: GestureDetector(
                        onTap: () => isObscure.value = !value,
                        child: Icon(value ? Icons.visibility_off : Icons.visibility),
                      ),
                    );
                  },
                ),
                LabelTextFormField(
                  label: AppText.birthDate,
                  hintText: AppText.birthDateHint,
                  controller: birthDateController,
                  readOnly: true,
                  onTap: () async {
                    final picked = await showDatePicker(
                      context: context,
                      initialDate: DateTime(2000),
                      firstDate: DateTime(1950),
                      lastDate: DateTime.now(),
                    );
                    if (picked != null) {
                      birthDateController.text = "${picked.year}/${picked.month}/${picked.day}";
                    }
                  },
                ),
                Row(
                  children: [
                    Expanded(
                      child: ValueListenableBuilder(
                        valueListenable: selectedCountry,
                        builder: (context, value, _) {
                          return LabelDropdownMenu(
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
                      child: ValueListenableBuilder(
                        valueListenable: selectedCity,
                        builder: (context, value, _) {
                          return LabelDropdownMenu(
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
                    Text(AppText.gender),
                    Row(
                      children: [
                        Expanded(
                          child: ValueListenableBuilder(
                            valueListenable: selectedGender,
                            builder: (_, value, __) {
                              return LabelRadioButton(
                                label: AppText.male,
                                value: AppText.male,
                                groupValue: value,
                                onChanged: (v) => selectedGender.value = v,
                              );
                            },
                          ),
                        ),
                        Expanded(
                          child: ValueListenableBuilder(
                            valueListenable: selectedGender,
                            builder: (_, value, __) {
                              return LabelRadioButton(
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    StepIndicator(stepText: AppText.page1Of2),
                    ElevatedButton(
                      onPressed: () {
                        model.name = nameController.text;
                        model.phone = phoneController.text;
                        model.email = emailController.text;
                        model.password = passwordController.text;
                        model.birthDate = birthDateController.text;
                        model.gender = selectedGender.value;
                        model.country = selectedCountry.value;
                        model.city = selectedCity.value;

                        nextPage();
                      },
                      child: const Text(AppText.continueText),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// ================= STEP 2 =================
  Widget _buildStep2() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: previousPage,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: SvgPicture.asset(AssetImages.arrowLeft),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              spacing: 18,
              children: [
                LabelTextFormField(label: AppText.currentMedications, hintText: AppText.enterMedications, controller: medicationsController),
                LabelTextFormField(
                  label: AppText.diagnosisDate,
                  hintText: AppText.dateHint,
                  controller: diagnosisDateController,
                  readOnly: true,
                  onTap: () async {
                    final picked = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1950),
                      lastDate: DateTime.now(),
                    );
                    if (picked != null) {
                      diagnosisDateController.text = "${picked.year}/${picked.month}/${picked.day}";
                    }
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    StepIndicator(stepText: AppText.page2Of2),
                    ElevatedButton(
                      onPressed: () {
                        model.medications = medicationsController.text;
                        model.diagnosisDate = diagnosisDateController.text;

                        nextPage();
                      },
                      child: const Text(AppText.continueText),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// ================= STEP 3 =================
  Widget _buildStep3() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: previousPage,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: SvgPicture.asset(AssetImages.arrowLeft),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              spacing: 18,
              children: [
                LabelTextFormField(label: AppText.symptoms, hintText: AppText.enterSymptoms, controller: symptomsController),
                LabelTextFormField(label: AppText.otherDiseases, hintText: AppText.enterOtherDiseases, controller: diseasesController),
                LabelTextFormField(label: AppText.drugAllergies, hintText: AppText.enterDrugAllergies, controller: allergiesController),
                LabelTextFormField(label: AppText.specialNeeds, hintText: AppText.enterSpecialNeeds, controller: needsController),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      model.symptoms = symptomsController.text;
                      model.otherDiseases = diseasesController.text;
                      model.drugAllergies = allergiesController.text;
                      model.specialNeeds = needsController.text;

                      /// FINAL MODEL
                      print(model.name);
                      print(model.symptoms);

                      Navigator.pushReplacementNamed(context, Routes.bottomNavBar);
                    },
                    child: const Text(AppText.confirm),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
