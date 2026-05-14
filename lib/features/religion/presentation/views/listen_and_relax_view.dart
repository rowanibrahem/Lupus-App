import 'package:flutter/material.dart';
import 'package:lupus_app/core/shared_widgets/custom_app_bar.dart';
import 'package:lupus_app/core/shared_widgets/section_header.dart';
import 'package:lupus_app/core/theme/color_app.dart';
import 'package:lupus_app/core/theme/styles.dart';

class ListenAndRelaxView extends StatelessWidget {
  const ListenAndRelaxView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'استمع واطمئن'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // ── Search ──────────────────────────────
            _SearchField(),

            const SizedBox(height: 24),

            // ── Most Listened ────────────────────────
            SectionHeader(title: 'الأكثر استماعاً', onViewAll: () {}),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: _AudioGridCard(
                    title: 'الصبر عند المرض',
                    subtitle: 'كلمات إيمانية تواسي القلب',
                    onTap: () {},
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _AudioGridCard(
                    title: 'الصبر عند المرض',
                    subtitle: 'كلمات إيمانية تواسي القلب',
                    onTap: () {},
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // ── Quran Recitations ────────────────────
            SectionHeader(title: 'تلاوات قرآنية', onViewAll: () {}),
            const SizedBox(height: 12),
            _QuranCard(title: 'سورة الشرح', onTap: () {}),
            const SizedBox(height: 10),
            _QuranCard(title: 'سورة الضحى', onTap: () {}),

            const SizedBox(height: 24),

            // ── Recorded Adhkar ──────────────────────
            SectionHeader(title: 'أذكار مسجلة', onViewAll: () {}),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: _AdhkarGridCard(title: 'أذكار الصباح', onTap: () {}),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _AdhkarGridCard(title: 'أذكار المساء', onTap: () {}),
                ),
              ],
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

// ── Audio Grid Card ───────────────────────────────────────
class _AudioGridCard extends StatelessWidget {
  const _AudioGridCard({
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
        padding: const EdgeInsets.all(14),
        decoration: Styles.customCardBoxDecoration,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // waveform icon top left
            Align(alignment: Alignment.centerLeft, child: const Icon(Icons.graphic_eq, color: AppColors.grayColor, size: 22)),

            const SizedBox(height: 12),

            // headphone icon center
            CircleAvatar(
              radius: 32,
              backgroundColor: AppColors.bgColor.withOpacity(.2),
              child: const Center(
                child: Icon(
                  Icons.headphones_rounded,
                  color: AppColors.primaryColor,
                  size: 42,
                ),
              ),
            ),

            const SizedBox(height: 12),

            // title
            Text(
              title,
              textAlign: TextAlign.right,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: AppColors.blackColor,
              ),
            ),

            const SizedBox(height: 4),

            // subtitle
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

// ── Quran Card ────────────────────────────────────────────
class _QuranCard extends StatelessWidget {
  const _QuranCard({required this.title, required this.onTap});

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      decoration: Styles.customCardBoxDecoration,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // play button
          Stack(
            alignment: Alignment.center,
            children: [
              GestureDetector(
                onTap: onTap,
                child: Container(
                  width: 38,
                  height: 38,
                  decoration: const BoxDecoration(
                    color: AppColors.primaryColor,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Center(
                child: Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      border: Border.all(color: Colors.white),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.play_arrow_rounded, color: Colors.white, size: 20)),
              ),
            ],
          ),

          // title + waveform
          const SizedBox(width: 10),

          Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.blackColor,
            ),
          ),
          const SizedBox(width: 10),
          Spacer(),
          const Icon(Icons.graphic_eq, color: AppColors.grayColor, size: 22),
        ],
      ),
    );
  }
}

// ── Adhkar Grid Card ──────────────────────────────────────
class _AdhkarGridCard extends StatelessWidget {
  const _AdhkarGridCard({required this.title, required this.onTap});

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: Styles.customCardBoxDecoration,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // waveform icon
            Align(
              alignment: Alignment.centerLeft,
              child: const Icon(Icons.graphic_eq, color: AppColors.grayColor, size: 22),
            ),

            const SizedBox(height: 16),

            // headphone icon
            Center(
              child: CircleAvatar(
                radius: 32,
                backgroundColor: AppColors.bgColor.withOpacity(.2),
                child: Icon(
                  Icons.headphones_rounded,
                  color: AppColors.primaryColor,
                  size: 42,
                ),
              ),
            ),

            const SizedBox(height: 16),

            // title
            Center(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: AppColors.blackColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
