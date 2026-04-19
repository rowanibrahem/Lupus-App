import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lupus_app/core/constants/app_constants.dart';
import 'package:lupus_app/core/constants/app_text.dart';
import 'package:lupus_app/core/constants/asset_images.dart';
import 'package:lupus_app/core/theme/color_app.dart';
import 'package:lupus_app/features/auth/presentation/views/widgets/already_have_account_text.dart';
import 'package:lupus_app/features/auth/presentation/views/widgets/label_dropdown_menu.dart';
import 'package:lupus_app/features/auth/presentation/views/widgets/label_text_form_field.dart';
import 'package:lupus_app/features/auth/presentation/views/widgets/step_indicator.dart';
import 'package:lupus_app/features/home/presentation/views/bottom_nav_bar_view.dart';

class DoctorSignupStep2View extends StatelessWidget {
  const DoctorSignupStep2View({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedWorkAvailability = ValueNotifier<String?>(AppConstants.workAvailability.first);
    final selectedConsultationTypes = ValueNotifier<String?>(AppConstants.consultationTypes.first);
    final selectedAvailability = ValueNotifier<String?>(AppConstants.availability.first);
    final selectedExperienceYears = ValueNotifier<String?>(AppConstants.experienceYears.first);
    final selectedSpecializationType = ValueNotifier<String?>(AppConstants.specializations.first);
    final selectedAcademicDegree = ValueNotifier<String?>(AppConstants.academicDegrees.first);

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
                AppText.doctorSignupTitle,
                style: TextStyle(
                  color: AppColors.blackColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  height: 1.0,
                  letterSpacing: 0.0,
                ),
              ),
              Form(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    spacing: 18,
                    children: [
                      ValueListenableBuilder<String?>(
                        valueListenable: selectedSpecializationType,
                        builder: (context, value, _) {
                          return LabelDropdownMenu<String>(
                            label: AppText.specialization,
                            initialSelection: value,
                            onSelected: (v) => selectedSpecializationType.value = v,
                            dropdownMenuEntries: AppConstants.specializations.map((e) => DropdownMenuEntry(value: e, label: e)).toList(),
                          );
                        },
                      ),
                      ValueListenableBuilder<String?>(
                        valueListenable: selectedAcademicDegree,
                        builder: (context, value, _) {
                          return LabelDropdownMenu<String>(
                            label: AppText.academicDegree,
                            initialSelection: value,
                            onSelected: (v) => selectedAcademicDegree.value = v,
                            dropdownMenuEntries: AppConstants.academicDegrees.map((e) => DropdownMenuEntry(value: e, label: e)).toList(),
                          );
                        },
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: ValueListenableBuilder<String?>(
                              valueListenable: selectedExperienceYears,
                              builder: (context, value, _) {
                                return LabelDropdownMenu<String>(
                                  label: AppText.experienceYears,
                                  initialSelection: value,
                                  onSelected: (v) => selectedExperienceYears.value = v,
                                  dropdownMenuEntries: AppConstants.experienceYears.map((e) => DropdownMenuEntry(value: e, label: e)).toList(),
                                );
                              },
                            ),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: ValueListenableBuilder<String?>(
                              valueListenable: selectedAvailability,
                              builder: (context, value, _) {
                                return LabelDropdownMenu<String>(
                                  label: AppText.availability,
                                  initialSelection: value,
                                  onSelected: (v) => selectedAvailability.value = v,
                                  dropdownMenuEntries: AppConstants.availability.map((e) => DropdownMenuEntry(value: e, label: e)).toList(),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      ValueListenableBuilder<String?>(
                        valueListenable: selectedConsultationTypes,
                        builder: (context, value, _) {
                          return LabelDropdownMenu<String>(
                            label: AppText.consultationType,
                            initialSelection: value,
                            onSelected: (v) => selectedConsultationTypes.value = v,
                            dropdownMenuEntries: AppConstants.consultationTypes.map((e) => DropdownMenuEntry(value: e, label: e)).toList(),
                          );
                        },
                      ),
                      ValueListenableBuilder<String?>(
                        valueListenable: selectedWorkAvailability,
                        builder: (context, value, _) {
                          return LabelDropdownMenu<String>(
                            label: AppText.workPlace,
                            initialSelection: value,
                            onSelected: (v) => selectedWorkAvailability.value = v,
                            dropdownMenuEntries: AppConstants.workAvailability.map((e) => DropdownMenuEntry(value: e, label: e)).toList(),
                          );
                        },
                      ),
                      LabelTextFormField(label: AppText.workingHours, hintText: AppText.workingHoursHint),
                      LabelTextFormField(
                        label: AppText.fees,
                        hintText: AppText.feesHint,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(12),
                          child: SvgPicture.asset(AssetImages.copyLink),
                        ),
                      ),
                      LabelTextFormField(
                        label: AppText.bio,
                        hintText: AppText.bioHint,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Icon(Icons.edit, color: AppColors.blackColor),
                        ),
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
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const BottomNavBarView(),
                                ),
                              );
                            },
                            child: const Text(AppText.confirm),
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
