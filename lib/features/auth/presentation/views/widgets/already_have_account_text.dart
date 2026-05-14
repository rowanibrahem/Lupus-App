import 'package:flutter/material.dart';
import 'package:lupus_app/core/constants/app_text.dart';
import 'package:lupus_app/core/theme/color_app.dart';
import 'package:lupus_app/core/theme/styles.dart';

class AlreadyHaveAccountText extends StatelessWidget {
  final VoidCallback? onTap;

  const AlreadyHaveAccountText({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Text.rich(
        TextSpan(
          style: Styles.text12W500(context),
          children: [
            TextSpan(
              text: AppText.alreadyHaveAccountPrompt,
              style: TextStyle(color: AppColors.blackColor),
            ),
            WidgetSpan(
              child: GestureDetector(
                onTap: onTap,
                child: Text(
                  AppText.loginNow,
                  style: TextStyle(color: AppColors.primaryColor),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
