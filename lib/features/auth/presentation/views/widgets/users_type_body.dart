import 'package:flutter/material.dart';
import 'package:lupus_app/core/constants/app_text.dart';
import 'package:lupus_app/core/shared_widgets/custom_button.dart';
import 'package:lupus_app/core/theme/styles.dart';
import 'package:lupus_app/features/auth/presentation/views/widgets/grid_list_user_type.dart';

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
          GridListUserType(),
        SizedBox(height: 20),
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