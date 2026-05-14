import 'package:flutter/material.dart';
import 'package:lupus_app/core/theme/color_app.dart';

class Styles {
  static TextStyle textStyle20(BuildContext context) {
    return TextStyle(
      color: AppColors.textColor,
      fontSize: getResponsiveFontSize(context, fontSize: 20),
      fontWeight: FontWeight.w500, // medium
    );
  }

  static TextStyle text10BlackW600(BuildContext context) {
    return TextStyle(
      color: AppColors.blackColor,
      fontSize: getResponsiveFontSize(context, fontSize: 10),
      fontWeight: FontWeight.w600, // semibold
    );
  }

  static TextStyle text10GrayW500(BuildContext context) {
    return TextStyle(
      color: AppColors.grayColor,
      fontSize: getResponsiveFontSize(context, fontSize: 10),
      fontWeight: FontWeight.w500, // medium
      height: 1.6,
    );
  }

  static TextStyle text10BlackW500(BuildContext context) {
    return TextStyle(
      color: AppColors.blackColor,
      fontSize: getResponsiveFontSize(context, fontSize: 10),
      fontWeight: FontWeight.w500, // medium
      height: 1.6,
    );
  }

  static TextStyle textStyle10(BuildContext context) {
    return TextStyle(
      color: Colors.black,
      fontSize: getResponsiveFontSize(context, fontSize: 10),
      fontWeight: FontWeight.w500, // medium
    );
  }

  static TextStyle textStyle16(BuildContext context) {
    return TextStyle(
      color: AppColors.textColor,
      fontSize: getResponsiveFontSize(context, fontSize: 16),
      fontWeight: FontWeight.w600, // semibold
    );
  }

  static TextStyle textStyle14(BuildContext context) {
    return TextStyle(
      color: AppColors.secondaryColor,
      fontSize: getResponsiveFontSize(context, fontSize: 14),
      fontWeight: FontWeight.w400, // regular
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

  static TextStyle textStyleBold14(BuildContext context) {
    return TextStyle(
      color: Colors.black,
      fontSize: getResponsiveFontSize(context, fontSize: 14),
      fontWeight: FontWeight.w700, // bold
    );
  }

  static BoxDecoration customCardBoxDecoration = 
    BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      );
  
  // BoxDecoration(
  //   color: const Color(0xffF8F2FF),
  //   borderRadius: BorderRadius.circular(15),
  //   boxShadow: const [
  //     BoxShadow(
  //       color: Color(0x29000000),
  //       offset: Offset(0, 1),
  //       blurRadius: 5.0,
  //       spreadRadius: 0.0,
  //     ),
  //   ],
  //   // gradient: const LinearGradient(
  //   //   begin: Alignment.centerRight,
  //   //   end: Alignment.centerLeft,
  //   //   transform: GradientRotation(277.31 * 3.1415926535 / 180),
  //   //   colors: [
  //   //     Color(0xFFafaaff),
  //   //     Color(0xFFf7ccff),
  //   //   ],
  //   //   stops: [-0.0075, 0.9348],
  //   // ),
  // );
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
    return w / 400; // Mobile
  } else if (w <= 900) {
    return w / 700; // Tablet
  } else {
    return w / 1000; // Desktop
  }
}
