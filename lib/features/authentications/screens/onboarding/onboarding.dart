import 'package:ecom/features/authentications/screens/onboarding/wigets/onBoarding_dot.dart';
import 'package:ecom/features/authentications/screens/onboarding/wigets/onboarding_page.dart';
import 'package:ecom/features/authentications/screens/onboarding/wigets/onboarding_skip.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ecom/Utils/constants/image_strings.dart';
import 'package:ecom/Utils/constants/text_strings.dart';
import 'package:get/get.dart';
import 'package:ecom/features/authentications/controllers/onboarding/onboarding_controller.dart';

import 'wigets/onBoarding_next.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              onBoarding(
                  image: TImages.onBoardingImage1,
                  title: TTexts.onBoardingTitle1,
                  subTitle: TTexts.onBoardingSubTitle1),
              onBoarding(
                  image: TImages.onBoardingImage2,
                  title: TTexts.onBoardingTitle2,
                  subTitle: TTexts.onBoardingSubTitle2),
              onBoarding(
                  image: TImages.onBoardingImage3,
                  title: TTexts.onBoardingTitle3,
                  subTitle: TTexts.onBoardingSubTitle3),
            ],
          ),
          const onBoardingSkip(),
          const onBoardingDot(),
          const onBoardingNext(),
        ],
      ),
    );
  }
}




