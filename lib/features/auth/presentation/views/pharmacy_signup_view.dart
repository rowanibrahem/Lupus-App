import 'package:flutter/material.dart';
import 'package:lupus_app/core/constants/app_text.dart';
import 'package:lupus_app/core/services/routes.dart';
import 'package:lupus_app/core/shared_widgets/body_view.dart';
import 'package:lupus_app/features/auth/presentation/views/widgets/already_have_account_text.dart';
import 'package:lupus_app/features/auth/presentation/views/widgets/auth_banner.dart';
import 'package:lupus_app/features/auth/presentation/views/widgets/pharmacy_signup_button.dart';
import 'package:lupus_app/features/auth/presentation/views/widgets/pharmacy_signup_fields.dart';

class PharmacySignupView extends StatefulWidget {
  const PharmacySignupView({super.key});

  @override
  State<PharmacySignupView> createState() => _PharmacySignupViewState();
}

class _PharmacySignupViewState extends State<PharmacySignupView> {
  @override
  Widget build(BuildContext context) {
    return BodyView(
      SingleChildScrollView(
        padding: EdgeInsets.zero,
        child: Form(
          child: Column(
            children: [
              AuthBanner(title: AppText.pharmacySignupTitle),
              const SizedBox(height: 16),
              PharmacySignupFields(),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: () => Navigator.of(context).pushReplacementNamed(Routes.bottomNavBar),
                child: Text(AppText.confirm),
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
