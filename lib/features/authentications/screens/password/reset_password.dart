import 'package:ecom/Utils/constants/image_strings.dart';
import 'package:ecom/Utils/constants/sizes.dart';
import 'package:ecom/Utils/constants/text_strings.dart';
import 'package:ecom/Utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: ()=>Get.back(), icon: Icon(CupertinoIcons.clear))
        ],
      ),
      body:SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              ///Image
              Image(image: AssetImage(TImages.deliveredEmailIllustration),width: THelperFunctions.screenWidth()*0.6),
              SizedBox(height: TSizes.spaceBtwSections),

              ///Title
              Text(TTexts.changeYourPasswordTitle, style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: TSizes.spaceBtwItems),
              Text(TTexts.changeYourPasswordSubTitle,style: Theme.of(context).textTheme.labelLarge),
              const SizedBox(height: TSizes.spaceBtwSections ),

              ///Button
              SizedBox(width:double.infinity,child: ElevatedButton(onPressed: (){}, child: const Text(TTexts.done))),

            ],
          ),
        ),
      ),
    );
  }
}
