import 'package:flutter/material.dart';
import 'package:lupus_app/core/constants/app_text.dart';
import 'package:lupus_app/core/constants/asset_icons.dart';
import 'package:lupus_app/core/services/routes.dart';
import 'package:lupus_app/core/theme/styles.dart';
import 'service_item.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    int crossAxisCount = 4;
    if (screenWidth > 900) {
      crossAxisCount = 6;
    } else if (screenWidth > 600) {
      crossAxisCount = 5;
    }

    final services = [
      ServiceItem(icon: AssetIcons.brain, title: AppText.serviceAwareness),
      ServiceItem(icon: AssetIcons.medicine, title: AppText.serviceMedicine),
      ServiceItem(icon: AssetIcons.tahalil, title: AppText.serviceTests),
      ServiceItem(
        icon: AssetIcons.friendsIcon,
        title: AppText.serviceFriends,
        // onTap: () => Navigator.of(context).pushNamed(Routes.communitySupport),
      ),
      ServiceItem(
        icon: AssetIcons.support,
        title: AppText.serviceMentalSupport,
        onTap: () => Navigator.of(context).pushNamed(Routes.psychologicalSupport),
      ),
      ServiceItem(
        icon: AssetIcons.support,
        title: "الجمعيات",
        onTap: () => Navigator.of(context).pushNamed(Routes.communitySupport),
      ),
      ServiceItem(
        icon: AssetIcons.mosque,
        title: "ديننا تقوي",
        onTap: () => Navigator.of(context).pushNamed(Routes.religion),
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Title Row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppText.servicesTitle,
              style: Styles.textStyle14(context).copyWith(color: Colors.black),
            ),
            Text(
              AppText.viewAll,
              style: Styles.textStyle10(context),
            ),
          ],
        ),

        const SizedBox(height: 16),

        /// Grid بدل Row 🔥
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: services.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            mainAxisSpacing: 4,
            crossAxisSpacing: 4,
            childAspectRatio: 1,
          ),
          itemBuilder: (context, index) {
            return services[index];
          },
        ),
      ],
    );
  }
}
