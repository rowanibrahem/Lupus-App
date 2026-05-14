import 'package:flutter/material.dart';

class HadithCard extends StatelessWidget {
  const HadithCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Image.asset(
        'assets/images/home.png',
        fit: BoxFit.cover,
        width: double.infinity,
      ),
    );
  }
}
