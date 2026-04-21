import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lupus_app/core/theme/color_app.dart';
import 'package:lupus_app/core/theme/styles.dart';

class UserCardItem extends StatelessWidget {
  const UserCardItem({
    super.key,
    required this.text,
    required this.icon,
    required this.func,
    required this.isSelected,
  });

  final String text;
  final String icon;
  final VoidCallback func;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        func();
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 250),
          curve: Curves.easeInOut,
          height: 120,
          width: double.infinity,
          decoration: BoxDecoration(
            color: isSelected ? AppColors.bgColor : AppColors.cardColor,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: isSelected ? AppColors.bgColor : Colors.transparent,
              width: 2,
            ),
          ),
          transform: Matrix4.identity()..scale(isSelected ? 1.05 : 1.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(icon),
              const SizedBox(height: 8),
              Text(
                text,
                style: Styles.textStyle16(context).copyWith(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
