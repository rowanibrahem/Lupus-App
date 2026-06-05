import 'package:flutter/material.dart';
import 'package:lupus_app/core/shared_widgets/custom_card.dart';
import 'package:lupus_app/core/theme/color_app.dart';
import 'package:lupus_app/core/theme/styles.dart';

class ServiceCard extends StatelessWidget {
  const ServiceCard({super.key, required this.label, required this.icon});

  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: AppColors.primaryColor, size: 22),
          const SizedBox(width: 10),
          Text(
            label,
            style: Styles.text10BlackW600(context).copyWith(fontSize: 13),
          ),
        ],
      ),
    );
  }
}
