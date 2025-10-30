import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lupus_app/features/splash_screen/presentation/splash_view.dart';

class LupusApp extends StatelessWidget {
  const LupusApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          textTheme: GoogleFonts.ibmPlexSansArabicTextTheme(),
          useMaterial3: true,
        ),
        darkTheme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepPurple,
            brightness: Brightness.dark,
          ),
          textTheme: GoogleFonts.poppinsTextTheme(),
          useMaterial3: true,
        ),
        // themeMode: themeMode,
        debugShowCheckedModeBanner: false,  
        home: SplashView(),
      ),
    );
  }
}
