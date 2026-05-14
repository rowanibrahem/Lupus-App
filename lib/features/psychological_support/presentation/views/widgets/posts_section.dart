import 'package:flutter/material.dart';
import 'package:lupus_app/core/constants/app_constants.dart';
import 'package:lupus_app/core/services/routes.dart';
import 'package:lupus_app/core/shared_widgets/section_header.dart';
import 'package:lupus_app/core/theme/color_app.dart';
import 'package:lupus_app/core/theme/styles.dart';

class PostsSection extends StatelessWidget {
  const PostsSection({super.key});
  final List<Map<String, dynamic>> posts = AppConstants.psychologicalSupportPosts;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 24),
        SectionHeader(
          title: AppConstants.postsTitle,
          onViewAll: () => Navigator.of(context).pushNamed(Routes.posts),
        ),
        SizedBox(
          height: 150,
          child: ListView.separated(
            padding: EdgeInsets.symmetric(vertical: 8),
            scrollDirection: Axis.horizontal,
            itemCount: 3, //posts.length,
            separatorBuilder: (_, __) => const SizedBox(width: 16),
            itemBuilder: (context, index) => PostCard(posts[index]),
          ),
        ),
      ],
    );
  }
}

class PostCard extends StatelessWidget {
  final Map<String, dynamic> post;
  const PostCard(this.post, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 140,
      width: 230,
      padding: const EdgeInsets.all(14),
      decoration: Styles.customCardBoxDecoration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 16,
                child: Image.asset(post["accountImage"]!),
              ),
              const SizedBox(width: 10),
              Text(
                post["accountName"]!,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  color: AppColors.blackColor,
                  fontSize: 10,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            post["content"]!,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 10,
              height: 1.6,
              fontWeight: FontWeight.w500,
              color: AppColors.blackColor,
            ),
          ),
        ],
      ),
    );
  }
}
