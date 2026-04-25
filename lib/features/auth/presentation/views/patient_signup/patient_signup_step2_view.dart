import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lupus_app/core/constants/app_constants.dart';
import 'package:lupus_app/core/constants/app_text.dart';
import 'package:lupus_app/core/constants/asset_images.dart';
import 'package:lupus_app/core/services/routes.dart';
import 'package:lupus_app/core/theme/styles.dart';
import 'package:lupus_app/features/auth/presentation/views/widgets/already_have_account_text.dart';
import 'package:lupus_app/features/auth/presentation/views/widgets/label_dropdown_menu.dart';
import 'package:lupus_app/features/auth/presentation/views/widgets/label_text_form_field.dart';
import 'package:lupus_app/features/auth/presentation/views/widgets/step_indicator.dart';

class PatientSignupStep2View extends StatelessWidget {
  const PatientSignupStep2View({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedDose = ValueNotifier<String?>(AppConstants.doses.first);
    final selectedFrequency = ValueNotifier<String?>(AppConstants.frequencyOptions.first);
    final selectedLupusType = ValueNotifier<String?>(AppConstants.lupusTypes.first);
    final diagnosisDateController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: SvgPicture.asset(AssetImages.arrowLeft),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            spacing: 16,
            children: [
              Text(
                AppText.patientSignupTitle,
                style: Styles.text20BlackW700(context),
              ),
              Form(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    spacing: 18,
                    children: [
                      LabelTextFormField(label: AppText.currentMedications, hintText: AppText.enterMedications),
                      Row(
                        children: [
                          Expanded(
                            child: ValueListenableBuilder<String?>(
                              valueListenable: selectedDose,
                              builder: (context, value, _) {
                                return LabelDropdownMenu<String>(
                                  label: AppText.dose,
                                  initialSelection: value,
                                  onSelected: (v) => selectedDose.value = v,
                                  dropdownMenuEntries: AppConstants.doses.map((e) => DropdownMenuEntry(value: e, label: e)).toList(),
                                );
                              },
                            ),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: ValueListenableBuilder<String?>(
                              valueListenable: selectedFrequency,
                              builder: (context, value, _) {
                                return LabelDropdownMenu<String>(
                                  label: AppText.frequency,
                                  initialSelection: value,
                                  onSelected: (v) => selectedFrequency.value = v,
                                  dropdownMenuEntries: AppConstants.frequencyOptions.map((e) => DropdownMenuEntry(value: e, label: e)).toList(),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      LabelTextFormField(
                        label: AppText.diagnosisDate,
                        hintText: AppText.dateHint,
                        controller: diagnosisDateController,
                        readOnly: true,
                        suffixIcon: const Icon(Icons.calendar_today),
                        onTap: () async {
                          final pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1950),
                            lastDate: DateTime.now(),
                          );

                          if (pickedDate != null) {
                            diagnosisDateController.text = "${pickedDate.year}/${pickedDate.month}/${pickedDate.day}";
                          }
                        },
                      ),
                      ValueListenableBuilder<String?>(
                        valueListenable: selectedLupusType,
                        builder: (context, value, _) {
                          return LabelDropdownMenu<String>(
                            label: AppText.lupusType,
                            initialSelection: value,
                            onSelected: (v) => selectedLupusType.value = v,
                            dropdownMenuEntries: AppConstants.lupusTypes.map((e) => DropdownMenuEntry(value: e, label: e)).toList(),
                          );
                        },
                      ),
                      const SizedBox(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          StepIndicator(
                            stepText: AppText.page2Of2,
                            latestStep: true,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed(Routes.patientRegisterStep3);
                            },
                            child: const Text(AppText.continueText),
                          ),
                        ],
                      ),
                      const AlreadyHaveAccountText(),
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
