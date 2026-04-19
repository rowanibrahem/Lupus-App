import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lupus_app/core/constants/app_text.dart';
import 'package:lupus_app/core/constants/asset_images.dart';
import 'package:lupus_app/core/services/routes.dart';
import 'package:lupus_app/core/theme/color_app.dart';
import 'package:lupus_app/features/auth/presentation/views/widgets/label_text_form_field.dart';

class PatientSignupStep3View extends StatelessWidget {
  const PatientSignupStep3View({super.key});

  @override
  Widget build(BuildContext context) {
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
                AppText.completeProfile,
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
                      LabelTextFormField(label: AppText.symptoms, hintText: AppText.enterSymptoms),
                      LabelTextFormField(label: AppText.otherDiseases, hintText: AppText.enterOtherDiseases),
                      LabelTextFormField(label: AppText.drugAllergies, hintText: AppText.enterDrugAllergies),
                      LabelTextFormField(label: AppText.specialNeeds, hintText: AppText.enterSpecialNeeds),
                      LabelTextFormField(
                        label: AppText.uploadReports,
                        hintText: AppText.addLinkOrUpload,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(12),
                          child: SvgPicture.asset(AssetImages.copyLink),
                        ),
                      ),
                      const SizedBox(height: 24),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacementNamed(Routes.bottomNavBar);
                          },
                          child: const Text(AppText.confirm),
                        ),
                      ),
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
