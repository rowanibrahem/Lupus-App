import 'package:flutter/material.dart';
import 'package:lupus_app/core/constants/app_text.dart';
import 'package:lupus_app/core/services/routes.dart';
import 'package:lupus_app/core/shared_widgets/body_view.dart';
import 'package:lupus_app/features/auth/presentation/views/widgets/already_have_account_text.dart';
import 'package:lupus_app/features/auth/presentation/views/widgets/auth_banner.dart';
import 'package:lupus_app/features/auth/presentation/views/widgets/patient_member_signup_button.dart';
import 'package:lupus_app/features/auth/presentation/views/widgets/patient_member_signup_fields.dart';

class PatientMemberSignupView extends StatefulWidget {
  const PatientMemberSignupView({super.key});

  @override
  State<PatientMemberSignupView> createState() => _PatientMemberSignupViewState();
}

class _PatientMemberSignupViewState extends State<PatientMemberSignupView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final ValueNotifier<AutovalidateMode> autovalidateMode = ValueNotifier(AutovalidateMode.disabled);
  void enableAutoValidation() => autovalidateMode.value = autovalidateMode.value == AutovalidateMode.disabled ? AutovalidateMode.always : autovalidateMode.value;

  @override
  void dispose() {
    autovalidateMode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BodyView(
      SingleChildScrollView(
        padding: EdgeInsets.zero,
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode.value,
          child: Column(
            children: [
              AuthBanner(title: AppText.patientFamilyTitle),
              const SizedBox(height: 16),
              PatientMemberSignupFields(),
              PatientMemberSignupButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    Navigator.of(context).pushReplacementNamed(Routes.bottomNavBar);
                  } else {
                    enableAutoValidation();
                  }
                },
              ),
              AlreadyHaveAccountText(),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
