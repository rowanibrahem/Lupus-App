import 'package:flutter/material.dart';
import 'package:lupus_app/core/theme/color_app.dart';
import 'package:lupus_app/features/psychological_support/presentation/views/test/volunteer_view.dart';

class VoiceSessionPage extends StatelessWidget {
  const VoiceSessionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              /// Header
              Row(
                children: [
                  const Icon(Icons.arrow_forward),
                  const Spacer(),
                  const Text(
                    "أضف جلسة صوتية جديدة",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 28),

              const SectionTitle("عنوان الجلسة"),
              const AppTextField(hint: "أدخل عنوان الجلسة", icon: Icons.edit),

              const SizedBox(height: 20),

              const SectionTitle("وصف مختصر"),
              const AppTextField(hint: "احكي بإيجاز عن الجلسة وفكرتها", maxLines: 4),

              const SizedBox(height: 20),

              const SectionTitle("نوع الجلسة"),
              const AppTextField(hint: "أدخل نوع الجلسة (اختياري)", icon: Icons.edit),

              const SizedBox(height: 24),

              const SectionTitle("التاريخ والوقت"),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  DateTimeBox(
                    text: "9:00 م",
                    icon: Icons.access_time_outlined,
                  ),
                  DateTimeBox(
                    text: "****/**/**",
                    icon: Icons.calendar_month,
                  ),
                ],
              ),

              const SizedBox(height: 22),

              const SectionTitle("مدة الجلسة"),

              const Align(
                alignment: Alignment.centerLeft,
                child: DateTimeBox(text: "00:00", icon: Icons.alarm),
              ),

              const Spacer(),

              Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  width: 58,
                  height: 58,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primaryColor,
                  ),
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
