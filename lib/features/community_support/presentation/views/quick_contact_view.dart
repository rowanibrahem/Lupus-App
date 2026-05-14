import 'package:flutter/material.dart';
import 'package:lupus_app/core/shared_widgets/custom_app_bar.dart';
import 'package:lupus_app/core/theme/color_app.dart';

class QuickContactView extends StatelessWidget {
  const QuickContactView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'الأنشطة والحالات المحتاجة'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Info Card ──────────────────────────────
            _InfoCard(),

            const SizedBox(height: 20),

            // ── Quick Message ──────────────────────────
            _QuickMessageSection(),

            const SizedBox(height: 24),

            // ── Contact Methods ────────────────────────
            const Align(
              alignment: Alignment.centerRight,
              child: Text(
                'طرق التواصل',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: AppColors.blackColor,
                ),
              ),
            ),

            const SizedBox(height: 12),

            _ContactButton(
              label: 'رسالة واتساب',
              icon: Icons.phone_forwarded,
              // whatsapp,
              onTap: () {},
            ),

            const SizedBox(height: 12),

            _ContactButton(
              label: 'اتصال هاتفي',
              icon: Icons.phone_outlined,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

// ── Info Card ─────────────────────────────────────────────
class _InfoCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
          colors: [Color(0xFF5405BA), Color(0xFF9F69F7)],
        ),
        image: DecorationImage(
          fit: BoxFit.fitWidth,
          alignment: Alignment.center,
          image: AssetImage("assets/images/awareness_ribbon.png"),
          filterQuality: FilterQuality.low,
        ),
      ),
      child: Stack(
        children: [
          // content
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              _InfoRow(label: 'نوع الطلب:', value: 'حالة دواء مسجّلة'),
              SizedBox(height: 12),
              _InfoRow(label: 'الجهة:', value: 'عبر جمعية'),
              SizedBox(height: 12),
              _InfoRow(label: 'الحالة:', value: 'عاجلة 🚨'),
            ],
          ),
        ],
      ),
    );
  }
}

// ── Info Row ──────────────────────────────────────────────
class _InfoRow extends StatelessWidget {
  const _InfoRow({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        const SizedBox(width: 6),
        Text(
          value,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

// ── Quick Message Section ─────────────────────────────────
class _QuickMessageSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // title
          const Text(
            'رسالة سريعة',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: AppColors.blackColor,
            ),
          ),

          const SizedBox(height: 12),

          // message box
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
                topLeft: Radius.circular(12),
              ),
              border: Border.all(color: AppColors.primaryColor, width: 1.2),
            ),
            child: const Text(
              'مرحبًا، أنا حابب أساعد في توفير الدواء المطلوب.\nياريت توضحوا طريقة التسليم أو التنسيق.',
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: AppColors.grayColor,
                height: 1.7,
              ),
            ),
          ),

          const SizedBox(height: 12),

          // edit button
          SizedBox(
            height: 40,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'تعديل الرسالة',
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
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
