import 'package:flutter/material.dart';
import 'package:lupus_app/core/services/routes.dart';
import 'package:lupus_app/core/shared_widgets/custom_card.dart';
import 'package:lupus_app/core/theme/styles.dart';
import 'package:lupus_app/core/utils/widget_extensions.dart';

class ContributionCard extends StatelessWidget {
  const ContributionCard(this.contribute, {super.key});
  final Map<String, dynamic> contribute;

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16,
        children: [
          // ── illustration ───────────────────────────
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              contribute['image'] ?? "", //!TODO:AppText
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          // ── text + button ──────────────────────────
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  contribute['title'] ?? '', // !TODO:AppText
                  style: Styles.text14BlackW700(context),
                ).paddingBottom(6),
                Text(
                  contribute['description'] ?? "", // !TODO:AppText
                  style: Styles.text12GrayW400(context),
                ).paddingBottom(6),
                Align(
                  alignment: Alignment.centerLeft,
                  child: SizedBox(
                    height: 38,
                    child: ElevatedButton(
                      onPressed: () => Navigator.pushNamed(
                        context,
                        Routes.contributeDetails,
                        arguments: contribute,
                      ),
                      child: Text(
                        'عرض التفاصيل', // !TODO:AppText
                        style: Styles.text12WhiteW400(context),
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
