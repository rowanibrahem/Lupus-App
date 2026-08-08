import 'package:flutter/material.dart';
import 'package:lupus_app/core/theme/styles.dart';

class CustomCard extends StatelessWidget {
  const CustomCard(this.child,{
    super.key,
    
    this.height,
    this.width,
  });
  final Widget? child;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
      decoration: Styles.customCardBoxDecoration,
      child: child,
    );
  }
}
