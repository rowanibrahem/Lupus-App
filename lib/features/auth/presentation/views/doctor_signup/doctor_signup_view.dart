import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lupus_app/core/constants/app_constants.dart';
import 'package:lupus_app/core/constants/app_text.dart';
import 'package:lupus_app/core/constants/asset_images.dart';
import 'package:lupus_app/core/services/routes.dart';
import 'package:lupus_app/core/theme/color_app.dart';
import 'package:lupus_app/core/theme/styles.dart';
import 'package:lupus_app/features/auth/data/modals/doctor_signup_model.dart';
import 'package:lupus_app/features/auth/presentation/views/widgets/auth_banner.dart';
import 'package:lupus_app/features/auth/presentation/views/widgets/label_dropdown_menu.dart';
import 'package:lupus_app/features/auth/presentation/views/widgets/label_text_form_field.dart';
import 'package:lupus_app/features/auth/presentation/views/widgets/step_indicator.dart';

class DoctorSignupView extends StatefulWidget {
  const DoctorSignupView({super.key});

  @override
  State<DoctorSignupView> createState() => _DoctorSignupViewState();
}

class _DoctorSignupViewState extends State<DoctorSignupView> {
  final PageController _controller = PageController();

  // STEP 1
  final ValueNotifier<bool> isObscure = ValueNotifier(true);
  final ValueNotifier<String?> selectedCountry = ValueNotifier<String?>(AppConstants.countries.first.name);
  final ValueNotifier<String?> selectedCity = ValueNotifier<String?>(AppConstants.citiesList.first);

  // STEP 2
  final selectedWorkAvailability = ValueNotifier<String?>(AppConstants.workAvailability.first);
  final selectedConsultationTypes = ValueNotifier<String?>(AppConstants.consultationTypes.first);
  final selectedAvailability = ValueNotifier<String?>(AppConstants.availability.first);
  final selectedExperienceYears = ValueNotifier<String?>(AppConstants.experienceYears.first);
  final selectedSpecializationType = ValueNotifier<String?>(AppConstants.specializations.first);
  final selectedAcademicDegree = ValueNotifier<String?>(AppConstants.academicDegrees.first);

  void nextPage() {
    _controller.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void previousPage() {
    _controller.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  final DoctorSignupModel model = DoctorSignupModel();

// controllers (VERY IMPORTANT)
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final workingHoursController = TextEditingController();
  final feesController = TextEditingController();
  final bioController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          controller: _controller,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            /// ================= STEP 1 =================
            SingleChildScrollView(
              child: Column(
                spacing: 16,
                children: [
                  AuthBanner(title: AppText.doctorSignupTitle),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      spacing: 18,
                      children: [
                        LabelTextFormField(
                          label: AppText.doctorName,
                          hintText: AppText.enterPatientName,
                          controller: nameController,
                          // validator: ,
                          // onChanged: (val) => copyWith,
                        ),
                        LabelTextFormField(
                          label: AppText.phoneNumber,
                          hintText: AppText.enterPhoneNumber,
                          controller: phoneController,
                        ),
                        LabelTextFormField(
                          label: AppText.email,
                          hintText: AppText.enterEmail,
                          controller: emailController,
                        ),
                        ValueListenableBuilder<bool>(
                          valueListenable: isObscure,
                          builder: (context, value, _) {
                            return LabelTextFormField(
                              label: AppText.password,
                              hintText: AppText.enterPassword,
                              controller: passwordController,
                              obscureText: value,
                              suffixIcon: GestureDetector(
                                onTap: () => isObscure.value = !isObscure.value,
                                child: Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: value ? const Icon(Icons.visibility_off) : const Icon(Icons.visibility),
                                ),
                              ),
                            );
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
                                      leadingIcon: value == null ? null : Padding(padding: const EdgeInsets.all(16), child: CountryFlag.fromCountryCode(AppConstants.getCountryCode(value), width: 20, height: 20)),
                                      initialSelection: value,
                                      onSelected: (v) => selectedCountry.value = v,
                                      dropdownMenuEntries:
                                          AppConstants.countries.map((country) => DropdownMenuEntry(value: country.name, label: country.name, leadingIcon: CountryFlag.fromCountryCode(country.code, width: 20, height: 20))).toList());
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
                                model.name = nameController.text;
                                model.phone = phoneController.text;
                                model.email = emailController.text;
                                model.password = passwordController.text;
                                model.country = selectedCountry.value;
                                model.city = selectedCity.value;
                                nextPage();
                              },
                              child: Text(AppText.continueText),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            /// ================= STEP 2 =================
            SingleChildScrollView(
              child: Column(
                spacing: 16,
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () => previousPage(),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: SvgPicture.asset(AssetImages.arrowLeft),
                      ),
                    ),
                  ),
                  Text(AppText.doctorSignupTitle, style: Styles.text20BlackW700(context)),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      spacing: 18,
                      children: [
                        /// SPECIALIZATION
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

                        /// DEGREE
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

                        /// EXPERIENCE + AVAILABILITY
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
                          controller: workingHoursController,
                        ),
                        LabelTextFormField(
                          label: AppText.fees,
                          hintText: AppText.feesHint,
                          controller: feesController,
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(12),
                            child: SvgPicture.asset(AssetImages.copyLink),
                          ),
                        ),
                        LabelTextFormField(
                          label: AppText.bio,
                          hintText: AppText.bioHint,
                          controller: bioController,
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Icon(Icons.edit, color: AppColors.blackColor),
                          ),
                        ),

                        /// BUTTONS
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            StepIndicator(
                              stepText: AppText.page2Of2,
                              latestStep: true,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                // 🔥 collect step 2
                                model.specialization = selectedSpecializationType.value;
                                model.academicDegree = selectedAcademicDegree.value;
                                model.experienceYears = selectedExperienceYears.value;
                                model.availability = selectedAvailability.value;
                                model.consultationType = selectedConsultationTypes.value;
                                model.workPlace = selectedWorkAvailability.value;
                                model.workingHours = workingHoursController.text;
                                model.fees = feesController.text;
                                model.bio = bioController.text;
                                // 🔥 now you have FULL MODEL
                                print(model.name);
                                print(model.specialization);
                                print(model.bio);

                                Navigator.pushReplacementNamed(context, Routes.bottomNavBar);
                              },
                              child: const Text(AppText.confirm),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
