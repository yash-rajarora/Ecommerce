import 'package:ecom/Utils/constants/text_strings.dart';
import 'package:ecom/Utils/helpers/helper_functions.dart';
import 'package:ecom/common/widget/login_signup/form_divider.dart';
import 'package:ecom/features/authentications/screens/login/widget/TSocialButtons.dart';
import 'package:ecom/features/authentications/screens/signup/widget/form.dart';
import 'package:ecom/utils/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///Title
              Text(
                TTexts.signupTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: TSizes.spaceBtwSections),

              TSignupForm(dark: dark),
              const SizedBox(height: TSizes.spaceBtwSections),
              TLoginDivider(dividerText: TTexts.orSignUpWith.capitalize!),
              const SizedBox(height: TSizes.spaceBtwSections),
              const TSocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
