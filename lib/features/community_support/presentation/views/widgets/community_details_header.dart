import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lupus_app/core/constants/asset_images.dart';
import 'package:lupus_app/core/theme/color_app.dart';
import 'package:lupus_app/core/theme/styles.dart';

class CommunityDetailsHeader extends StatelessWidget {
  const CommunityDetailsHeader(this.community, {super.key});
  final Map<String, dynamic> community;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 16, bottom: 28, left: 16, right: 16),
      decoration: Styles.primaryGradientDecoration,
      child: Stack(
        children: [
          _buildBackArrow(context),
          Column(
            children: [
              const SizedBox(height: 96),
              Container(
                width: 72,
                height: 72,
                decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                child: ClipOval(child: Image.asset('assets/images/chat6.png', fit: BoxFit.cover)),
              ),
              const SizedBox(height: 14),
              Text(
                community['name'] ?? "",
                textAlign: TextAlign.center,
                style: Styles.text16WhiteW700(context),
              ),
              const SizedBox(height: 8),
              Text(
                community['description'] ?? "",
                textAlign: TextAlign.center,
                style: Styles.text12WhiteW400(context),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Positioned _buildBackArrow(BuildContext context) {
    return Positioned(
      right: 0,
      top: 0,
      child: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: SvgPicture.asset(
            AssetImages.arrowLeft,
            colorFilter: const ColorFilter.mode(
              AppColors.whiteColor,
              BlendMode.srcIn,
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
