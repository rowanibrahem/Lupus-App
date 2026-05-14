import 'package:flutter/material.dart';
import 'package:lupus_app/core/constants/app_text.dart';

class PharmacySignupButton extends StatelessWidget {
  const PharmacySignupButton({super.key, this.onPressed});
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12), //Todo: BlocConsumer
      child: Container(
        width: double.infinity,
        height: 54,
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 30,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: ElevatedButton(
          onPressed: onPressed,
          child: Text(AppText.confirm),
        ),
      ),
    );
  }
}
