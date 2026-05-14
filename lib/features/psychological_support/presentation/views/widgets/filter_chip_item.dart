import 'package:flutter/material.dart';

class FilterChipItem extends StatelessWidget {
  final String label;
  final VoidCallback? onTap;

  const FilterChipItem({
    super.key,
    required this.label,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 8),
        decoration: BoxDecoration(
          color: const Color(0xFF6518C8),
          borderRadius: BorderRadius.circular(41.0),
          boxShadow: const [
            BoxShadow(
              color: Color(0x29000000),
              offset: Offset(0, 1),
              blurRadius: 5.0,
            ),
          ],
        ),
        child: Text(
          label,
          textAlign: TextAlign.right,
          textDirection: TextDirection.rtl,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12.0,
            fontWeight: FontWeight.w700,
            height: 1.0,
          ),
        ),
      ),
    );
  }
}
