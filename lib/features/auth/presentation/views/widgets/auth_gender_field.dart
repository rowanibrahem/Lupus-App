import 'package:flutter/material.dart';
import 'package:lupus_app/core/constants/app_text.dart';
import 'package:lupus_app/core/shared_widgets/label_radio_button.dart';

class GenderField extends StatelessWidget {
  const GenderField({
    super.key,
    required this.selectedGender,
  });

  final ValueNotifier<String?> selectedGender;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppText.gender),
        ValueListenableBuilder<String?>(
          valueListenable: selectedGender,
          builder: (_, value, __) {
            return Row(
              children: [
                Expanded(
                  child: LabelRadioButton(
                    label: AppText.male,
                    value: AppText.male,
                    groupValue: value,
                    onChanged: (v) => selectedGender.value = v,
                  ),
                ),
                Expanded(
                  child: LabelRadioButton(
                    label: AppText.female,
                    value: AppText.female,
                    groupValue: value,
                    onChanged: (v) => selectedGender.value = v,
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}