import 'package:ecom/Utils/constants/image_strings.dart';
import 'package:ecom/Utils/constants/sizes.dart';
import 'package:ecom/common/widget/appbar/appbar.dart';
import 'package:ecom/common/widget/images/t_rounded_image.dart';
import 'package:ecom/common/widget/product/product_cards/product_card_horizontal.dart';
import 'package:ecom/common/widget/texts/section_heading.dart';
import 'package:flutter/material.dart';

class SubCatergoriesScreen extends StatelessWidget {
  const SubCatergoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(
        showBackArrow: true,
        title: Text(
          'Sports shirts',
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              const TRoundedImage(
                  imageUrl: TImages.promoBanner3,
                  width: double.infinity,
                  applyImageRadius: true),
              const SizedBox(height: TSizes.spaceBtwSections),
              Column(
                children: [
                  TSectionHeading(title: 'Sports Shirts', onPressed: () {}),
                  const SizedBox(height: TSizes.spaceBtwItems / 2),
                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                        itemCount: 4,
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (context,index)=>const SizedBox(width: TSizes.spaceBtwItems),
                        itemBuilder: (context, index) {
                          return const TProductCardHorizontal();
                        }),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
