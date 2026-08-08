import 'package:flutter/material.dart';
import 'package:lupus_app/core/constants/app_text.dart';
import 'package:lupus_app/core/services/routes.dart';
import 'package:lupus_app/core/shared_widgets/body_view.dart';
import 'package:lupus_app/features/auth/presentation/views/widgets/already_have_account_text.dart';
import 'package:lupus_app/features/auth/presentation/views/widgets/auth_banner.dart';
import 'package:lupus_app/features/auth/presentation/views/widgets/charity_signup_button.dart';
import 'package:lupus_app/features/auth/presentation/views/widgets/charity_signup_fields.dart';

class CharitySignupView extends StatefulWidget {
  const CharitySignupView({super.key});

  @override
  State<CharitySignupView> createState() => _CharitySignupViewState();
}

class _CharitySignupViewState extends State<CharitySignupView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final ValueNotifier<AutovalidateMode> autovalidateMode = ValueNotifier(
    AutovalidateMode.onUserInteraction,
  );

  void enableAutoValidation() {
    if (autovalidateMode.value != AutovalidateMode.always) autovalidateMode.value = AutovalidateMode.always;
  }

  @override
  void dispose() {
    autovalidateMode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BodyView(
      SingleChildScrollView(
          padding: EdgeInsets.zero,
          child:
              // ValueListenableBuilder<AutovalidateMode>(
              //     valueListenable: autovalidateMode,
              //     builder: (context, mode, _) {
              //       return
              Form(
            key: formKey,
            // autovalidateMode: mode,
            child: Column(
              children: [
                AuthBanner(title: AppText.organizationSignupTitle),
                const SizedBox(height: 16),
                CharitySignupFields(),
                CharitySignupButton(
                  onPressed: () {
                    // if (formKey.currentState!.validate()) {
                    // formKey.currentState!.save();
                    Navigator.of(context).pushReplacementNamed(Routes.bottomNavBar);
                    // } else {
                    // enableAutoValidation();
                    // }
                  },
                ),
                AlreadyHaveAccountText(),
                const SizedBox(height: 16),
              ],
            ),
          )
          // ;}),
          ),
    );
  }
}