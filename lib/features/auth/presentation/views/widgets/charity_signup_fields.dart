import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lupus_app/core/constants/app_constants.dart';
import 'package:lupus_app/core/constants/app_text.dart';
import 'package:lupus_app/core/constants/asset_images.dart';
import 'package:lupus_app/core/shared_widgets/label_dropdown_menu.dart';
import 'package:lupus_app/core/shared_widgets/label_text_form_field.dart';
import 'package:lupus_app/features/auth/presentation/views/widgets/auth_password_field.dart';

class CharitySignupFields extends StatefulWidget {
  const CharitySignupFields({super.key});

  @override
  State<CharitySignupFields> createState() => _CharitySignupFieldsState();
}

class _CharitySignupFieldsState extends State<CharitySignupFields> {
  final ValueNotifier<bool> isObscure = ValueNotifier(true);
  final ValueNotifier<String?> selectedFieldsOfWork = ValueNotifier<String?>(AppConstants.fieldsOfWork.first);

  @override
  void dispose() {
    isObscure.dispose();
    selectedFieldsOfWork.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        spacing: 18,
        children: [
          LabelTextFormField(label: AppText.organizationName, hintText: AppText.enterPatientName),
          LabelTextFormField(label: AppText.phoneNumber, hintText: AppText.enterPhoneNumber),
          LabelTextFormField(label: AppText.email, hintText: AppText.enterEmail),
          AuthPasswordField(isObscure: isObscure),
          LabelTextFormField(label: AppText.contactNumber, hintText: AppText.enterContactNumber),
          LabelTextFormField(label: AppText.address, hintText: AppText.enterAddress),
          ValueListenableBuilder<String?>(
            valueListenable: selectedFieldsOfWork,
            builder: (context, value, _) {
              return LabelDropdownMenu<String>(
                label: AppText.fieldOfWork,
                initialSelection: value,
                onSelected: (newValue) => selectedFieldsOfWork.value = newValue,
                dropdownMenuEntries: AppConstants.fieldsOfWork.map((type) => DropdownMenuEntry(value: type, label: type)).toList(),
              );
            },
          ),
          LabelTextFormField(
            label: AppText.addLink,
            hintText: AppText.websiteOrFacebookLink,
            prefixIcon: Padding(
              padding: const EdgeInsets.all(12),
              child: SvgPicture.asset(AssetImages.copyLink),
            ),
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
