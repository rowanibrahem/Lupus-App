import 'package:flutter/material.dart';
import 'package:lupus_app/core/constants/app_constants.dart';
import 'package:lupus_app/core/shared_widgets/custom_app_bar.dart';
import 'package:lupus_app/core/theme/color_app.dart';
import 'package:lupus_app/core/utils/widget_extensions.dart';
import 'package:lupus_app/features/religion/presentation/views/widgets/dhikr_section.dart';
import 'package:lupus_app/features/religion/presentation/views/widgets/listen_and_rest_assured_section.dart';
import 'package:lupus_app/features/religion/presentation/views/widgets/quran_card.dart';
import 'package:lupus_app/features/religion/presentation/views/widgets/watch_and_reflect_section.dart';

class ReligionView extends StatelessWidget {
  const ReligionView({super.key});

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> listenAndRest = AppConstants.religion['listenAndRest'];
    Map<String, dynamic> watchAndReflect = AppConstants.religion['watchAndReflect'];
    List<Map<String, dynamic>> remembranceAndComfort = AppConstants.religion['remembranceAndComfort'];

    return Scaffold(
      appBar: CustomAppBar(
        title: 'ديننا تقوي', // !TODO:AppText
        actions: [
          Stack(
            children: [
              const Icon(Icons.notifications_outlined, color: AppColors.blackColor, size: 26),
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: AppColors.primaryColor,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 12),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // Image.asset("assets/images/religion_card.png").paddingBottom(20),
              QuranCard().paddingBottom(16),
              ListenAndRestAssuredSection(listenAndRest).paddingBottom(24),
              WatchAndReflectSection(watchAndReflect).paddingBottom(24),
              DhikrSection(remembranceAndComfort).paddingBottom(24),
            ],
          ),
        ),
      ),
    );
  }
}
