import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lupus_app/core/constants/asset_images.dart';

class ArrowLeftLeading extends StatelessWidget {
  const ArrowLeftLeading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: SvgPicture.asset(AssetImages.arrowLeft),
      ),
    );
  }
}
