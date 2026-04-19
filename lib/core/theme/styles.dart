import 'package:flutter/material.dart';
import 'package:lupus_app/core/theme/color_app.dart';

class Styles {
  static TextStyle textStyle20(BuildContext context) {
    return TextStyle(
      color: AppColors.textColor,
      fontSize: getResponsiveFontSize(context, fontSize: 20),
      fontWeight: FontWeight.w500, //meduim
    );
  }

  static TextStyle textStyle16(BuildContext context) {
    return TextStyle(
      color: AppColors.textColor,
      fontSize: getResponsiveFontSize(context, fontSize: 16),
      fontWeight: FontWeight.w600, //semibold
    );
  }

  static TextStyle textStyle14(BuildContext context) {
    return TextStyle(
      color: AppColors.secondaryColor,
      fontSize: getResponsiveFontSize(context, fontSize: 14),
      fontWeight: FontWeight.w400, //regular
    );
  }

  static TextStyle text12Gray(BuildContext context) {
    return TextStyle(
      color: Colors.grey.shade600,
      fontSize: getResponsiveFontSize(context, fontSize: 12),
    );
  }

  static TextStyle text16BlackW700(BuildContext context) {
    return TextStyle(
      color: AppColors.blackColor,
      fontWeight: FontWeight.w700,
      fontSize: getResponsiveFontSize(context, fontSize: 16),
    );
  }

  static TextStyle text20BlackW700(BuildContext context) {
    return TextStyle(
      color: AppColors.blackColor,
      fontWeight: FontWeight.w700,
      fontSize: getResponsiveFontSize(context, fontSize: 20),
      height: 1.0,
      letterSpacing: 0.0,
    );
  }

  static TextStyle text12W500(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: getResponsiveFontSize(context, fontSize: 12),
      height: 1.0,
      letterSpacing: 0.0,
    );
  }
}

double getResponsiveFontSize(BuildContext context, {required double fontSize}) {
  double scaleFactor = getScaleFactor(context);
  double responsiveFontSize = scaleFactor * fontSize;
  double lowerLimit = fontSize * 0.8;
  double upperLimit = fontSize * 1.2;
  return responsiveFontSize.clamp(lowerLimit, upperLimit);
}

double getScaleFactor(BuildContext context) {
  double w = MediaQuery.of(context).size.width;
  if (w <= 550) {
    return w / 400; // Mobile breakpoint
  } else if (w <= 900) {
    return w / 700; // Tablet breakpoint
  } else {
    return w / 1000; // Desktop breakpoint
  }
}
