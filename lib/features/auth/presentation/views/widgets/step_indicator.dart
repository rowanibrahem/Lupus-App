import 'package:flutter/material.dart';
import 'package:lupus_app/core/theme/color_app.dart';

class StepIndicator extends StatelessWidget {
  final String stepText;
  final bool latestStep;

  const StepIndicator({
    super.key,
    required this.stepText,
    this.latestStep = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 48),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: latestStep ? AppColors.primaryColor : AppColors.lightGrayColor,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.primaryColor,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          stepText,
          style: const TextStyle(
            color: AppColors.blackColor,
            fontWeight: FontWeight.w700,
            fontSize: 10,
            height: 1.0,
            letterSpacing: 0,
          ),
        ),
      ],
    );
  }
}
