import 'package:flutter/material.dart';
import 'package:lupus_app/core/constants/app_constants.dart';
import 'package:lupus_app/core/services/routes.dart';
import 'package:lupus_app/core/shared_widgets/section_header.dart';
import 'package:lupus_app/core/theme/styles.dart';

class DiscussionsSection extends StatelessWidget {
  const DiscussionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> discussions = AppConstants.psychologicalSupportDiscussions;

    return Column(
      children: [
        const SizedBox(height: 24),
        SectionHeader(
          title: AppConstants.discussionsTitle,
          onViewAll: () => Navigator.of(context).pushNamed(Routes.discussions),
        ),
        SizedBox(
          height: 170,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(vertical: 8),
            itemCount: 3, //discussions.length,
            separatorBuilder: (_, __) => const SizedBox(width: 14),
            itemBuilder: (context, index) => DiscussionCard(discussions[index]),
          ),
        ),
      ],
    );
  }
}

class DiscussionCard extends StatelessWidget {
  final Map<String, dynamic> discussion;
  const DiscussionCard(this.discussion, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 100,
      width: 230, //!Todo: media
      padding: const EdgeInsets.all(14),
      decoration: Styles.customCardBoxDecoration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            spacing: 10,
            children: [
              CircleAvatar(
                radius: 16,
                child: Image.asset(discussion["accountImage"]!),
              ),
              Text(
                discussion["accountName"]!,
                style: Styles.text10BlackW600(context),
              ),
            ],
          ),
          SizedBox(height: 10),
          Text(
            discussion["content"]!,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: Styles.text10GrayW500(context),
          ),
          Spacer(),
          Row(
            children: [
              Icon(Icons.favorite_border, size: 18),
              SizedBox(width: 4),
              Text(
                discussion["likes"]!.length!.toString(),
                style: Styles.text10BlackW500(context),
              ),
              SizedBox(width: 14),
              Icon(Icons.mode_comment_outlined, size: 18),
              SizedBox(width: 4),
              Text(
                discussion["comments"]!.length!.toString(),
                style: Styles.text10BlackW500(context),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
