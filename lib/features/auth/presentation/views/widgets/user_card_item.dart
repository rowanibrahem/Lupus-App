import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lupus_app/core/theme/color_app.dart';
import 'package:lupus_app/core/theme/styles.dart';

class UserCardItem extends StatelessWidget {
  const UserCardItem({super.key, required this.text , required this.icon, required this.func});

  final String text;
  final String icon;
  final VoidCallback func;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        func();
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          height: 120,
          width: double.infinity,
          decoration: BoxDecoration(
            color: ColorApp.cardColor,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            SvgPicture.asset(icon),
            const SizedBox(height: 8),
            Text(
              text,
              style: Styles.textStyle16(context).copyWith(fontSize: 18),
            )
            ],
          ),
        ),
      ),
    );
  }
}
