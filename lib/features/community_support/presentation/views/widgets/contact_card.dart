import 'package:flutter/material.dart';
import 'package:lupus_app/core/shared_widgets/custom_card.dart';
import 'package:lupus_app/core/theme/color_app.dart';
import 'package:lupus_app/core/theme/styles.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({super.key, required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      Row(
        children: [
          Icon(icon, color: AppColors.primaryColor, size: 20),
          const SizedBox(width: 12),
          Text(
            label,
            style: Styles.text10BlackW600(context).copyWith(fontSize: 13),
          ),
        ],
      ),
    );
  }
}
