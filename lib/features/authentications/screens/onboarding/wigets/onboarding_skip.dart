import 'package:ecom/features/authentications/controllers.onboarding/onboarding_controller.dart';
import 'package:flutter/material.dart';

import 'package:ecom/Utils/constants/sizes.dart';
import 'package:ecom/Utils/device/device_utility.dart';

class onBoardingSkip extends StatelessWidget {
  const onBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: TDeviceUtils.getAppBarHeight(),
        right: TSizes.defaultSpace,
        child: TextButton(
          onPressed: () => OnBoardingController.instance.skipPage(),
          child: const Text('skip'),
        ));
  }
}