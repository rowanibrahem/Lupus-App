import 'package:flutter/material.dart';
import 'package:lupus_app/core/shared_widgets/custom_app_bar.dart';
import 'package:lupus_app/core/theme/color_app.dart';

class ContributionDetailsView extends StatelessWidget {
  const ContributionDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'مساهمات'),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // ── Illustration ──────────────────────
                  _IllustrationSection(),

                  // ── Details ───────────────────────────
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        // title
                        const Text(
                          'متبرع فردي يعرض دواء خاص بمرض الذئبة',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: AppColors.blackColor,
                          ),
                        ),

                        const SizedBox(height: 8),

                        // description
                        const Text(
                          'متوفر دواء سليسليت 500',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: AppColors.grayColor,
                          ),
                        ),

                        const SizedBox(height: 20),

                        // contact title
                        Align(
                          alignment: Alignment.centerRight,
                          child: const Text(
                            'طرق التواصل:',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: AppColors.blackColor,
                            ),
                          ),
                        ),

                        const SizedBox(height: 12),

                        // whatsapp button
                        _ContactButton(
                          label: 'رسالة واتساب',
                          icon: Icons.phone_callback,
                          // whatsapp,
                          onTap: () {},
                        ),

                        const SizedBox(height: 12),

                        // call button
                        _ContactButton(
                          label: 'اتصال هاتفي',
                          icon: Icons.phone_outlined,
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Illustration Section ──────────────────────────────────
class _IllustrationSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(16),
      height: 200,
      decoration: BoxDecoration(
        color: const Color(0xFFF5EEFF),
        borderRadius: BorderRadius.circular(20),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.asset(
          'assets/images/blood_illustration.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

// ── Contact Button ────────────────────────────────────────
class _ContactButton extends StatelessWidget {
  const _ContactButton({
    required this.label,
    required this.icon,
    required this.onTap,
  });

  final String label;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFF5EEFF),
          foregroundColor: AppColors.primaryColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 20),
            const SizedBox(width: 10),
            Text(
              label,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
