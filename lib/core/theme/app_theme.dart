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
      // filled: true,
      // fillColor: AppColors.lightGrayColor,
      prefixIconColor: AppColors.primaryColor,
      suffixIconColor: AppColors.primaryColor,

      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.grayBlue),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.grayBlue),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.purple, width: 1.5),
      ),

      disabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.grayBlue),
        borderRadius: BorderRadius.circular(12),
      ),

      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.errorColor, width: 1.5),
        borderRadius: BorderRadius.circular(12),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        foregroundColor: AppColors.whiteColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
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
        // filled: true,
        // fillColor: AppColors.lightGrayColor,
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.grayBlue),
          borderRadius: BorderRadius.circular(12),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.grayBlue),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.grayBlue),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      menuStyle: MenuStyle(
        backgroundColor: WidgetStatePropertyAll(Colors.white),
        elevation: WidgetStatePropertyAll(4),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      textStyle: TextStyle(
        color: AppColors.grayColor,

        fontWeight: FontWeight.w500,
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

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    // fontFamily: "NaughtyMonster",
    scaffoldBackgroundColor: AppColors.navyBlue,
    colorScheme: const ColorScheme.dark(
      primary: AppColors.purple,
      onPrimary: AppColors.whiteSoft,
      secondary: AppColors.cyan,
      onSecondary: AppColors.navyDark,
      surface: AppColors.deepBlue,
      onSurface: AppColors.whiteSoft,
      error: Colors.redAccent,
      onError: AppColors.whiteSoft,
    ),
    // Optional: map previous properties to use the ColorScheme
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.deepBlue, // use surface
      selectedItemColor: AppColors.purple, // use primary
      unselectedItemColor: AppColors.whiteSoft, // use onSurface
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.navyBlue,
      foregroundColor: AppColors.whiteSoft,
      elevation: 0,
      centerTitle: true,
    ),

    textSelectionTheme: TextSelectionThemeData(
      cursorColor: AppColors.purple,
      selectionColor: AppColors.purple.withValues(alpha: 0.3),
      selectionHandleColor: AppColors.purple,
    ),

    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(
        color: AppColors.graySoft,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w500,
      ),
      labelStyle: const TextStyle(
        color: AppColors.graySoft,
        fontFamily: "Montserrat",
        fontWeight: FontWeight.w500,
      ),
      // filled: true,
      // fillColor: AppColors.deepBlue,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: AppColors.grayBlue),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: AppColors.grayBlue),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: AppColors.purple, width: 1.5),
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        // minimumSize: const Size(double.infinity, 50),
        padding: const EdgeInsets.symmetric(
          vertical: 24,
          horizontal: 16,
        ),
        backgroundColor: AppColors.purple,
        foregroundColor: AppColors.whiteSoft,
        elevation: 12,
        shadowColor: const Color(0xFF8B5CF6).withValues(alpha: 0.6),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        textStyle: const TextStyle(
          fontFamily: "Montserrat",
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
  );
}
