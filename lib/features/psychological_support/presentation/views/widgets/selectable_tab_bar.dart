import 'package:flutter/material.dart';
import 'package:lupus_app/core/constants/app_constants.dart';

class TabsSection extends StatelessWidget {
  const TabsSection({
    super.key,
    required this.selectedIndex,
    required this.onTabSelected,
  });

  final int selectedIndex;
  final ValueChanged<int> onTabSelected;
  final List<String> tabs = AppConstants.psychologicalSupportTabs;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: List.generate(
            tabs.length,
            (index) => Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: index == tabs.length - 1 ? 0 : 12),
                child: GestureDetector(
                  onTap: () => onTabSelected(index),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    height: 42,
                    decoration: BoxDecoration(
                      color: selectedIndex == index ? const Color(0xff6C18D8) : Colors.transparent,
                      borderRadius: BorderRadius.circular(22),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      tabs[index],
                      style: TextStyle(
                        color: selectedIndex == index ? Colors.white : Colors.black87,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        // const Divider(color: Color(0xffACACAC)),
      ],
    );
  }
}
