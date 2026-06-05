import 'package:flutter/material.dart';
import 'package:lupus_app/core/shared_widgets/section_header.dart';
import 'package:lupus_app/core/theme/color_app.dart';

class DhikrSection extends StatelessWidget {
  const DhikrSection(this.remembranceAndComfort, {super.key});
  final List<Map<String, dynamic>> remembranceAndComfort;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionHeader(title: 'ذكر وراحة', onViewAll: () {}),
        SizedBox(
          height: 200,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(vertical: 12),
            itemCount: 3, //remembranceAndComfort.length,
            scrollDirection: Axis.vertical,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (_, __) => const SizedBox(height: 16),
            itemBuilder: (context, index) => _DhikrCard(text: remembranceAndComfort[index]['title']),
          ),
        ),
      ],
    );
  }
}

// ── Dhikr Card ────────────────────────────────────────────
class _DhikrCard extends StatefulWidget {
  const _DhikrCard({required this.text});
  final String text;

  @override
  State<_DhikrCard> createState() => _DhikrCardState();
}

class _DhikrCardState extends State<_DhikrCard> {
  final ValueNotifier<int> _count = ValueNotifier(0);
  static const int _target = 33;

  @override
  void dispose() {
    _count.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // dhikr text
          Text(
            widget.text,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: AppColors.blackColor,
            ),
          ),
          // counter
          ValueListenableBuilder<int>(
            valueListenable: _count,
            builder: (context, count, _) {
              return GestureDetector(
                onTap: () {
                  if (count < _target) _count.value++;
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF5EEFF),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: AppColors.primaryColor, width: 1),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.settings, color: AppColors.primaryColor, size: 14),
                      const SizedBox(width: 4),
                      Text(
                        '$count/$_target',
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
