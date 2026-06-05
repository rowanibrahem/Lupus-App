import 'package:flutter/material.dart';
import 'package:lupus_app/core/shared_widgets/custom_app_bar.dart';
import 'package:lupus_app/core/theme/styles.dart';
import 'package:lupus_app/core/utils/widget_extensions.dart';
import 'package:lupus_app/features/community_support/presentation/views/widgets/contact_button.dart';

class ContributeDetailsView extends StatelessWidget {
  const ContributeDetailsView(this.contribute, {super.key});
  final Map<String, dynamic> contribute;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'مساهمات'), // !TODO:AppText
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: double.infinity,
              height: 200,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  'assets/images/blood_illustration.png', // !TODO:AppText
                  fit: BoxFit.cover,
                ),
              ),
            ).paddingBottom(16),
            Text(
              contribute["title"] ?? '', // !TODO:AppText
              style: Styles.text14BlackW700(context),
            ).paddingBottom(6),
            Text(
              contribute['description'] ?? "", // !TODO:AppText
              style: Styles.text12GrayW400(context),
            ).paddingBottom(24),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                'طرق التواصل:', // !TODO:AppText
                style: Styles.text14BlackW700(context),
              ),
            ).paddingBottom(16),
            ContactButton(
              label: 'رسالة واتساب', // !TODO:AppText
              svgPicture: 'assets/icons/whats.svg',
              onTap: () {},
            ).paddingBottom(12),
            ContactButton(
              label: 'اتصال هاتفي', // !TODO:AppText
              svgPicture: 'assets/icons/phone.svg',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

