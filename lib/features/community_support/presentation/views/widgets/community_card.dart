import 'package:flutter/material.dart';
import 'package:lupus_app/core/constants/app_text.dart';
import 'package:lupus_app/core/services/routes.dart';
import 'package:lupus_app/core/theme/styles.dart';
import 'package:lupus_app/core/utils/widget_extensions.dart';

class CommunityCard extends StatelessWidget {
  const CommunityCard({super.key, required this.community});
  final Map<String, dynamic> community;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: Styles.customCardBoxDecoration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            community['name'] ?? "", //!TODO:AppText
            style: Styles.text12BlackW700(context),
          ).paddingBottom(6),
          Text(
            community['description'] ?? "", //!TODO:AppText
            style: Styles.text12GrayW400(context),
          ).paddingBottom(8),
          Row(
            children: [
              const Icon(
                Icons.location_on,
                color: Colors.red,
                size: 14,
              ).paddingRight(4),
              Text(
                community['location'] ?? "", //!TODO:AppText
                style: Styles.text12GrayBlueW500(context),
              ),
            ],
          ).paddingBottom(12),
          SizedBox(
            width: double.infinity,
            height: 42,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  Routes.communityDetails,
                  arguments: community,
                );
              },
              child: Text(
                AppText.learnMore,
                style: Styles.text13WhiteW600(context),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
