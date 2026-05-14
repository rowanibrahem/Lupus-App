import 'package:flutter/material.dart';
import 'package:lupus_app/core/shared_widgets/section_header.dart';
import 'package:lupus_app/core/theme/color_app.dart';
import 'package:lupus_app/core/theme/styles.dart';

class TherapySessionsTypesSection extends StatelessWidget {
  const TherapySessionsTypesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionHeader(title: 'جلسات مع اخصائي', onViewAll: () {}),

        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(child: _DoctorCard(name: 'د. سارة عبد الرحمن', specialty: 'علاج سلوكي معرفي', image: 'assets/images/chat1.png', onTap: () {})),
            const SizedBox(width: 12),
            Expanded(child: _DoctorCard(name: 'د. عائشه محمد', specialty: 'التعامل مع الضغوط النفسية', image: 'assets/images/chat2.png', onTap: () {})),
          ],
        ),

        const SizedBox(height: 24),

        _SectionHeader(title: 'جلسات جماعية', onViewAll: () {}),
        const SizedBox(height: 12),
        _GroupSessionCard(onJoin: () {}),

        const SizedBox(height: 24),

        // ── جلسات صوتية مسجلة ────────────────────────────
        _SectionHeader(title: 'جلسات صوتية مسجلة', onViewAll: () {}),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(child: _AudioSessionCard(title: 'التعامل مع الخوف من الانتكاسة', onTap: () {})),
            const SizedBox(width: 12),
            Expanded(child: _AudioSessionCard(title: 'كيف تتقبل جسدك رغم التغيرات', onTap: () {})),
          ],
        ),

        const SizedBox(height: 24),
      ],
    );
  }
}

// ── Section Header ────────────────────────────────────────
class _SectionHeader extends StatelessWidget {
  const _SectionHeader({required this.title, required this.onViewAll});

  final String title;
  final VoidCallback onViewAll;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: AppColors.blackColor,
          ),
        ),
        GestureDetector(
          onTap: onViewAll,
          child: const Text(
            'عرض الكل',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: AppColors.primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}

// ── Doctor Card ───────────────────────────────────────────
class _DoctorCard extends StatelessWidget {
  const _DoctorCard({
    required this.name,
    required this.specialty,
    required this.image,
    required this.onTap,
  });

  final String name;
  final String specialty;
  final String image;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: Styles.customCardBoxDecoration,
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: const Color(0xFFF0E6FF),
            backgroundImage: AssetImage(image),
          ),
          const SizedBox(height: 8),
          Text(
            name,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w700,
              color: AppColors.blackColor,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            specialty,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w400,
              color: AppColors.grayColor,
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            height: 32,
            child: ElevatedButton(
              onPressed: onTap,
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'احجز موعدًا',
                style: TextStyle(fontSize: 11),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Group Session Card ────────────────────────────────────
class _GroupSessionCard extends StatelessWidget {
  const _GroupSessionCard({required this.onJoin});

  final VoidCallback onJoin;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: Styles.customCardBoxDecoration,
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'مجتمع الذئبة',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: AppColors.blackColor,
                  ),
                ),
                const SizedBox(height: 6),
                const Text(
                  'شارك تجربتك واستمع لآخرين يمرّون بما تمرّ به',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                    color: AppColors.grayColor,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'الموعد: كل خميس - 7 مساءً',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    color: AppColors.grayColor,
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  height: 36,
                  child: ElevatedButton(
                    onPressed: onJoin,
                    child: const Text(
                      'انضم للجروب',
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              'assets/images/group_session.png',
              width: 90,
              height: 90,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}

// ── Audio Session Card ────────────────────────────────────
class _AudioSessionCard extends StatelessWidget {
  const _AudioSessionCard({required this.title, required this.onTap});

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: Styles.customCardBoxDecoration,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: AppColors.blackColor,
                height: 1.5,
              ),
            ),
          ),
          const SizedBox(width: 8),
          GestureDetector(
            onTap: onTap,
            child: Container(
              width: 32,
              height: 32,
              decoration: const BoxDecoration(
                color: AppColors.primaryColor,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.play_arrow_rounded,
                color: Colors.white,
                size: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
