import 'package:flutter/material.dart';
import 'package:lupus_app/core/services/routes.dart';
import 'package:lupus_app/core/shared_widgets/custom_app_bar.dart';
import 'package:lupus_app/core/theme/styles.dart';
import 'package:lupus_app/core/utils/widget_extensions.dart';
import 'package:lupus_app/features/community_support/presentation/views/widgets/progress_bar.dart';
import 'package:lupus_app/features/psychological_support/presentation/views/widgets/new_post_config.dart';

class FinancialSupportDetailsView extends StatelessWidget {
  const FinancialSupportDetailsView(this.financialSupport, {super.key});
  final Map<String, dynamic> financialSupport;

  @override
  Widget build(BuildContext context) {
    final percent = (double.parse(financialSupport['progress']!) * 100).toInt();

    return Scaffold(
      appBar: const CustomAppBar(title: 'تفاصيل الحالة'), //!TODO:AppText
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 250,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          financialSupport["image"] ?? "", //!TODO:AppText
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            financialSupport["title"] ?? "", //!TODO:AppText
                            style: Styles.text16BlackW700(context),
                          ).paddingBottom(10),
                          Text(
                            financialSupport["content"] ?? "", //!TODO:AppText
                            textAlign: TextAlign.right,
                            style: Styles.text13GrayW400(context),
                          ).paddingBottom(32),
                          ProgressBarWidget(
                            percent: percent,
                            isDetailsPage: true,
                            financialSupport: financialSupport['amount'],
                            progress: financialSupport['progress']!,
                            remaining: financialSupport['remaining']!,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 42,
              child: ElevatedButton(
                child: const Text('تبرع الان'), // !TODO:AppText
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    Routes.createContent,
                    arguments: NewPostConfig.donation(
                      onShared: () {
                        Navigator.pop(context);
                        Navigator.pop(context);

                        // Navigator.push(context,MaterialPageRoute( builder: (context) => const DonationMethodsView(),),);//!TODO: DonationMethodsView
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
