import 'package:flutter/material.dart';
import 'package:lupus_app/core/constants/app_constants.dart';
import 'package:lupus_app/core/shared_widgets/custom_card.dart';
import 'package:lupus_app/core/shared_widgets/section_header.dart';
import 'package:lupus_app/core/theme/color_app.dart';

class TherapySessionsSection extends StatelessWidget {
  const TherapySessionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 22),
        SectionHeader(
          title: AppConstants.sessionsTitle,
          onViewAll: () {},
        ),
        SupportCommunityCard(),
        SizedBox(height: 14),
        GroupSessionCard(),
      ],
    );
  }
}

class SupportCommunityCard extends StatelessWidget {
  const SupportCommunityCard({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      Column(
        spacing: 20,
        children: [
          Row(
            spacing: 16,
            children: [
              Image.asset(
                "assets/images/group_session.png",
                height: 86,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 12,
                  children: [
                    Text(
                      "مجتمع داعم",
                      style: TextStyle(
                        color: AppColors.blackColor,
                        fontSize: 12.0,
                        fontWeight: FontWeight.w700,
                        height: 1.0,
                        letterSpacing: 0.0,
                      ),
                    ),
                    Text(
                      "مكان أمن للتعبير والمشاركة و الدعم المتبادل",
                      style: TextStyle(
                        color: Color(0xffACACAC),
                        fontSize: 12.0,
                        fontWeight: FontWeight.w600,
                        height: 1.0,
                        letterSpacing: 0.18,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton(
              onPressed: () {},
              child: Text("انضم للجروب"),
            ),
          ),
        ],
      ),
    );
  }
}

class GroupSessionCard extends StatelessWidget {
  const GroupSessionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 12,
              children: [
                Text(
                  "جلسة علاجيه جماعية",
                  style: TextStyle(
                    color: AppColors.blackColor,
                    fontSize: 12.0,
                    fontWeight: FontWeight.w700,
                    height: 1.0,
                    letterSpacing: 0.15,
                  ),
                ),
                Text(
                  "الأربعاء, 20يوليو ",
                  style: TextStyle(
                    color: Color(0xffACACAC),
                    fontSize: 12.0,
                    fontWeight: FontWeight.w600,
                    height: 1.0,
                    letterSpacing: 0.18,
                  ),
                ),
              ],
            ),
          ),
          // const Spacer(),
          SizedBox(
            height: 38,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(42.0)),
              ),
              onPressed: () {},
              child: Text("أنضم الأن", style: TextStyle(fontSize: 12)),
            ),
          ),
        ],
      ),
    );
  }
}
