import 'package:flutter/material.dart';
import 'package:lupus_app/core/constants/app_constants.dart';
import 'package:lupus_app/core/constants/app_text.dart';
import 'package:lupus_app/core/shared_widgets/custom_app_bar.dart';
import 'package:lupus_app/core/theme/color_app.dart';
import 'package:lupus_app/core/theme/styles.dart';
import 'package:lupus_app/core/utils/widget_extensions.dart';
import 'package:lupus_app/features/community_support/presentation/views/widgets/community_card.dart';

class CommunitiesSupportView extends StatelessWidget {
  const CommunitiesSupportView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: AppText.communitySupport),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              decoration: InputDecoration(
                hintText: AppText.searchForAssociationOrActivity,
                suffixIcon: const Icon(Icons.search, color: AppColors.grayColor),
              ),
            ).paddingBottom(24),
            Text(
              AppText.recommendedAssociations,
              style: Styles.text14BlackW700(context),
            ).paddingBottom(12),
            Expanded(
              child: ListView.separated(
                // padding: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                itemCount: AppConstants.communities.length,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final Map<String, dynamic> community = AppConstants.communities[index];
                  return CommunityCard(community: community);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
