import 'package:flutter/material.dart';
import 'package:lupus_app/core/constants/app_constants.dart';
import 'package:lupus_app/core/theme/color_app.dart';

class ActivitiesTab extends StatelessWidget {
  const ActivitiesTab({super.key, required this.selectedTab});

  final ValueNotifier<int> selectedTab;

  @override
  Widget build(BuildContext context) {
    final activitiesTabs = AppConstants.activitiesTabs;
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: ValueListenableBuilder<int>(
        valueListenable: selectedTab,
        builder: (context, selected, _) {
          return Row(
            children: List.generate(
              activitiesTabs.length,
              (index) => Expanded(
                child: GestureDetector(
                  onTap: () => selectedTab.value = index,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    margin: EdgeInsets.only(
                      left: index == 0 ? 0 : 8,
                    ),
                    height: 40,
                    decoration: BoxDecoration(
                      color: selected == index ? AppColors.primaryColor : Colors.transparent,
                      borderRadius: BorderRadius.circular(22),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      activitiesTabs[index],
                      // style: Styles.text13WhiteW600(context),
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: selected == index ? Colors.white : AppColors.grayColor,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
