import 'package:flutter/material.dart';
import 'package:lupus_app/core/shared_widgets/custom_app_bar.dart';
import 'package:lupus_app/core/shared_widgets/custom_card.dart';
import 'package:lupus_app/core/theme/color_app.dart';
import 'package:lupus_app/core/theme/styles.dart';
import 'package:lupus_app/core/utils/widget_extensions.dart';
import 'package:lupus_app/features/community_support/presentation/views/widgets/contact_button.dart';

class MedicineDetailsView extends StatelessWidget {
  const MedicineDetailsView(this.medicine, {super.key});
  final Map<String, dynamic> medicine;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'تواصل مع الحالة'), // !TODO:AppText
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _InfoCard().paddingBottom(20),
            _QuickMessageSection().paddingBottom(28),
            Text('طرق التواصل', style: Styles.text14BlackW700(context)).paddingBottom(12), // !TODO:AppText
            ContactButton(
              label: 'رسالة واتساب', // !TODO:AppText
              svgPicture: 'assets/icons/whats.svg',
              onTap: () {},
            ).paddingBottom(12),
            ContactButton(
              label: 'اتصال هاتفي', // !TODO:AppText
              svgPicture: "assets/icons/phone.svg",
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
      decoration: Styles.primaryGradientDecoration.copyWith(
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              _InfoRow(
                label: 'نوع الطلب:', // !TODO:AppText
                value: 'حالة دواء مسجّلة',
              ),
              SizedBox(height: 12),
              _InfoRow(
                label: 'الجهة:', // !TODO:AppText
                value: 'عبر جمعية',
              ),
              SizedBox(height: 12),
              _InfoRow(
                label: 'الحالة:', // !TODO:AppText
                value: 'عاجلة 🚨',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
class _InfoRow extends StatelessWidget {
  const _InfoRow({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 6,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          label,
          style: Styles.text14BlackW700(context).copyWith(color: AppColors.whiteSoft),
        ),
        Text(
          value,
          style: Styles.text13WhiteW600(context),
        ),
      ],
    );
  }
}
class _QuickMessageSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomCard(
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'رسالة سريعة', // !TODO:AppText
            style: Styles.text14BlackW700(context),
          ).paddingBottom(12),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(14),
            decoration: Styles.msgDecoration,
            child: Text(
              'مرحبًا، أنا حابب أساعد في توفير الدواء المطلوب.\nياريت توضحوا طريقة التسليم أو التنسيق.', // !TODO:AppText
              textAlign: TextAlign.right,
              style: Styles.text10BlackW500(context),
            ),
          ).paddingBottom(12),
          Align(
            alignment: Alignment.centerLeft,
            child: SizedBox(
              height: 42,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'تعديل الرسالة', // !TODO:AppText
                  style: Styles.text12BlackW700(context).copyWith(color: AppColors.whiteSoft),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
