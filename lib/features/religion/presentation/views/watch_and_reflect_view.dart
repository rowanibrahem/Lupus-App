import 'package:flutter/material.dart';
import 'package:lupus_app/core/shared_widgets/custom_app_bar.dart';
import 'package:lupus_app/core/shared_widgets/custom_card.dart';
import 'package:lupus_app/core/shared_widgets/section_header.dart';
import 'package:lupus_app/core/theme/color_app.dart';

class WatchAndReflectView extends StatelessWidget {
  const WatchAndReflectView(this.watchAndReflect, {super.key});
  final Map<String, dynamic> watchAndReflect;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'شاهد وتدبّر'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _SearchField(),
            const SizedBox(height: 20),
            // ── Featured Video ───────────────────────
            _FeaturedVideoCard(
              title: 'الصبر عند المرض',
              subtitle: 'كلمات إيمانية تواسي القلب',
              image: 'assets/images/video_thumb.png',
              onTap: () {},
            ),

            const SizedBox(height: 24),

            // ── Faith Videos ─────────────────────────
            SectionHeader(title: 'فيديوهات إيمانية', onViewAll: () {}),
            SizedBox(
              height: 200,
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(vertical: 12),
                scrollDirection: Axis.horizontal,
                reverse: true,
                itemCount: 3, // watchAndReflect['faithBasedVideos'].length,
                separatorBuilder: (_, __) => const SizedBox(width: 12),
                itemBuilder: (context, index) => _VideoCard(
                  title: watchAndReflect['faithBasedVideos'][index]['title'],
                  subtitle: watchAndReflect['faithBasedVideos'][index]['desc'],
                  image: 'assets/images/video_thumb2.png',
                  onTap: () {},
                ),
              ),
            ),

            const SizedBox(height: 24),

            // ── Clips ────────────────────────────────
            SectionHeader(title: 'نفحات', onViewAll: () {}),

            SizedBox(
              height: 200,
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(vertical: 12),
                scrollDirection: Axis.horizontal,
                reverse: true,
                itemCount: 3, // watchAndReflect['inspirations'].length,
                separatorBuilder: (_, __) => const SizedBox(width: 12),
                itemBuilder: (context, index) => _InspirationsCard(
                  title: watchAndReflect['inspirations'][index]['title'],
                  subtitle: watchAndReflect['inspirations'][index]['desc'],
                  image: 'assets/images/video_thumb2.png',
                  onTap: () {},
                ),
              ),
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

// ── Search Field ──────────────────────────────────────────
class _SearchField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: TextAlign.right,
      decoration: InputDecoration(
        hintText: 'ابحث عن أعراض، نصائح، أو معلومات',
        hintStyle: const TextStyle(fontSize: 12, color: AppColors.grayColor),
        suffixIcon: const Icon(Icons.search, color: AppColors.grayColor),
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: Colors.grey.shade200),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: Colors.grey.shade200),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: AppColors.primaryColor),
        ),
      ),
    );
  }
}

// ── Featured Video Card ───────────────────────────────────
class _FeaturedVideoCard extends StatelessWidget {
  const _FeaturedVideoCard({
    required this.title,
    required this.subtitle,
    required this.image,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final String image;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          // thumbnail
          ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: Image.asset(
              image,
              width: double.infinity,
              height: 190,
              fit: BoxFit.cover,
            ),
          ),

          // gradient overlay
          Container(
            height: 190,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black.withValues(alpha: 0.7),
                ],
              ),
            ),
          ),

          // youtube play icon
          Positioned(
            bottom: 14,
            left: 14,
            child: Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(
                Icons.play_arrow_rounded,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),

          // title + subtitle
          Positioned(
            bottom: 14,
            right: 14,
            left: 60,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ── Video Card (horizontal list) ──────────────────────────
class _VideoCard extends StatelessWidget {
  const _VideoCard({
    required this.title,
    required this.subtitle,
    required this.image,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final String image;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CustomCard(
        width: 150,
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // thumbnail
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: Image.asset(
                    image,
                    width: 150,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                // gradient overlay
                Container(
                  width: 150,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withValues(alpha: 0.45),
                      ],
                    ),
                  ),
                ),
                // play icon
                Positioned(
                  top: 8,
                  left: 8,
                  child: Container(
                    width: 26,
                    height: 26,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.play_arrow_rounded, color: Colors.white, size: 16),
                  ),
                ),
                // label bottom
                Positioned(
                  bottom: 6,
                  right: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.5),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Text(
                      'عنوان المقطع',
                      style: TextStyle(fontSize: 9, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 6),

            Text(
              title,
              textAlign: TextAlign.right,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: AppColors.blackColor,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              subtitle,
              textAlign: TextAlign.right,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 10,
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

// ── Clip Card (vertical short) ────────────────────────────
class _InspirationsCard extends StatelessWidget {
  const _InspirationsCard({
    required this.title,
    required this.subtitle,
    required this.image,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final String image;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      width: 150,
      GestureDetector(
        onTap: onTap,
        child: Stack(
          children: [
            // thumbnail
            ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Image.asset(
                image,
                width: double.infinity,
                height: 160,
                fit: BoxFit.cover,
              ),
            ),

            // gradient overlay
            Container(
              height: 160,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withValues(alpha: 0.75),
                  ],
                ),
              ),
            ),

            // title
            Positioned(
              top: 12,
              right: 8,
              left: 8,
              child: Text(
                title,
                textAlign: TextAlign.right,
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  height: 1.4,
                ),
              ),
            ),

            // subtitle bottom
            Positioned(
              bottom: 10,
              right: 8,
              left: 8,
              child: Text(
                subtitle,
                textAlign: TextAlign.right,
                style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  color: Colors.white70,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
