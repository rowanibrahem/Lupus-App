import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lupus_app/core/services/app_router.dart';
import 'package:lupus_app/core/services/navigation_service.dart';
import 'package:lupus_app/core/theme/app_theme.dart';
import 'package:lupus_app/features/auth/presentation/views/login_view.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:lupus_app/features/auth/presentation/views/patient_signup/patient_signup_step1_view.dart';
import 'package:lupus_app/features/auth/presentation/views/users_view.dart';
import 'package:lupus_app/features/splash_screen/presentation/splash_view.dart';

class LupusApp extends StatelessWidget {
  const LupusApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        theme: AppTheme.lightTheme,
        locale: const Locale('ar'),
        supportedLocales: const [
          Locale('ar'),
        ],
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        // darkTheme: ThemeData(
        //   colorScheme: ColorScheme.fromSeed(
        //     seedColor: Colors.deepPurple,
        //     brightness: Brightness.dark,
        //   ),
        //   textTheme: GoogleFonts.poppinsTextTheme(),
        //   useMaterial3: true,
        // ),
        // themeMode: themeMode,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRouter.generateRoute,
        navigatorKey: NavigationService.navigatorKey,
        home: PatientSignupStep1View(),
      ),
    );
  }
}
