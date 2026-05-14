import 'package:flutter/material.dart';
import 'package:lupus_app/core/theme/color_app.dart';
import 'package:lupus_app/core/theme/styles.dart';
import 'package:lupus_app/features/community_support/presentation/views/activities_view.dart';

class CharityDetailsView extends StatelessWidget {
  const CharityDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // ── Purple Header ──────────────────────────────────
          _CharityHeader(),

          // ── Body ──────────────────────────────────────────
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Services
                  const Text(
                    'الخدمات المتاحة',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: AppColors.blackColor,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(child: _ServiceCard(label: 'الدعم المادي', icon: Icons.volunteer_activism_outlined)),
                      const SizedBox(width: 12),
                      Expanded(child: _ServiceCard(label: 'أدوية', icon: Icons.medication_outlined)),
                    ],
                  ),

                  const SizedBox(height: 24),

                  // Contact
                  const Text(
                    'طرق التواصل',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: AppColors.blackColor,
                    ),
                  ),
                  const SizedBox(height: 12),
                  _ContactCard(icon: Icons.language, label: 'WWW.Slu.Orndvx.Com'),
                  const SizedBox(height: 16),
                  _ContactCard(icon: Icons.phone_outlined, label: '01027778899'),
                ],
              ),
            ),
          ),

          // ── Bottom Button ──────────────────────────────────
          _BottomButton(onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ActivitiesView()),
            );
          }),
        ],
      ),
    );
  }
}

// ── Purple Header ─────────────────────────────────────────
class _CharityHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 52, bottom: 28, left: 16, right: 16),
      decoration: const BoxDecoration(
        // color: AppColors.primaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
        gradient: LinearGradient(
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
          colors: [Color(0xFF5405BA), Color(0xFF9F69F7)],
        ),
        image: DecorationImage(
          image: AssetImage("assets/images/awareness_ribbon.png"),
          alignment: Alignment.centerLeft,
          filterQuality: FilterQuality.low,
        ),
      ),
      child: Stack(
        children: [
          // back arrow
          Positioned(
            right: 0,
            top: 0,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.2),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.arrow_back, color: Colors.white, size: 18),
              ),
            ),
          ),

          // content
          Column(
            children: [
              const SizedBox(height: 64),
              // avatar
              Container(
                width: 72,
                height: 72,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: ClipOval(
                  child: Image.asset('assets/images/chat1.png', fit: BoxFit.cover),
                ),
              ),
              const SizedBox(height: 14),
              const Text(
                'جمعية دعم أمراض المناعة الذاتية',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'نسعى لدعم المرضى وتوفير احتياجاتهم من العلاج ودعم مادي',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Colors.white70,
                  height: 1.6,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ── Service Card ──────────────────────────────────────────
class _ServiceCard extends StatelessWidget {
  const _ServiceCard({required this.label, required this.icon});

  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
      decoration: Styles.customCardBoxDecoration,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: AppColors.blackColor,
            ),
          ),
          const SizedBox(width: 10),
          Icon(icon, color: AppColors.primaryColor, size: 22),
        ],
      ),
    );
  }
}

// ── Contact Card ──────────────────────────────────────────
class _ContactCard extends StatelessWidget {
  const _ContactCard({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
      decoration: Styles.customCardBoxDecoration,
      child: Row(
        children: [
          Icon(icon, color: AppColors.primaryColor, size: 20),
          const SizedBox(width: 12),
          Text(
            label,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: AppColors.blackColor,
            ),
          ),
        ],
      ),
    );
  }
}

// ── Bottom Button ─────────────────────────────────────────
class _BottomButton extends StatelessWidget {
  const _BottomButton({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 28),
      child: SizedBox(
        width: double.infinity,
        height: 52,
        child: ElevatedButton.icon(
          onPressed: onTap,
          icon: const Icon(Icons.arrow_forward, size: 18),
          label: const Text(
            'الانتقال للأنشطة والحالات المحتاجة',
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
          ),
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
      ),
    );
  }
}
