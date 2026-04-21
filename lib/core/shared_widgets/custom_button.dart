import 'package:flutter/material.dart';
import 'package:lupus_app/core/theme/color_app.dart';
import 'package:lupus_app/core/theme/styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      // this.backgroundColor = AppColors.primaryColor,
      this.borderRadius,
      required this.text,
      this.fontSized = 20,
      this.textColor = Colors.white,
      required this.func,
      this.width = double.infinity,
      this.height = 40,
      this.icon,
      this.borderColor,
      this.alignment = Alignment.center
      // this.svgPicture,
      });
  final double? width;
  final double? height;
  // final Color? backgroundColor;
  final Color? textColor;
  final BorderRadius? borderRadius;
  final double? fontSized;
  final Color? borderColor;
  final String text;
  final VoidCallback func;
  final IconData? icon;
  final Alignment alignment;
  // final SvgPicture? svgPicture;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: func,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(200),
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFFFFFFF),
              Color(0x00FFFFFF),
            ],
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(200),
            color: AppColors.primaryColor,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // if (icon != null) ...[
              //   Icon(icon, color: textColor, size: fontSize + 2),
              //   const SizedBox(width: 8),
              // ],
              Text(
                text,
                style: Styles.textStyle20(context).copyWith(color: textColor, fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
