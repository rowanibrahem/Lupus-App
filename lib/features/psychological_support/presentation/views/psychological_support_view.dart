import 'package:flutter/material.dart';
import 'package:lupus_app/core/constants/app_constants.dart';
import 'package:lupus_app/core/services/routes.dart';
import 'package:lupus_app/core/shared_widgets/custom_app_bar.dart';
import 'package:lupus_app/core/shared_widgets/hadith_image.dart';
import 'package:lupus_app/core/theme/color_app.dart';
import 'package:lupus_app/core/theme/styles.dart';
import 'package:lupus_app/features/psychological_support/presentation/views/widgets/discussions_section.dart';
import 'package:lupus_app/features/psychological_support/presentation/views/widgets/friends_section.dart';
import 'package:lupus_app/features/psychological_support/presentation/views/widgets/new_post_config.dart';
import 'package:lupus_app/features/psychological_support/presentation/views/widgets/posts_section.dart';
import 'package:lupus_app/features/psychological_support/presentation/views/widgets/selectable_tab_bar.dart';
import 'package:lupus_app/features/psychological_support/presentation/views/widgets/therapy_sessions_section.dart';
import 'package:lupus_app/features/psychological_support/presentation/views/widgets/therapy_sessions_types_section.dart';

class PsychologicalSupportView extends StatefulWidget {
  const PsychologicalSupportView({super.key});

  @override
  State<PsychologicalSupportView> createState() => _PsychologicalSupportViewState();
}

class _PsychologicalSupportViewState extends State<PsychologicalSupportView> {
  int selectedIndex = 0;
  final List<Map<String, dynamic>> stories = AppConstants.psychologicalSupportStories;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: AppConstants.psychologicalSupportTitle),
      floatingActionButton: (selectedIndex == 1)
          ? FloatingActionButton(
              onPressed: () => Navigator.pushNamed(context, Routes.createContent,
                  arguments: NewPostConfig.story(
                    onShared: () {},
                  )),
              shape: const CircleBorder(),
              child: Icon(Icons.add),
            )
          : (selectedIndex == 2)
              ? FloatingActionButton(
                  onPressed: () => Navigator.pushNamed(context, Routes.createContent,
                      arguments: NewPostConfig.story(
                        onShared: () {},
                      )),
                  shape: const CircleBorder(), 
                  child: Icon(Icons.person_add), //! ابدأ تجربتك التطوعية...   Forms
                )
              : null,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const HadithCard(),
              TabsSection(
                selectedIndex: selectedIndex,
                onTabSelected: (index) => setState(() => selectedIndex = index),
              ),
              if (selectedIndex == 0)
                Column(
                  children: [
                    TherapySessionsSection(),
                    FriendsSection(),
                    PostsSection(),
                    DiscussionsSection(),
                  ],
                ),
              if (selectedIndex == 1)
                ListView.separated(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  itemCount: stories.length,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  separatorBuilder: (_, __) => const SizedBox(height: 16),
                  itemBuilder: (context, index) => StoryDetailsCard(stories[index]),
                ),
              //  StoriesSection(),
              if (selectedIndex == 2) TherapySessionsTypesSection() // Text("جلسات"),
            ],
          ),
        ),
      ),
    );
  }
}

class StoryDetailsCard extends StatelessWidget {
  final Map<String, dynamic> story;
  const StoryDetailsCard(this.story, {super.key});

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
                child: Image.asset(story["accountImage"]!),
              ),
              const SizedBox(width: 10),
              Text(
                story["accountName"]!,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  color: AppColors.blackColor,
                  fontSize: 10,
                ),
              ),
              Spacer(),
              Text(
                story["createTime"],
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
            story["content"]!,
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
                              itemCount: story["comments"].length,
                              separatorBuilder: (_, __) => SizedBox(height: 20),
                              itemBuilder: (context, index) {
                                final comment = story["comments"][index];
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
                                    const Icon(Icons.favorite_rounded, color: AppColors.primaryColor),
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
                    Icon(Icons.favorite_border, size: 18),
                    SizedBox(width: 4),
                    Text(
                      story["likes"]!.length!.toString(),
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
                                    itemCount: story["comments"].length,
                                    separatorBuilder: (_, __) => Padding(
                                      padding: const EdgeInsets.only(right: 48),
                                      child: const Divider(height: 24, color: AppColors.graySoft),
                                    ),
                                    itemBuilder: (context, index) {
                                      final comment = story["comments"][index];
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
                                              const Icon(Icons.favorite_outline_rounded),
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
                      Icon(Icons.mode_comment_outlined, size: 18),
                      SizedBox(width: 4),
                      Text(
                        story["comments"].length!.toString(),
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
                Icon(Icons.share, size: 18),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
