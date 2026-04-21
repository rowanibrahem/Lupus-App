import 'package:flutter/material.dart';
import 'package:lupus_app/core/constants/asset_images.dart';
import 'package:lupus_app/core/theme/styles.dart';

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
          AssetImages.lupusCarveLoge,
          width: size.width,
          height: size.height * 0.33,
          fit: BoxFit.cover,
        ),
        const SizedBox(height: 42),
        Text(
          title,
          style: Styles.text20BlackW700(context),
        )
      ],
    );
  }
}
