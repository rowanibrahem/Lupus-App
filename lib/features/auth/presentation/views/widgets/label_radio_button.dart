import 'package:flutter/material.dart';
import 'package:lupus_app/core/theme/color_app.dart';

class LabelRadioButton<T> extends StatelessWidget {
  final String label;
  final T value;
  final T? groupValue;
  final ValueChanged<T?> onChanged;

  const LabelRadioButton({
    super.key,
    required this.label,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min, // Prevents taking up too much space
      children: [
        Radio<T>(
          value: value,
          groupValue: groupValue,
          activeColor: AppColors.primaryColor,
          onChanged: onChanged,
        ),
        Text(
          label,
          style: const TextStyle(
            color: AppColors.blackColor,
            fontWeight: FontWeight.w700,
            fontSize: 12,
            height: 1.0,
          ),
        ),
      ],
    );
  }
}
