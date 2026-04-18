import 'package:flutter/material.dart';
import 'package:lupus_app/core/theme/color_app.dart';

class AuthBanner extends StatelessWidget {
  final String title;

  const AuthBanner({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          "assets/images/lupus_carve_loge.png",
          width: size.width,
          height: size.height * 0.33,
          fit: BoxFit.cover,
        ),
        const SizedBox(height: 42),
        Text(
          title,
          style: TextStyle(
            color: AppColors.blackColor,
            fontWeight: FontWeight.w700,
            fontSize: 20,
            height: 1.0,
            letterSpacing: 0.0,
          ),
        ),
      ],
    );
  }
}
