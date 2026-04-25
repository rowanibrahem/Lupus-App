import 'package:flutter/material.dart';
import 'package:lupus_app/core/constants/app_text.dart';
import 'package:lupus_app/core/theme/styles.dart';
import 'medication_card.dart';

class MedicationsSection extends StatelessWidget {
  const MedicationsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Title
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppText.medicationTitle,
              style: Styles.textStyle14(context).copyWith(color: Colors.black),
            ),
            Text(AppText.viewAll, style: Styles.textStyle10(context)),
          ],
        ),

        const SizedBox(height: 12),

        const MedicationCard(
          name: "هيدروكسي كلوروكين",
          sub: "Hydroxychloroquine",
          dose: "400 mg",
          time: "9:00 ص",
        ),

        const SizedBox(height: 10),

        const MedicationCard(
          name: "وظائف الكبد",
          sub: "LFTs",
          dose: "",
          time: "10:00 ص",
        ),
      ],
    );
  }
}
