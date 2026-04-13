import 'package:flutter/material.dart';
import 'package:lupus_app/features/splash_screen/presentation/widgets/splash_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SplashBody(),
      ),
    );
  }
}
