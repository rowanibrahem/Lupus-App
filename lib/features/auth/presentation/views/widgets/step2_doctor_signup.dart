import 'package:flutter/material.dart';
import 'package:lupus_app/core/constants/app_text.dart';
import 'package:lupus_app/features/auth/presentation/views/widgets/auth_banner.dart';

class Step2DoctorSignup extends StatelessWidget {
  const Step2DoctorSignup({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        spacing: 16,
        children: [
          AuthBanner(title: AppText.doctorSignupTitle),
        ],
      ),
    );
  }
}