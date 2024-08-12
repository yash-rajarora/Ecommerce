import 'package:ecom/Utils/constants/colors.dart';
import 'package:ecom/Utils/constants/sizes.dart';
import 'package:ecom/Utils/constants/text_strings.dart';
import 'package:ecom/Utils/helpers/helper_functions.dart';
import 'package:ecom/Utils/validators/validation.dart';
import 'package:ecom/features/authentications/controllers/signup/signup_controller.dart';
import 'package:ecom/features/authentications/screens/signup/verify_email.dart';
import 'package:ecom/features/authentications/screens/signup/widget/terms_conditions_checkbox.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TSignupForm extends StatelessWidget {
  const TSignupForm({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    return Form(
        key: controller.signupFormKey,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: controller.firstName,
                    validator: (value) => TValidator.validateEmptyText('First Name', value),
                    expands: false,
                    decoration: const InputDecoration(
                        labelText: TTexts.firstName,
                        prefixIcon: Icon(Iconsax.user)),
                  ),
                ),
                const SizedBox(width: TSizes.spaceBtwInputFields),
                Expanded(
                  child: TextFormField(
                    controller: controller.lastName,
                    validator: (value) => TValidator.validateEmptyText('Last Name', value),
                    expands: false,
                    decoration: const InputDecoration(
                        labelText: TTexts.lastName,
                        prefixIcon: Icon(Iconsax.user)),
                  ),
                ),
              ],
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields),
            TextFormField(
              controller: controller.username,
              validator: (value) => TValidator.validateEmptyText('Username', value),
              expands: false,
              decoration: const InputDecoration(
                  labelText: TTexts.username,
                  prefixIcon: Icon(Iconsax.user_edit)),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields),
            TextFormField(
              controller: controller.email,
              validator:(value)=> TValidator.validateEmail(value),
              expands: false,
              decoration: const InputDecoration(
                  labelText: TTexts.email,
                  prefixIcon: Icon(Iconsax.direct)),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields),
            TextFormField(
              controller: controller.phoneNumber,
              validator:(value)=> TValidator.validatePhoneNumber(value),
              expands: false,
              decoration: const InputDecoration(
                  labelText: TTexts.phoneNo,
                  prefixIcon: Icon(Iconsax.call)),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields),
            Obx(
              ()=> TextFormField(
                controller: controller.password,
                validator:(value)=> TValidator.validatePassword(value),
                obscureText: controller.hidePassword.value,
                expands: false,
                decoration: InputDecoration(
                    labelText: TTexts.password,
                    prefixIcon: const Icon(Iconsax.password_check),
                    suffixIcon: IconButton(
                        onPressed: ()=>controller.hidePassword.value = !controller.hidePassword.value,
                        icon: Icon(controller.hidePassword.value ?Iconsax.eye_slash : Iconsax.eye),
                    )
                ),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwSections),
            const TTermsAndConditions(),
            const SizedBox(height: TSizes.spaceBtwSections),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () => controller.signup(),
                  child: const Text(TTexts.createAccount)),
            ),
          ],
        ));
  }
}

