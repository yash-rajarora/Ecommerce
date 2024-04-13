import 'package:ecom/Utils/constants/sizes.dart';
import 'package:ecom/Utils/constants/text_strings.dart';
import 'package:ecom/Utils/helpers/helper_functions.dart';
import 'package:ecom/common/styles/spacing_style.dart';
import 'package:ecom/common/widget/login_signup/form_divider.dart';
import 'package:ecom/features/authentications/screens/login/widget/TLoginForm.dart';
import 'package:ecom/features/authentications/screens/login/widget/TLoginHeader.dart';
import 'package:ecom/features/authentications/screens/login/widget/TSocialButtons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              ///logo and Heading
              TLoginHeader(dark: dark),

              ///form

              const TLoginForm(),

              ///Divider

              TLoginDivider(dividerText:TTexts.orSignInWith.capitalize!),
              const SizedBox(height: TSizes.spaceBtwSections),

              ///Socialss

              const TSocialButtons()
            ],
          ),
        ),
      ),
    );
  }
}
