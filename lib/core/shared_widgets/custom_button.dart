import 'package:flutter/material.dart';
import 'package:lupus_app/core/theme/color_app.dart';
import 'package:lupus_app/core/theme/styles.dart';


class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.backgroundColor = ColorApp.primaryColor,
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
  final Color? backgroundColor;
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
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: func,
        style: ElevatedButton.styleFrom(
          // minimumSize: const Size(double.infinity, 100),
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(200),
            side: BorderSide(color: borderColor ?? backgroundColor!),
          ),
          // minimumSize: Size(150, 50),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) ...[
              Icon(
                icon,
                color: textColor,
              ),
              const SizedBox(width: 8),
            ],
            Text(
              text,
              style: Styles.textStyle20(context).copyWith(color: textColor , fontSize: 14),
              softWrap: false,
            ),
            // if (svgPicture != null) ...[
            //   const SizedBox(width: 20),
            //   svgPicture!,
            // ],
          ],
        ),
      ),
    );
  }
}