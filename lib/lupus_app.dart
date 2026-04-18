import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lupus_app/core/services/app_router.dart';
import 'package:lupus_app/core/services/navigation_service.dart';
import 'package:lupus_app/core/theme/app_theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:lupus_app/features/auth/presentation/views/pharmacy_signup/pharmacy_signup_view.dart';

class LupusApp extends StatelessWidget {
  const LupusApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.light,
        locale: const Locale('ar'),
        supportedLocales: const [
          Locale('ar'),
        ],
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRouter.generateRoute,
        navigatorKey: NavigationService.navigatorKey,
        home: PharmacySignupView(),
      ),
    );
  }
}
