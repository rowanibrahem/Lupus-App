import 'package:flutter/material.dart';
import 'package:lupus_app/core/theme/color_app.dart';




class VolunteerPage extends StatelessWidget {
  const VolunteerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  const Icon(Icons.arrow_forward),
                  const Spacer(),
                  const Text(
                    "ابدأ تجربتك التطوعية",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              const Center(
                child: Text(
                  "اهلاً بيك ضمن المتطوعين! 👋",
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 28),

              const SectionTitle("اختيار نوع المساهمة"),

              volunteerTile(
                title: "معالج داعم",
                subtitle:
                    "تقدر تقدم جلسات أو تفاعلات دعم نفسي (غير تشخيصية).",
              ),

              const SizedBox(height: 16),

              volunteerTile(
                title: "صانع جلسات صوتية",
                subtitle:
                    "شارك تسجيلاتك الصوتية أو محاضراتك لتفيد الآخرين.",
              ),

              const SizedBox(height: 24),

              const SectionTitle("نبذة عنك"),

              const AppTextField(
                hint: "اكتب نبذة بسيطة تعرف بيك الناس",
                maxLines: 4,
              ),

              const SizedBox(height: 24),

              const SectionTitle("رقم الهاتف"),

              const AppTextField(
                hint: "أدخل رقم الهاتف",
                icon: Icons.phone_android,
              ),

              const SizedBox(height: 20),

              const SectionTitle("البريد الألكتروني"),

              const AppTextField(
                hint: "أدخل البريد الألكتروني",
                icon: Icons.email,
              ),

              const Spacer(),

              const PrimaryButton("تأكيد"),
            ],
          ),
        ),
      ),
    );
  }

  static Widget volunteerTile({
    required String title,
    required String subtitle,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(
          Icons.check_circle_outline,
          size: 28,
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 17,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                textAlign: TextAlign.right,
                style: const TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}


/// =======================================================
/// COMMON WIDGETS
/// =======================================================

class AppTextField extends StatelessWidget {
  final String hint;
  final IconData? icon;
  final int maxLines;

  const AppTextField({
    super.key,
    required this.hint,
    this.icon,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: maxLines == 1 ? 52 : null,
      decoration: BoxDecoration(
        color: const Color(0xFFEAEAEA),
        borderRadius: BorderRadius.circular(14),
      ),
      child: TextField(
        maxLines: maxLines,
        textAlign: TextAlign.right,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.w600,
          ),
          prefixIcon: icon != null
              ? Icon(
                  icon,
                  color: Colors.black,
                )
              : null,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 18,
            vertical: 16,
          ),
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Align(
        alignment: Alignment.centerRight,
        child: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}

class DateTimeBox extends StatelessWidget {
  final String text;
  final IconData icon;

  const DateTimeBox({
    super.key,
    required this.text,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 145,
      height: 52,
      decoration: BoxDecoration(
        color: const Color(0xFFEAEAEA),
        borderRadius: BorderRadius.circular(14),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Row(
        children: [
          Icon(icon),
          const Spacer(),
          Text(
            text,
            style: const TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

class PrimaryButton extends StatelessWidget {
  final String text;

  const PrimaryButton(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      width: double.infinity,
      decoration: BoxDecoration(
        color:AppColors. primaryColor,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryColor.withOpacity(.3),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

