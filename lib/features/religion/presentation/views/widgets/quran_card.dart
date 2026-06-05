import 'package:flutter/material.dart';
import 'package:lupus_app/core/constants/app_text.dart';
import 'package:lupus_app/core/theme/styles.dart';

class QuranCard extends StatelessWidget {
  const QuranCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: Styles.primaryGradientDecoration.copyWith(
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppText.patienceVerse,
            style: TextStyle(//  !TODO:AppStyles
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Colors.white,
              height: 1.9,
              // letterSpacing: 0.9,
            ),
          ),
          SizedBox(height: 10),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'البقرة: 155-156',// !TODO:AppText
              textAlign: TextAlign.right,//  !TODO:AppStyles
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Colors.white70,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
