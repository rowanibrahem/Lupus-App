import 'package:flutter/material.dart';
import 'package:lupus_app/core/services/routes.dart';
import 'package:lupus_app/core/shared_widgets/section_header.dart';
import 'package:lupus_app/core/theme/color_app.dart';

class WatchAndReflectSection extends StatelessWidget {
  const WatchAndReflectSection(this.watchAndReflect, {super.key});
  final Map<String, dynamic> watchAndReflect;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionHeader(
          title: 'شاهد وتدبّر',
          onViewAll: () => Navigator.pushNamed(
            context,
            Routes.watchAndReflect,
            arguments: watchAndReflect,
          ),
        ),
        SizedBox(
          height: 200,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(vertical: 12),
            itemCount: watchAndReflect['faithBasedVideos'].length,
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (_, __) => const SizedBox(width: 16),
            itemBuilder: (context, index) => _VideoCard(
              title: watchAndReflect['faithBasedVideos'][index]['title'],
              subtitle: watchAndReflect['faithBasedVideos'][index]['desc'],
              onTap: () {}, //!TODO: Audio_pop.up
            ),
          ),
        ),
      ],
    );
  }
}

// ── Video Card ────────────────────────────────────────────
class _VideoCard extends StatelessWidget {
  const _VideoCard({
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 200,
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // thumbnail
            Stack(
              children: [
                Container(
                  height: 100,
                  decoration: BoxDecoration(
                    color: const Color(0xFFB0C4DE),
                    borderRadius: BorderRadius.circular(14),
                    image: const DecorationImage(
                      image: AssetImage('assets/images/video_thumb.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // overlay
                Container(
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withValues(alpha: 0.5),
                      ],
                    ),
                  ),
                ),
                // play icon
                Positioned.fill(
                  child: Center(
                    child: Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.85),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.play_arrow_rounded, color: AppColors.primaryColor, size: 20),
                    ),
                  ),
                ),
                // quote icon
                const Positioned(
                  bottom: 8,
                  right: 8,
                  child: Icon(Icons.format_quote, color: Colors.white, size: 18),
                ),
              ],
            ),

            const SizedBox(height: 8),

            // title
            Text(
              title,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: AppColors.blackColor,
              ),
            ),
            const SizedBox(height: 3),
            Text(
              subtitle,
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w400,
                color: AppColors.grayColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
