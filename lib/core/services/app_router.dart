import 'package:flutter/material.dart';
import 'package:lupus_app/core/services/routes.dart';
import 'package:lupus_app/features/auth/presentation/views/charity_signup/charity_signup_view.dart';
import 'package:lupus_app/features/auth/presentation/views/doctor_signup/doctor_signup_step1.dart';
import 'package:lupus_app/features/auth/presentation/views/doctor_signup/doctor_signup_step2_view.dart';
import 'package:lupus_app/features/auth/presentation/views/patient_member_signup/patient_member_signup_view.dart';
import 'package:lupus_app/features/auth/presentation/views/patient_signup/patient_signup_step1_view.dart';
import 'package:lupus_app/features/auth/presentation/views/patient_signup/patient_signup_step2_view.dart';
import 'package:lupus_app/features/auth/presentation/views/patient_signup/patient_signup_step3_view.dart';
import 'package:lupus_app/features/auth/presentation/views/pharmacy_signup/pharmacy_signup_view.dart';
import 'package:lupus_app/features/home/presentation/views/bottom_nav_bar_view.dart';

class AppRouter {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.bottomNavBar:
        return MaterialPageRoute(builder: (_) => const BottomNavBarView());
      case Routes.patientRegisterStep1:
        return MaterialPageRoute(builder: (_) => const PatientSignupStep1View());
      case Routes.patientRegisterStep2:
        return MaterialPageRoute(builder: (_) => const PatientSignupStep2View());
      case Routes.patientRegisterStep3:
        return MaterialPageRoute(builder: (_) => const PatientSignupStep3View());
      case Routes.doctorRegisterStep1:
        return MaterialPageRoute(builder: (_) => const DoctorSignupStep1View());
      case Routes.doctorRegisterStep2:
        return MaterialPageRoute(builder: (_) => const DoctorSignupStep2View());
      case Routes.charityRegister:
        return MaterialPageRoute(builder: (_) => const CharitySignupView());
      case Routes.patientMemberRegister:
        return MaterialPageRoute(builder: (_) => const PatientMemberSignupView());
      case Routes.pharmacyRegister:
        return MaterialPageRoute(builder: (_) => const PharmacySignupView());

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(body: Center(child: Text("No Route Found"))),
        );
    }
  }
}
