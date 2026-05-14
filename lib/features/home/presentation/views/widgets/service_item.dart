import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ServiceItem extends StatelessWidget {
  final String icon;
  final String title;
  final void Function()? onTap;
  const ServiceItem({
    super.key,
    required this.icon,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: const Color(0xFFF3F0FA),
              borderRadius: BorderRadius.circular(16),
            ),
            child: SvgPicture.asset(
              icon,
              colorFilter: const ColorFilter.mode(Colors.purple, BlendMode.srcIn),
              fit: BoxFit.scaleDown,
              height: 32,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            title,
            style: const TextStyle(fontSize: 11),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
