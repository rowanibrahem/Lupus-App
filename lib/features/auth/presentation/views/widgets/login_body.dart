import 'package:flutter/material.dart';
import 'package:lupus_app/core/constants/app_text.dart';
import 'package:lupus_app/core/constants/asset_images.dart';
import 'package:lupus_app/core/shared_widgets/custom_button.dart';
import 'package:lupus_app/core/shared_widgets/custom_field.dart';
import 'package:lupus_app/core/theme/color_app.dart';
import 'package:lupus_app/core/theme/styles.dart';
import 'package:lupus_app/features/auth/presentation/views/users_view.dart';
import 'package:lupus_app/features/home/presentation/views/bottom_nav_bar_view.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({super.key});

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isPasswordVisible = false;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GlobalKey<FormState> emailFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> passwordFormKey = GlobalKey<FormState>();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Image.asset(AssetImages.logo, width: 150, height: 150),
          Text(
            AppText.loginText,
            style: Styles.textStyle16(context).copyWith(fontSize: 18),
          ),
          const SizedBox(height: 8),
          Text(AppText.loginSubText, style: Styles.textStyle14(context)),
          const SizedBox(height: 32),
          Form(
            key: emailFormKey,
            child: InputField(
              label: AppText.emailLabel,
              hint: AppText.emailHint,
              focusNode: emailFocusNode,
              autofillHints: [AutofillHints.email],
              controller: emailController,
              validate: (dynamic value) {
                if ((value as String?)?.isEmpty ?? true) {
                  return 'Please enter valid email';
                }
                return null;
              },
            ),
          ),
          const SizedBox(height: 16),
          Form(
            key: passwordFormKey,
            child: InputField(
              label: AppText.passwordLabel,
              hint: AppText.passwordHint,
              focusNode: passwordFocusNode,
              autofillHints: [AutofillHints.password],
              controller: passwordController,
              obscureText: !isPasswordVisible,
              suffixIcon:
                  isPasswordVisible ? Icons.visibility : Icons.visibility_off,
              suffixPressed: () {
                setState(() {
                  isPasswordVisible = !isPasswordVisible;
                });
              },
              validate: (value) {
                if ((value as String?)?.isEmpty ?? true) {
                  return 'Password must not be empty';
                }
                return null;
              },
            ),
          ),
          Spacer(),
          CustomButton(
            text: AppText.loginButton,
            func: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const BottomNavBarView(),
                ),
              );
            },
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppText.dontHaveAccount,
                style: Styles.textStyle14(
                  context,
                ).copyWith(fontWeight: FontWeight.w500),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  minimumSize: Size(0, 0),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const UsersView()),
                  );
                },
                child: Text(
                  AppText.signUpText,
                  style: Styles.textStyle14(context).copyWith(
                    fontWeight: FontWeight.w500,
                    color: ColorApp.primaryColor,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
