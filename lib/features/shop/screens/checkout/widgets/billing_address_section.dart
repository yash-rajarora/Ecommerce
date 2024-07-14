import 'package:ecom/Utils/constants/sizes.dart';
import 'package:ecom/common/widget/texts/section_heading.dart';
import 'package:flutter/material.dart';

class TBillingAddressSection extends StatelessWidget {
  const TBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TSectionHeading(title: 'Shipping Address',buttonTitle: 'Change',onPressed: (){}),
        Text('Yash Raj Arora',style: Theme.of(context).textTheme.bodyLarge),
        const SizedBox(height: TSizes.spaceBtwItems/2),
        Row(
          children: [
            const Icon(Icons.phone,color: Colors.grey,size: 16),
            const SizedBox(width: TSizes.spaceBtwItems),
            Text('+91 9635577966',style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems/2),
        Row(
          children: [
            const Icon(Icons.location_history,color: Colors.grey,size: 16),
            const SizedBox(width: TSizes.spaceBtwItems),
            Text('Janak Marg, Chitrakoot, Jaipur',style: Theme.of(context).textTheme.bodyMedium,softWrap: true),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems/2),

      ],
    );
  }
}
