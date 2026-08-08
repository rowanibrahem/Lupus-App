import 'package:flutter/material.dart';
import 'package:lupus_app/core/theme/color_app.dart';
import 'package:lupus_app/core/theme/styles.dart';
import 'package:lupus_app/core/utils/widget_extensions.dart';

class ProgressBarWidget extends StatelessWidget {
  const ProgressBarWidget({
    super.key,
    required this.percent,
    required this.progress,
    required this.remaining,
    required this.financialSupport,
    this.isDetailsPage = false,
  });

  final int percent;
  final String progress;
  final String remaining;
  final String financialSupport;
  final bool isDetailsPage;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'المبلغ المطلوب $financialSupport', // !TODO:AppText
              style:
              isDetailsPage?
              Styles.text12BlackW700(context)
              :
               Styles.text12GrayW400(context),
            ).paddingBottom(10),
            Row(
              spacing: 8,
              children: [
                Text(
                  '$percent%',
                  style: Styles.text11PrimaryW600(context),
                ),
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: LinearProgressIndicator(
                      value: double.parse(progress),
                      minHeight: 8,
                      backgroundColor: AppColors.lightGrayColor,
                      valueColor: const AlwaysStoppedAnimation<Color>(
                        AppColors.primaryColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ).paddingBottom(8),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'باقي $remaining', // !TODO:AppText
            style: Styles.text11GrayW500(context),
          ),
        ).paddingBottom(12),
      ],
    );
  }
}
