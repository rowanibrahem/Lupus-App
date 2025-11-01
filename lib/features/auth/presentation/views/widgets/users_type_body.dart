import 'package:flutter/material.dart';
import 'package:lupus_app/core/constants/app_text.dart';
import 'package:lupus_app/core/shared_widgets/custom_button.dart';
import 'package:lupus_app/core/theme/styles.dart';

class UsersTypeBody extends StatelessWidget {
  const UsersTypeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          Text(
            AppText.chooseAccount,
            style: Styles.textStyle16(context).copyWith(fontSize: 18),
            ),
            SizedBox(height: 8),
          Text(
            AppText.chooseAccountSubText,
            style: Styles.textStyle14(context),
          ),
          CustomButton(
            text: AppText.next,
            func: (){},
            ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}