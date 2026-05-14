import 'package:flutter/material.dart';
import 'package:lupus_app/core/shared_widgets/arrow_left_leading.dart';
import 'package:lupus_app/core/shared_widgets/section_header.dart';
import 'package:lupus_app/core/theme/color_app.dart';
import 'package:lupus_app/features/religion/presentation/views/listen_and_relax_view.dart';
import 'package:lupus_app/features/religion/presentation/views/watch_and_reflect_view.dart';

class ReligionView extends StatelessWidget {
  const ReligionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _ReligionAppBar(),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Image.asset("assets/images/religion_card.png"),
                    // ----- Listen and rest assured -------------------------
                    Column(
                      children: [
                        const SizedBox(height: 24),
                        SectionHeader(
                          title: 'استمع واطمئن',
                          onViewAll: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const ListenAndRelaxView()),
                            );
                            // ListenAndRelaxView
                          },
                        ),
                        const SizedBox(height: 12),
                        _AudioCard(title: 'الصبر عند المرض', subtitle: 'كلمات إيمانية تواسي القلب', onTap: () {}),
                        const SizedBox(height: 10),
                        _AudioCard(title: 'الصبر عند المرض', subtitle: 'كلمات إيمانية تواسي القلب', onTap: () {}),
                        const SizedBox(height: 24),
                      ],
                    ),
                    // ── Watch Section ────────────────
                    SectionHeader(title: 'شاهد وتدبّر', onViewAll: () {
  Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const WatchAndReflectView()),
                            );
                      // WatchAndReflectView
                    }),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(child: _VideoCard(title: 'البلاء رفعة لا عقوبة', subtitle: 'مقطع قصير يبعث الطمأنينة', onTap: () {})),
                        const SizedBox(width: 12),
                        Expanded(child: _VideoCard(title: 'البلاء رفعة لا عقوبة', subtitle: 'مقطع قصير يبعث الطمأنينة', onTap: () {})),
                      ],
                    ),

                    const SizedBox(height: 24),

                    // ── Dhikr Section ────────────────
                    SectionHeader(title: 'ذكر وراحة', onViewAll: () {}),
                    const SizedBox(height: 12),
                    _DhikrCard(text: 'حسبي الله لا إله إلا هو'),
                    const SizedBox(height: 10),
                    _DhikrCard(text: 'سبحان الله وبحمده'),
                    const SizedBox(height: 10),
                    _DhikrCard(text: 'اللهم أنت الشافي'),

                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── AppBar ────────────────────────────────────────────────
class _ReligionAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ArrowLeftLeading(),
          const Text(
            'ديننا تقوي',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: AppColors.blackColor,
            ),
          ),
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
        ],
      ),
    );
  }
}

// ── Quran Card ────────────────────────────────────────────
class _QuranCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
          colors: [Color(0xFF5405BA), Color(0xFF9F69F7)],
        ),
        image: DecorationImage(
          image: const AssetImage("assets/images/awareness_ribbon.png"),
          alignment: Alignment.centerLeft,
          fit: BoxFit.contain,
          opacity: 0.1,
        ),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            '﴿وَبَشِّرِ الصَّابِرِينَ ۝ الَّذِينَ إِذَا أَصَابَتْهُم مُّصِيبَةٌ قَالُوا\nإِنَّا لِلَّهِ وَإِنَّا إِلَيْهِ رَاجِعُونَ﴾',
            textAlign: TextAlign.right,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Colors.white,
              height: 1.9,
              fontFamily: 'Amiri',
            ),
          ),
          SizedBox(height: 10),
          Text(
            'البقرة: 155-156',
            textAlign: TextAlign.right,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Colors.white70,
            ),
          ),
        ],
      ),
    );
  }
}

// ── Audio Card ────────────────────────────────────────────
class _AudioCard extends StatelessWidget {
  const _AudioCard({
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Row(
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

          const SizedBox(width: 12),
          // title + subtitle
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 13,
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
          const Spacer(),

          // waveform icon
          const Icon(Icons.graphic_eq, color: AppColors.grayColor, size: 28),
        ],
      ),
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

// ── Dhikr Card ────────────────────────────────────────────
class _DhikrCard extends StatefulWidget {
  const _DhikrCard({required this.text});

  final String text;

  @override
  State<_DhikrCard> createState() => _DhikrCardState();
}

class _DhikrCardState extends State<_DhikrCard> {
  final ValueNotifier<int> _count = ValueNotifier(0);
  static const int _target = 33;

  @override
  void dispose() {
    _count.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // dhikr text
          Text(
            widget.text,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: AppColors.blackColor,
            ),
          ),
          // counter
          ValueListenableBuilder<int>(
            valueListenable: _count,
            builder: (context, count, _) {
              return GestureDetector(
                onTap: () {
                  if (count < _target) _count.value++;
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF5EEFF),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: AppColors.primaryColor, width: 1),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.settings, color: AppColors.primaryColor, size: 14),
                      const SizedBox(width: 4),
                      Text(
                        '$count/$_target',
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
