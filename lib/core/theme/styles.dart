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
      height: 1.0,
      letterSpacing: 0.0,
      textBaseline: TextBaseline.alphabetic,
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

  static BoxDecoration customCardBoxDecoration = BoxDecoration(
    color: AppColors.whiteColor, // cardBg,
    borderRadius: BorderRadius.circular(16),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withValues(alpha: 0.06),
        blurRadius: 10,
        offset: const Offset(0, 4),
      ),
    ],
  );

  static TextStyle text14BlackW700(BuildContext context) {
    return TextStyle(
      color: AppColors.blackColor,
      fontWeight: FontWeight.w700,
      fontSize: getResponsiveFontSize(context, fontSize: 14),
    );
  }

  static TextStyle text12BlackW700(BuildContext context) {
    return TextStyle(
      color: AppColors.blackColor,
      fontWeight: FontWeight.w700,
      fontSize: getResponsiveFontSize(context, fontSize: 12),
    );
  }

  static TextStyle text12GrayW400(BuildContext context) {
    return TextStyle(
      color: AppColors.grayColor,
      fontWeight: FontWeight.w400,
      fontSize: getResponsiveFontSize(context, fontSize: 12),
    );
  }

  static TextStyle text12GrayBlueW500(BuildContext context) {
    return TextStyle(
      color: AppColors.grayBlue,
      fontWeight: FontWeight.w500,
      fontSize: getResponsiveFontSize(context, fontSize: 12),
    );
  }

  static TextStyle text13WhiteW600(BuildContext context) {
    return TextStyle(
      color: AppColors.whiteColor,
      fontWeight: FontWeight.w600,
      fontSize: getResponsiveFontSize(context, fontSize: 13),
    );
  }

  static BoxDecoration primaryGradientDecoration = BoxDecoration(
    borderRadius: BorderRadius.only(
      bottomLeft: Radius.circular(32),
      bottomRight: Radius.circular(32),
    ),
    gradient: const LinearGradient(
      begin: Alignment.centerRight,
      end: Alignment.centerLeft,
      colors: [Color(0xFF5405BA), Color(0xFF9F69F7)],
    ),
    image: DecorationImage(
      image: AssetImage("assets/images/awareness_ribbon.png"),
      alignment: const Alignment(-.8, 0.0),
      // Alignment.centerLeft,
      fit: BoxFit.contain,
      opacity: 0.4,
    ),
  );

  static TextStyle text16WhiteW700(BuildContext context) {
    return TextStyle(
      color: AppColors.whiteColor,
      fontWeight: FontWeight.w700,
      fontSize: getResponsiveFontSize(context, fontSize: 16),
    );
  }

  static TextStyle text12WhiteW400(BuildContext context) {
    return TextStyle(
      color: AppColors.whiteColor,
      fontWeight: FontWeight.w400,
      fontSize: getResponsiveFontSize(context, fontSize: 12),
    );
  }

  static TextStyle text11PrimaryW600(BuildContext context) {
    return const TextStyle(
      fontSize: 11,
      fontWeight: FontWeight.w600,
      color: AppColors.primaryColor,
    );
  }

  static TextStyle text11GrayW500(BuildContext context) {
    return const TextStyle(
      fontSize: 11,
      fontWeight: FontWeight.w500,
      color: AppColors.grayColor,
    );
  }

  static TextStyle text13GrayW400(BuildContext context) {
    return const TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.w400,
      color: AppColors.grayColor,
      height: 1.7,
    );
  }

  copyWith({required int fontSize}) {}

  static BoxDecoration msgDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.only(
      bottomLeft: Radius.circular(12),
      bottomRight: Radius.circular(12),
      topLeft: Radius.circular(12),
    ),
    border: Border.all(color: AppColors.primaryColor, width: 1.2),
  );
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
