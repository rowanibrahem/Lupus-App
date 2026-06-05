import 'package:flutter/material.dart';
import 'package:lupus_app/core/constants/app_text.dart';
import 'package:lupus_app/core/services/routes.dart';
import 'package:lupus_app/core/theme/styles.dart';
import 'package:lupus_app/core/utils/widget_extensions.dart';
import 'package:lupus_app/features/community_support/presentation/views/widgets/community_details_header.dart';
import 'package:lupus_app/features/community_support/presentation/views/widgets/contact_card.dart';
import 'package:lupus_app/features/community_support/presentation/views/widgets/service_card.dart';

class CommunityDetailsView extends StatelessWidget {
  const CommunityDetailsView(this.community, {super.key});
  final Map<String, dynamic> community;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CommunityDetailsHeader(community),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppText.availableServices,
                    style: Styles.text14BlackW700(context),
                  ).paddingBottom(12),
                  _buildAvailableServices().paddingBottom(24),
                  Text(
                    AppText.contactMethods,
                    style: Styles.text14BlackW700(context),
                  ).paddingBottom(12),
                  _buildContactMethods(),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.pushNamed(
                  context,
                  Routes.activities,
                   arguments: community,
                ), // arguments:
                child: Text(AppText.navigateToActivitiesAndCases, style: Styles.text13WhiteW600(context)),
              ).paddingBottom(48),
            ),
          ),
        ],
      ),
    );
  }

  ListView _buildContactMethods() {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: community['contactMethods'].length,
      separatorBuilder: (_, __) => const SizedBox(height: 16),
      itemBuilder: (context, index) {
        final contact = community['contactMethods'][index];

        return ContactCard(
          icon: contact['icon'] as IconData,
          label: contact['label'] as String,
        );
      },
    );
  }

  GridView _buildAvailableServices() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: community['availableServices'].length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 2.8,
      ),
      itemBuilder: (context, index) {
        final service = community['availableServices'][index];
        return ServiceCard(
          label: service['label'] as String,
          icon: service['icon'] as IconData,
        );
      },
    );
  }
}
