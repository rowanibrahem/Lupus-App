import 'package:flutter/material.dart';
import 'package:lupus_app/features/home/presentation/views/widgets/home_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: HomeBody());
  }
}
