import 'package:flutter/material.dart';
import 'package:lupus_app/core/constants/app_text.dart';
import 'package:lupus_app/core/services/routes.dart';
import 'package:lupus_app/features/auth/presentation/views/widgets/already_have_account_text.dart';
import 'package:lupus_app/features/auth/presentation/views/widgets/auth_banner.dart';
import 'package:lupus_app/features/auth/presentation/views/widgets/label_text_form_field.dart';

class PharmacySignupView extends StatelessWidget {
  const PharmacySignupView({super.key});

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<bool> isObscure = ValueNotifier(true);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            spacing: 16,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AuthBanner(title: AppText.pharmacySignupTitle),
              Form(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    spacing: 18,
                    children: [
                      LabelTextFormField(label: AppText.pharmacyName, hintText: AppText.enterPatientName),
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
                                child: value ? Icon(Icons.visibility_off) : Icon(Icons.visibility),
                              ),
                            ),
                          );
                        },
                      ),
                      LabelTextFormField(label: AppText.contactNumber, hintText: AppText.enterContactNumber),
                      LabelTextFormField(label: AppText.address, hintText: AppText.enterAddress),
                      const SizedBox(height: 24),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacementNamed(Routes.bottomNavBar);
                          },
                          child: Text(AppText.confirm),
                        ),
                      ),
                      AlreadyHaveAccountText(),
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
