import 'package:flutter/material.dart';
import 'package:lupus_app/core/theme/color_app.dart';

abstract class AppTheme {
  static final lightTheme = ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    scaffoldBackgroundColor: AppColors.whiteColor,
    appBarTheme: AppBarTheme(
      // color: AppColors.whiteColor,
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: true,
      actionsIconTheme: IconThemeData(color: AppColors.blackColor),
      backgroundColor: AppColors.whiteColor,
      titleTextStyle: TextStyle(
        color: AppColors.blackColor,
        fontWeight: FontWeight.w700,
        fontSize: 16,
      ),
    ),
    fontFamily: "Changa",
    primaryColor: AppColors.primaryColor,
    textTheme: TextTheme(
      titleSmall: TextStyle(),
    ),
    colorScheme: ColorScheme.light(
      primary: AppColors.bgColor, // Header background (selected date)
      onPrimary: AppColors.whiteColor, // Header text color
      onSurface: AppColors.primaryColor, // Calendar day text color
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: AppColors.primaryColor,
      selectionColor: AppColors.primaryColor.withValues(alpha: 0.3),
      selectionHandleColor: AppColors.primaryColor,
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(
        color: AppColors.grayColor,
        fontWeight: FontWeight.w600,
        fontSize: 12,
        height: 1.0,
        letterSpacing: 0.0,
      ),
      filled: true,
      fillColor: AppColors.lightGrayColor,
      prefixIconColor: AppColors.blackColor,
      suffixIconColor: AppColors.blackColor,
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(10),
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(10),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.primaryColor, width: 1.5),
        borderRadius: BorderRadius.circular(10),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(10),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.errorColor, width: 1.5),
        borderRadius: BorderRadius.circular(10),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        foregroundColor: AppColors.whiteColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        textStyle: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 16,
          height: 1.0,
          letterSpacing: 0.16,
        ),
        shadowColor: Color(0x40000000),
      ),
    ),
    dropdownMenuTheme: DropdownMenuThemeData(
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.lightGrayColor,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      menuStyle: MenuStyle(
        backgroundColor: WidgetStatePropertyAll(
          AppColors.lightGrayColor,
        ),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      textStyle: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 12,
        height: 1.0, // line-height: 100%
        letterSpacing: 0,
      ),
    ),
    radioTheme: RadioThemeData(
      fillColor: WidgetStatePropertyAll(AppColors.lighterGrayColor),
      // overlayColor: WidgetStatePropertyAll(AppColors.primaryColor),
    ),
  );
}
