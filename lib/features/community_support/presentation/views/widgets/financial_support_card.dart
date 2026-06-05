import 'package:flutter/material.dart';
import 'package:lupus_app/core/services/routes.dart';
import 'package:lupus_app/core/shared_widgets/custom_card.dart';
import 'package:lupus_app/core/theme/color_app.dart';
import 'package:lupus_app/core/theme/styles.dart';
import 'package:lupus_app/core/utils/widget_extensions.dart';
import 'package:lupus_app/features/community_support/presentation/views/widgets/progress_bar.dart';
import 'package:lupus_app/features/psychological_support/presentation/views/widgets/new_post_config.dart';

class FinancialSupportCard extends StatelessWidget {
  const FinancialSupportCard(this.financialSupport, {super.key});
  final Map<String, String> financialSupport;

  @override
  Widget build(BuildContext context) {
    final percent = (double.parse(financialSupport['progress']!) * 100).toInt();

    return CustomCard(
      Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(0),
            child: ClipRRect(
              // borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
              child: Image.asset(
                financialSupport['image'] ?? "", // !TODO:AppAssets
                width: double.infinity,
                height: 160,
                fit: BoxFit.cover,
              ),
            ),
          ).paddingBottom(14),
          Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  financialSupport['title'] ?? "", // !TODO:AppText
                  style: Styles.text14BlackW700(context),
                ).paddingBottom(4),
                ProgressBarWidget(
                  percent: percent,
                  financialSupport: financialSupport['amount']!,
                  progress: financialSupport['progress']!,
                  remaining: financialSupport['remaining']!,
                ),
                _buildButtons(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButtons(BuildContext context) {
    return Row(
      spacing: 12,
      children: [
        Expanded(
          child: SizedBox(
            height: 42,
            child: OutlinedButton(
              onPressed: () => Navigator.pushNamed(context, Routes.financialSupportDetails, arguments: financialSupport),
              child: Text(
                'تفاصيل الحالة', // !TODO:AppText
                style: Styles.text13WhiteW600(context).copyWith(color: AppColors.primaryColor),
              ),
            ),
          ),
        ),
        Expanded(
          child: SizedBox(
            height: 42,
            child: ElevatedButton(
              onPressed: () => Navigator.pushNamed(
                context,
                Routes.createContent,
                arguments: NewPostConfig.donation(onShared: () => Navigator.pop(context)),
              ),
              child: Text(
                'تبرع الان', // !TODO:AppText
                style: Styles.text13WhiteW600(context),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
