import 'package:ecom/Utils/constants/colors.dart';
import 'package:ecom/Utils/constants/sizes.dart';
import 'package:ecom/Utils/device/device_utility.dart';
import 'package:ecom/Utils/helpers/helper_functions.dart';
import 'package:ecom/features/authentications/controllers/onboarding/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class onBoardingNext extends StatelessWidget {
  const onBoardingNext({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Positioned(
        bottom: TDeviceUtils.getBottomNavigationBarHeight(),
        right: TSizes.defaultSpace,
        child: ElevatedButton(
            onPressed: () => OnBoardingController.instance.nextPage(),
            style: ElevatedButton.styleFrom(shape: const CircleBorder(),backgroundColor: dark ? TColors.primary : Colors.black),
            child: const Icon(Iconsax.arrow_right_3)
        )
    );
  }
}