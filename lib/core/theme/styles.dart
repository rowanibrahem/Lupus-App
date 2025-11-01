import 'package:flutter/material.dart';
import 'package:lupus_app/core/theme/color_app.dart';

class Styles {
   static TextStyle textStyle20(BuildContext context) {
    return TextStyle(
      color: ColorApp.textColor,
      fontSize: getResponsiveFontSize(context, fontSize: 20),
      fontWeight: FontWeight.w500, //meduim
    );
  }
 static TextStyle textStyle16(BuildContext context) {
    return TextStyle(
      color: ColorApp.textColor,
      fontSize: getResponsiveFontSize(context, fontSize: 16),
      fontWeight: FontWeight.w600, //semibold
    );
  }
  static TextStyle textStyle14(BuildContext context) {
    return TextStyle(
      color: ColorApp.secondaryColor,
      fontSize: getResponsiveFontSize(context, fontSize: 14),
      fontWeight: FontWeight.w400, //regular
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