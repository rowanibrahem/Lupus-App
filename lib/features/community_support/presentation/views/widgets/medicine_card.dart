import 'package:flutter/material.dart';
import 'package:lupus_app/core/services/routes.dart';
import 'package:lupus_app/core/shared_widgets/custom_card.dart';
import 'package:lupus_app/core/theme/styles.dart';
import 'package:lupus_app/core/utils/widget_extensions.dart';

class MedicineCard extends StatelessWidget {
  const MedicineCard(this.medicine, {super.key});
  final Map<String, String> medicine;

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              medicine['image'] ?? "",// !TODO:AppAssets
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  medicine['title'] ?? '',// !TODO:AppText
                  style: Styles.text14BlackW700(context),
                ).paddingBottom(6),
                Text(
                  medicine['description'] ?? "",// !TODO:AppText
                  style: Styles.text12GrayW400(context),
                ).paddingBottom(6),
                Align(
                  alignment: Alignment.centerLeft,
                  child: SizedBox(
                    height: 38,
                    child: ElevatedButton(
                      onPressed: () => Navigator.pushNamed(context, Routes.medicineDetails, arguments: medicine),
                      child: Text(
                        "تواصل مع الحالة", // !TODO:AppText
                        style: Styles.text12WhiteW400(context).copyWith(fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
