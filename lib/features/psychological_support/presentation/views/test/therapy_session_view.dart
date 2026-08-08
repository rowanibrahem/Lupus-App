import 'package:flutter/material.dart';
import 'package:lupus_app/features/psychological_support/presentation/views/test/volunteer_view.dart';

class TherapySessionPage extends StatelessWidget {
  const TherapySessionPage({super.key});

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
                  const Text("أضف جلسة علاجية", style: TextStyle(fontSize: 28, fontWeight: FontWeight.w900)),
                ],
              ),
              const SizedBox(height: 28),
              const SectionTitle(
                "نوع الجلسة",
              ),
              const AppTextField(hint: "أدخل أسم نوع الجلسة"),
              const SizedBox(height: 20),
              const SectionTitle("اسم المعالج"),
              const AppTextField(
                hint: "أدخل أسم المعالج",
              ),
              const SizedBox(height: 20),
              const SectionTitle("وصف الجلسة"),
              const AppTextField(hint: "", maxLines: 4),
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
              const SizedBox(height: 24),
              const SectionTitle("مدة الجلسة"),
              const Align(
                alignment: Alignment.centerLeft,
                child: DateTimeBox(
                  text: "00:00",
                  icon: Icons.alarm,
                ),
              ),
              const Spacer(),
              const PrimaryButton("أضف الجلسة"),
            ],
          ),
        ),
      ),
    );
  }
}
