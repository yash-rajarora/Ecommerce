import 'package:ecom/Utils/constants/colors.dart';
import 'package:ecom/Utils/constants/image_strings.dart';
import 'package:ecom/Utils/constants/sizes.dart';
import 'package:ecom/Utils/helpers/helper_functions.dart';
import 'package:ecom/common/widget/custom_shapes/Container/rounded_container.dart';
import 'package:ecom/common/widget/texts/section_heading.dart';
import 'package:flutter/material.dart';

class TBillingPaymentSection extends StatelessWidget {
  const TBillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        TSectionHeading(title: 'Payment Method', buttonTitle: 'Change',onPressed: (){}),
        const SizedBox(height: TSizes.spaceBtwItems/2),
        Row(
          children: [
            TRoundedContainer(
              width: 60,
              height: 35,
              backgroundColor: dark ? TColors.light : TColors.white,
              padding: const EdgeInsets.all(TSizes.sm),
              child: const Image(image: AssetImage(TImages.paypal),fit: BoxFit.contain),
            ),
            const SizedBox(width: TSizes.spaceBtwItems/2),
            Text('Paypal',style: Theme.of(context).textTheme.bodyLarge),
          ],
        )
      ],
    );
  }
}
