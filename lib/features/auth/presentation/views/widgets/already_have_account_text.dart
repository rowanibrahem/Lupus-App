import 'package:flutter/material.dart';
import 'package:lupus_app/core/theme/color_app.dart';

class AlreadyHaveAccountText extends StatelessWidget {
  final VoidCallback? onTap;

  const AlreadyHaveAccountText({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        style: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 12,
          height: 1.0,
          letterSpacing: 0.0,
        ),
        children: [
          TextSpan(
            text: 'عندك حساب بالفعل؟ ',
            style: TextStyle(color: AppColors.blackColor),
          ),
          WidgetSpan(
            child: GestureDetector(
              onTap: onTap,
              child: Text(
                'سجّل دخول',
                style: TextStyle(color: AppColors.primaryColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
