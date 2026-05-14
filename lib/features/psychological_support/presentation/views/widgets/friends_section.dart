import 'package:flutter/material.dart';
import 'package:lupus_app/core/constants/app_constants.dart';
import 'package:lupus_app/core/services/routes.dart';
import 'package:lupus_app/core/shared_widgets/section_header.dart';
import 'package:lupus_app/core/theme/color_app.dart';

class FriendsSection extends StatelessWidget {
  const FriendsSection({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> friendsNamed = AppConstants.friendsNames;
    return Column(
      children: [
        const SizedBox(height: 24),
        SectionHeader(
          title: AppConstants.friendsTitle,
          onViewAll: () => Navigator.of(context).pushNamed(Routes.friends),
        ),
        SizedBox(
          height: 92,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: friendsNamed.length,
            separatorBuilder: (_, __) => const SizedBox(width: 14),
            itemBuilder: (context, index) {
              return Column(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Color(0xff6C18D8),
                    // const Color(0xffEAD8FF),
                    child: CircleAvatar(
                      radius: 28,
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage(friendsNamed[index]["image"]!),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    friendsNamed[index]["name"]!,
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      color: AppColors.blackColor,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
