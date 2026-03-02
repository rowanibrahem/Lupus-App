import 'package:flutter/material.dart';
import 'package:lupus_app/core/constants/app_text.dart';
import 'package:lupus_app/core/constants/asset_icons.dart';
import 'package:lupus_app/features/auth/data/modals/user_type_modal.dart';
import 'package:lupus_app/features/auth/presentation/views/widgets/user_card_item.dart';

class GridListUserType extends StatefulWidget {
  const GridListUserType({
    super.key,
    required this.selectedIndex,
    required this.onSelect,
  });
  final int selectedIndex;
  final Function(int) onSelect;

  @override
  State<GridListUserType> createState() => _GridListUserTypeState();
}

class _GridListUserTypeState extends State<GridListUserType> {
  int selectedIndex = -1;
  final List<UserTypeModal> users = [
    UserTypeModal(text: AppText.patient, icon: AssetIcons.patientIcon),
    UserTypeModal(text: AppText.doctor, icon: AssetIcons.doctorIcon),
    UserTypeModal(text: AppText.pharmacy, icon: AssetIcons.pharmacyIcon),
    UserTypeModal(
      text: AppText.patientFamily,
      icon: AssetIcons.patientFamilyicon,
    ),
    UserTypeModal(text: AppText.organization, icon: AssetIcons.charityIcon),
  ];
  @override
  Widget build(BuildContext context) {
    return Expanded(
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
            isSelected: selectedIndex == index,
            func: () {
              widget.onSelect(index);
              setState(() {
                selectedIndex = index;
              });
            },
          );
        },
      ),
    );
  }
}
