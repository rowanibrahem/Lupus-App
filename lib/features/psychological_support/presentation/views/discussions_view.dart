import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lupus_app/core/constants/app_constants.dart';
import 'package:lupus_app/core/services/routes.dart';
import 'package:lupus_app/core/shared_widgets/custom_app_bar.dart';
import 'package:lupus_app/core/theme/color_app.dart';
import 'package:lupus_app/core/theme/styles.dart';
import 'package:lupus_app/features/psychological_support/presentation/views/widgets/new_post_config.dart';

// final List<Map<String, dynamic>> posts = AppConstants.psychologicalSupportPosts;
final List<Map<String, dynamic>> discussions = AppConstants.psychologicalSupportDiscussions;

class DiscussionsView extends StatelessWidget {
  const DiscussionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'نقاشات'),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: discussions.length,
        separatorBuilder: (_, __) => const SizedBox(height: 14),
        itemBuilder: (context, index) => DiscussionsDetailsCard(discussions[index]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, Routes.createContent, arguments: NewPostConfig.discussion()),
        shape: const CircleBorder(),
        child: Icon(Icons.add),
      ),
    );
  }
}

class DiscussionsDetailsCard extends StatelessWidget {
  final Map<String, dynamic> discussion;
  const DiscussionsDetailsCard(this.discussion, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 155,
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
                child: Image.asset(discussion["accountImage"]!),
              ),
              const SizedBox(width: 10),
              Text(
                discussion["accountName"]!,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  color: AppColors.blackColor,
                  fontSize: 10,
                ),
              ),
              Spacer(),
              Text(
                "منذ 3 ساعات",
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  color: AppColors.grayColor,
                  fontSize: 10,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            discussion["content"]!,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 10,
              height: 1.6,
              fontWeight: FontWeight.w500,
              color: AppColors.blackColor,
            ),
          ),
          Spacer(),
          GestureDetector(
            onTap: () {
              //! onTapLikesBottomSheet(context),
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                builder: (BuildContext context) {
                  return DraggableScrollableSheet(
                    expand: false,
                    initialChildSize: 0.5,
                    minChildSize: 0.3,
                    maxChildSize: 0.9,
                    builder: (context, scrollController) {
                      return Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            width: 40,
                            height: 4,
                            decoration: BoxDecoration(
                              color: AppColors.grayColor,
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              child: Text(
                                "التعليقات",
                                style: const TextStyle(
                                  fontSize: 16,
                                  height: 1.6,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.blackColor,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: ListView.separated(
                              controller: scrollController, // ← connect to DraggableScrollableSheet
                              padding: const EdgeInsets.all(16),
                              itemCount: discussion["comments"].length,
                              separatorBuilder: (_, __) => SizedBox(height: 20),
                              itemBuilder: (context, index) {
                                final comment = discussion["comments"][index];
                                return Row(
                                  crossAxisAlignment: CrossAxisAlignment.start, // ← align top
                                  children: [
                                    CircleAvatar(
                                      radius: 20,
                                      backgroundImage: AssetImage(comment["accountImage"]!),
                                    ),
                                    const SizedBox(width: 12),
                                    Text(
                                      comment["accountName"]!, // ← use comment, not post
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.blackColor,
                                        fontSize: 12,
                                      ),
                                    ),
                                    Spacer(),
                                    SvgPicture.asset(
                                      "assets/icons/favourite.svg",
                                      colorFilter: ColorFilter.mode(
                                        AppColors.primaryColor,
                                        BlendMode.srcIn,
                                      ),
                                    )
                                  ],
                                );
                              },
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
              );
            },
            child: Row(
              children: [
                Row(
                  children: [
                    SvgPicture.asset("assets/icons/favourite.svg"),
                    SizedBox(width: 4),
                    Text(
                      discussion["likes"]!.length!.toString(),
                      // "15",
                      style: const TextStyle(
                        fontSize: 10,
                        height: 1.6,
                        fontWeight: FontWeight.w500,
                        color: AppColors.blackColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 14),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                      ),
                      builder: (BuildContext context) {
                        return DraggableScrollableSheet(
                          expand: false,
                          initialChildSize: 0.5,
                          minChildSize: 0.3,
                          maxChildSize: 0.9,
                          builder: (context, scrollController) {
                            return Column(
                              children: [
                                Container(
                                  margin: const EdgeInsets.symmetric(vertical: 10),
                                  width: 40,
                                  height: 4,
                                  decoration: BoxDecoration(
                                    color: AppColors.grayColor,
                                    borderRadius: BorderRadius.circular(2),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 16),
                                    child: Text(
                                      "التعليقات",
                                      style: const TextStyle(
                                        fontSize: 16,
                                        height: 1.6,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.blackColor,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: ListView.separated(
                                    controller: scrollController, // ← connect to DraggableScrollableSheet
                                    padding: const EdgeInsets.all(16),
                                    itemCount: discussion["comments"].length,
                                    separatorBuilder: (_, __) => Padding(
                                      padding: const EdgeInsets.only(right: 48),
                                      child: const Divider(height: 24, color: AppColors.graySoft),
                                    ),
                                    itemBuilder: (context, index) {
                                      final comment = discussion["comments"][index];
                                      return Row(
                                        crossAxisAlignment: CrossAxisAlignment.start, // ← align top
                                        children: [
                                          CircleAvatar(
                                            radius: 20,
                                            backgroundImage: AssetImage(comment["accountImage"]!),
                                          ),
                                          const SizedBox(width: 12),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  comment["accountName"]!, // ← use comment, not post
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    color: AppColors.blackColor,
                                                    fontSize: 12,
                                                  ),
                                                ),
                                                const SizedBox(height: 4),
                                                Text(
                                                  comment["content"]!, // ← use comment, not post
                                                  maxLines: 3,
                                                  overflow: TextOverflow.ellipsis,
                                                  style: const TextStyle(
                                                    fontSize: 12,
                                                    height: 1.6,
                                                    fontWeight: FontWeight.w400,
                                                    color: AppColors.grayColor,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(width: 8),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                            children: [
                                              Text(
                                                comment["createTime"]!, // ← use comment, not post
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  color: AppColors.grayColor,
                                                  fontSize: 10,
                                                ),
                                              ),
                                              const SizedBox(height: 12),
                                              SvgPicture.asset("assets/icons/favourite.svg"),
                                            ],
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    );
                  },
                  child: Row(
                    children: [
                      SvgPicture.asset("assets/icons/comment.svg"),
                      SizedBox(width: 4),
                      Text(
                        discussion["comments"].length!.toString(),
                        // "20",
                        style: const TextStyle(
                          fontSize: 10,
                          height: 1.6,
                          fontWeight: FontWeight.w500,
                          color: AppColors.blackColor,
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                SvgPicture.asset("assets/icons/share.svg"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
