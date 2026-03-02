import 'package:flutter/material.dart';
import 'package:lupus_app/core/constants/app_text.dart';
import 'package:lupus_app/core/constants/asset_icons.dart';
import 'package:lupus_app/features/auth/data/modals/user_type_modal.dart';
import 'package:lupus_app/features/auth/presentation/views/widgets/user_card_item.dart';

class GridListUserType extends StatelessWidget {
  const GridListUserType({super.key});
  

  @override
  Widget build(BuildContext context) {
  List<UserTypeModal> users = [
  UserTypeModal(
    text: AppText.patient,
    icon: AssetIcons.patientIcon,
    func: () {},
  ),
  UserTypeModal(
    text: AppText.doctor,
    icon: AssetIcons.doctorIcon,
    func: () {},
  ),
  UserTypeModal(
    text: AppText.pharmacy,
    icon: AssetIcons.pharmacyIcon,
    func: () {},
  ),
  UserTypeModal(
    text: AppText.patientFamily,
    icon: AssetIcons.patientFamilyicon,
    func: () {},
  ),
  UserTypeModal(
    text: AppText.organization,
    icon: AssetIcons.charityIcon,
    func: () {},
  ),
];
    return  Expanded(
      child: GridView.builder(
        itemCount: users.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 1.5,
        ),
        itemBuilder: (context, index) {
          final user = users[index];
          return UserCardItem(
            text: user.text,
             icon: user.icon,
             func: user.func
             );
        },
      ),
    );
  }
}