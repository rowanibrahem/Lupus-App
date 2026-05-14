import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lupus_app/core/constants/app_constants.dart';
import 'package:lupus_app/core/constants/app_text.dart';
import 'package:lupus_app/core/constants/asset_images.dart';
import 'package:lupus_app/core/shared_widgets/label_dropdown_menu.dart';
import 'package:lupus_app/core/shared_widgets/label_text_form_field.dart';
import 'package:lupus_app/core/theme/color_app.dart';

class DoctorSignupStepTwoFields extends StatefulWidget {
  const DoctorSignupStepTwoFields({super.key});

  @override
  State<DoctorSignupStepTwoFields> createState() => _DoctorSignupStepTwoFieldsState();
}

class _DoctorSignupStepTwoFieldsState extends State<DoctorSignupStepTwoFields> {
  final ValueNotifier<String?> selectedSpecializationType = ValueNotifier<String?>(AppConstants.specializations.first);
  final ValueNotifier<String?> selectedAcademicDegree = ValueNotifier<String?>(AppConstants.academicDegrees.first);
  final ValueNotifier<String?> selectedExperienceYears = ValueNotifier<String?>(AppConstants.experienceYears.first);
  final ValueNotifier<String?> selectedAvailability = ValueNotifier<String?>(AppConstants.availability.first);
  final ValueNotifier<String?> selectedConsultationTypes = ValueNotifier<String?>(AppConstants.consultationTypes.first);
  final ValueNotifier<String?> selectedWorkAvailability = ValueNotifier<String?>(AppConstants.workAvailability.first);

  @override
  void dispose() {
    selectedSpecializationType.dispose();
    selectedAcademicDegree.dispose();
    selectedExperienceYears.dispose();
    selectedAvailability.dispose();
    selectedConsultationTypes.dispose();
    selectedWorkAvailability.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
        LabelTextFormField(
          label: AppText.workingHours,
          hintText: AppText.workingHoursHint,
        ),
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
      ],
    );
  }
}
