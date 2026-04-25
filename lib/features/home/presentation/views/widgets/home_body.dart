import 'package:flutter/material.dart';
import 'package:lupus_app/core/constants/app_text.dart';
import 'package:lupus_app/features/home/presentation/views/widgets/header_part.dart';
import 'package:lupus_app/features/home/presentation/views/widgets/learn_section.dart';
import 'package:lupus_app/features/home/presentation/views/widgets/medication_section.dart';
import 'package:lupus_app/features/home/presentation/views/widgets/message_section.dart';
import 'package:lupus_app/features/home/presentation/views/widgets/service_section.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderPart(),
            SizedBox(height: 20),
            Image.asset(
              'assets/images/home.png',
              fit: BoxFit.cover,
              width: double.infinity,
            ),
            SizedBox(height: 20),
            ServicesSection(),
            SizedBox(height: 20),
            LearnSection(),
            SizedBox(height: 20),
            MessageSection(),
            SizedBox(height: 20),
            MedicationsSection(),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
