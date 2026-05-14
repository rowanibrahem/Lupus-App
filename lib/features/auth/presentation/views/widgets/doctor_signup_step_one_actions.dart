import 'package:flutter/material.dart';
import 'package:lupus_app/core/constants/app_text.dart';
import 'package:lupus_app/features/auth/presentation/views/widgets/step_indicator.dart';

class DoctorSignupStepOneActions extends StatelessWidget {
  const DoctorSignupStepOneActions({super.key, this.onPressed});
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const StepIndicator(stepText: AppText.page1Of2),
        ElevatedButton(
          onPressed: onPressed,
          child: const Text(AppText.continueText),
        ),
      ],
    );
  }
}
