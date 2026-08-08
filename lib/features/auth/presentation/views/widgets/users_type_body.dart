import 'package:flutter/material.dart';
import 'package:lupus_app/core/constants/app_text.dart';
import 'package:lupus_app/core/services/navigation_service.dart';
import 'package:lupus_app/core/services/routes.dart';
import 'package:lupus_app/core/shared_widgets/custom_button.dart';
import 'package:lupus_app/core/theme/styles.dart';
import 'package:lupus_app/features/auth/presentation/views/widgets/grid_list_user_type.dart';

class UsersTypeBody extends StatefulWidget {
  const UsersTypeBody({super.key});

  @override
  State<UsersTypeBody> createState() => _UsersTypeBodyState();
}

class _UsersTypeBodyState extends State<UsersTypeBody> {
  int selectedIndex = -1;
  final List<String> routes = [
    Routes.patientRegister,
    Routes.doctorRegister,
    Routes.pharmacyRegister,
    Routes.patientMemberRegister,
    Routes.charityRegister,
  ];

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
          GridListUserType(
            selectedIndex: selectedIndex,
            onSelect: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
          ),
          SizedBox(height: 20),
          CustomButton(
            text: AppText.next,
            func: () {
              if (selectedIndex == -1) {
                return;
              }

              NavigationService.navigateTo(routes[selectedIndex]);
            },
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}