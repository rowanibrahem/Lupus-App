import 'package:flutter/material.dart';
import 'package:lupus_app/core/constants/app_text.dart';
import 'package:lupus_app/core/constants/asset_images.dart';
import 'package:lupus_app/core/shared_widgets/custom_button.dart';
import 'package:lupus_app/core/theme/color_app.dart';
import 'package:lupus_app/core/theme/styles.dart';
import 'package:lupus_app/features/auth/presentation/views/users_view.dart';

class OnboardingBody extends StatefulWidget {
  const OnboardingBody({super.key});

  @override
  State<OnboardingBody> createState() => _OnboardingBodyState();
}

class _OnboardingBodyState extends State<OnboardingBody> {
  PageController controller = PageController();
  int currentIndex = 0;
   
  final List<Map<String, String>> onboardingData = [
    {
      "image": AssetImages.onboard1,
      "title": AppText.onBoarding1,
     
    },
    {
      "image": AssetImages.onboard2,
      "title": AppText.onBoarding2,
      
    },
    {
      "image": AssetImages.onboard3,
      "title": AppText.onBoarding3,
      
    },
  ];
  
  void nextPage() {
    if (currentIndex < onboardingData.length - 1) {
      controller.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeIn,
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const UsersView()),
      );
    }
  }

  void skip() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const UsersView()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 16, right: 16),
          child: Align(
            alignment: Alignment.topRight,
            child: GestureDetector(
              onTap: skip,
              child: Text(
                AppText.skip,
                style: Styles.textStyle20(context).copyWith(fontSize: 14),
              ),
            ),
          ),
        ),
        Expanded(
          child: PageView.builder(
            controller: controller,
            itemCount: onboardingData.length,
            onPageChanged: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            itemBuilder:
                (context, index) => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      onboardingData[index]["image"]!,
                      height: 300,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(height: 30),
                    Text(
                          onboardingData[index]["title"]!,
                          textAlign: TextAlign.center,
                          style: Styles.textStyle20(context),
                        ),
                  ],
                ),
          ),
        ),        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            onboardingData.length,
            (index) => AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              height: 8,
              width: currentIndex == index ? 20 : 8,
              decoration: BoxDecoration(
                color: currentIndex == index ? ColorApp.dots : Colors.grey,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
        ),
        const SizedBox(height: 30),
        
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: CustomButton(
            text: currentIndex == onboardingData.length - 1 ? AppText.getStarted : AppText.next,
            func: nextPage,
            ),
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}
