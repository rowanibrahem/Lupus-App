
import 'package:flutter/material.dart';
import 'package:lupus_app/core/services/routes.dart';
import 'package:lupus_app/features/auth/presentation/views/charity_view.dart';
import 'package:lupus_app/features/auth/presentation/views/doctor_view.dart';
import 'package:lupus_app/features/auth/presentation/views/patient_member_view.dart';
import 'package:lupus_app/features/auth/presentation/views/patient_view.dart';
import 'package:lupus_app/features/auth/presentation/views/pharmacy_view.dart';

class AppRouter {

  static Route generateRoute(RouteSettings settings) {

    switch (settings.name) {

      case Routes.patientRegister:
        return MaterialPageRoute(
          builder: (_) => const PatientView(),
        );

      case Routes.doctorRegister:
        return MaterialPageRoute(
          builder: (_) => const DoctorView(),
        );
      case Routes.charityRegister:
        return MaterialPageRoute(
          builder: (_) => const CharityView(),
        );
        case Routes.patientMemberRegister:
        return MaterialPageRoute(
          builder: (_) => const PatientMemberView(),
        );
      case Routes.pharmacyRegister:
        return MaterialPageRoute(
          builder: (_) => const PharmacyView(),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text("No Route Found")),
          ),
        );
    }
  }

}
