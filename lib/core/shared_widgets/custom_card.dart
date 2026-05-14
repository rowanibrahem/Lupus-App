import 'package:flutter/material.dart';
import 'package:lupus_app/core/theme/styles.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, this.child, this.radius = 25});
  final Widget? child;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: Styles.customCardBoxDecoration,
      child: child,
    );
  }
}
