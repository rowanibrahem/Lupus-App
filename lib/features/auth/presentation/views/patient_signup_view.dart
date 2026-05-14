import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lupus_app/core/constants/app_constants.dart';
import 'package:lupus_app/core/constants/app_text.dart';
import 'package:lupus_app/core/constants/asset_images.dart';
import 'package:lupus_app/core/services/routes.dart';
import 'package:lupus_app/core/shared_widgets/body_view.dart';
import 'package:lupus_app/features/auth/data/modals/patient_signup_model.dart';
import 'package:lupus_app/features/auth/presentation/views/widgets/auth_banner.dart';
import 'package:lupus_app/core/shared_widgets/label_text_form_field.dart';
import 'package:lupus_app/features/auth/presentation/views/widgets/patient_signup_step_one_actions.dart';
import 'package:lupus_app/features/auth/presentation/views/widgets/patient_signup_step_one_fields.dart';
import 'package:lupus_app/features/auth/presentation/views/widgets/step_indicator.dart';

class PatientSignupView extends StatefulWidget {
  const PatientSignupView({super.key});

  @override
  State<PatientSignupView> createState() => _PatientSignupViewState();
}

class _PatientSignupViewState extends State<PatientSignupView> {
  final PageController _controller = PageController();
  PatientSignupModel model = PatientSignupModel();
  void nextPage() => _controller.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
  void previousPage() => _controller.previousPage(duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);

  final isObscure = ValueNotifier(true);
  final selectedGender = ValueNotifier<String?>(AppText.male);
  final selectedCountry = ValueNotifier<String?>(AppConstants.countries.first.name);
  final selectedCity = ValueNotifier<String?>(AppConstants.citiesList.first);
  final selectedDose = ValueNotifier<String?>(AppConstants.doses.first);
  final selectedFrequency = ValueNotifier<String?>(AppConstants.frequencyOptions.first);
  final selectedLupusType = ValueNotifier<String?>(AppConstants.lupusTypes.first);
  final ValueNotifier<DateTime?> birthDateNotifier = ValueNotifier(null);

  final GlobalKey<FormState> step1FormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> step2FormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> step3FormKey = GlobalKey<FormState>();

  final ValueNotifier<AutovalidateMode> step1AutovalidateMode = ValueNotifier(AutovalidateMode.disabled);
  final ValueNotifier<AutovalidateMode> step2AutovalidateMode = ValueNotifier(AutovalidateMode.disabled);
  final ValueNotifier<AutovalidateMode> step3AutovalidateMode = ValueNotifier(AutovalidateMode.disabled);

  void step1EnableAutoValidation() => step1AutovalidateMode.value = step1AutovalidateMode.value == AutovalidateMode.disabled ? AutovalidateMode.always : step1AutovalidateMode.value;
  void step2EnableAutoValidation() => step2AutovalidateMode.value = step2AutovalidateMode.value == AutovalidateMode.disabled ? AutovalidateMode.always : step2AutovalidateMode.value;
  void step3EnableAutoValidation() => step3AutovalidateMode.value = step3AutovalidateMode.value == AutovalidateMode.disabled ? AutovalidateMode.always : step3AutovalidateMode.value;

  late final TextEditingController _nameController;
  @override
  void dispose() {
    isObscure.dispose();
    selectedGender.dispose();
    selectedCountry.dispose();
    selectedCity.dispose();
    selectedDose.dispose();
    selectedFrequency.dispose();
    selectedLupusType.dispose();
    step1AutovalidateMode.dispose();
    step2AutovalidateMode.dispose();
    _nameController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: model.name ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return BodyView(
      PageView(
        controller: _controller,
        physics: const NeverScrollableScrollPhysics(),
        children: [_buildStep1(), _buildStep2(), _buildStep3()],
      ),
    );
  }

  Widget _buildStep1() {
    return SingleChildScrollView(
      child: Form(
        key: step1FormKey,
        autovalidateMode: step1AutovalidateMode.value,
        child: Column(
          spacing: 16,
          children: [
            AuthBanner(title: AppText.patientSignupTitle),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                spacing: 18,
                children: [
                  PatientSignupStepOneFields(),
                  PatientSignupStepOneActions(onPressed: () {
                    debugPrint("Name1: ${model.name}");
                    if (step1FormKey.currentState!.validate()) {
                      step1FormKey.currentState!.save();
                      nextPage();
                      debugPrint("Name2: ${model.name}");
                    } else {
                      step1EnableAutoValidation();
                    }
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


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
                LabelTextFormField(label: AppText.currentMedications, hintText: AppText.enterMedications),
                LabelTextFormField(
                  label: AppText.diagnosisDate,
                  hintText: AppText.dateHint,
                  readOnly: true,
                  onTap: () async {
                    final picked = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1950),
                      lastDate: DateTime.now(),
                    );
                    if (picked != null) {
                      // diagnosisDateController.text = "${picked.year}/${picked.month}/${picked.day}";
                    }
                  },
                ),
               
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    StepIndicator(stepText: AppText.page2Of2),
                    ElevatedButton(
                      onPressed: () {
                        // model.medications = medicationsController.text;
                        // model.diagnosisDate = diagnosisDateController.text;

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
                LabelTextFormField(label: AppText.symptoms, hintText: AppText.enterSymptoms),
                LabelTextFormField(label: AppText.otherDiseases, hintText: AppText.enterOtherDiseases),
                LabelTextFormField(label: AppText.drugAllergies, hintText: AppText.enterDrugAllergies),
                LabelTextFormField(label: AppText.specialNeeds, hintText: AppText.enterSpecialNeeds),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
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
