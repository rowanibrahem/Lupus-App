import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lupus_app/core/constants/app_text.dart';
import 'package:lupus_app/core/constants/asset_images.dart';
import 'package:lupus_app/core/services/routes.dart';
import 'package:lupus_app/core/shared_widgets/body_view.dart';
import 'package:lupus_app/features/auth/data/modals/doctor_signup_model.dart';
import 'package:lupus_app/features/auth/presentation/views/widgets/already_have_account_text.dart';
import 'package:lupus_app/features/auth/presentation/views/widgets/auth_banner.dart';
import 'package:lupus_app/features/auth/presentation/views/widgets/doctor_signup_step_one_actions.dart';
import 'package:lupus_app/features/auth/presentation/views/widgets/doctor_signup_step_one_fields.dart';
import 'package:lupus_app/features/auth/presentation/views/widgets/doctor_signup_step_two_actions.dart';
import 'package:lupus_app/features/auth/presentation/views/widgets/doctor_signup_step_two_fields.dart';

class DoctorSignupView extends StatefulWidget {
  const DoctorSignupView({super.key});

  @override
  State<DoctorSignupView> createState() => _DoctorSignupViewState();
}

class _DoctorSignupViewState extends State<DoctorSignupView> {
  final PageController controller = PageController();
  final DoctorSignupModel model = DoctorSignupModel();
  void nextPage() => controller.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
  void previousPage() => controller.previousPage(duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);

  final GlobalKey<FormState> step1FormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> step2FormKey = GlobalKey<FormState>();
  final ValueNotifier<AutovalidateMode> step1AutovalidateMode = ValueNotifier(AutovalidateMode.disabled);
  final ValueNotifier<AutovalidateMode> step2AutovalidateMode = ValueNotifier(AutovalidateMode.disabled);
  void step1EnableAutoValidation() => step1AutovalidateMode.value = step1AutovalidateMode.value == AutovalidateMode.disabled ? AutovalidateMode.always : step1AutovalidateMode.value;
  void step2enableAutoValidation() => step2AutovalidateMode.value = step2AutovalidateMode.value == AutovalidateMode.disabled ? AutovalidateMode.always : step2AutovalidateMode.value;

  @override
  void dispose() {
    controller.dispose();
    step1AutovalidateMode.dispose();
    step2AutovalidateMode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BodyView(
      PageView(
        controller: controller,
        physics: const NeverScrollableScrollPhysics(),
        children: [_buildStep1(), _buildStep2()],
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
            AuthBanner(title: AppText.doctorSignupTitle),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                spacing: 18,
                children: [
                  DoctorSignupStepOneFields(),
                  DoctorSignupStepOneActions(
                    onPressed: () {
                      if (step1FormKey.currentState!.validate()) {
                        step1FormKey.currentState!.save();
                        nextPage();
                      } else {
                        step1EnableAutoValidation();
                      }
                    },
                  ),
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
      child: Form(
        key: step2FormKey,
        autovalidateMode: step2AutovalidateMode.value,
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
            // Text(AppText.doctorSignupTitle, style: Styles.text20BlackW700(context)),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  DoctorSignupStepTwoFields(),
                  const SizedBox(height: 32),
                  DoctorSignupStepTwoActions(
                    onPressed: () {
                      if (step2FormKey.currentState!.validate()) {
                        step2FormKey.currentState!.save();
                        Navigator.of(context).pushReplacementNamed(Routes.bottomNavBar);
                      } else {
                        step2enableAutoValidation();
                      }
                    },
                  ),
                ],
              ),
            ),
            AlreadyHaveAccountText(),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}