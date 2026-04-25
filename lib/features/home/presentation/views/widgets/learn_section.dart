import 'package:flutter/material.dart';
import 'package:lupus_app/core/constants/app_text.dart';
import 'package:lupus_app/core/theme/styles.dart';
import 'learn_card.dart';

class LearnSection extends StatelessWidget {
  const LearnSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Title
         Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             Text(
              AppText.learnTitle,
              style: Styles.textStyle14(context).copyWith(color: Colors.black),
              ),
              Text(
              AppText.viewAll,
              style: Styles.textStyle10(context),
            ),
           ],
         ),

        const SizedBox(height: 12),

        SizedBox(
          height: 120,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: const [
              LearnCard(
                text:
                    AppText.learnText1,
              ),
              SizedBox(width: 10),
              LearnCard(
                text:
                    AppText.learnText2,
              ),
            ],
          ),
        ),
      ],
    );
  }
}