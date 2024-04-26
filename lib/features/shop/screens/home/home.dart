import 'package:ecom/Utils/constants/image_strings.dart';
import 'package:ecom/Utils/constants/sizes.dart';
import 'package:ecom/Utils/constants/text_strings.dart';
import 'package:ecom/common/widget/custom_shapes/Container/primary_header_container.dart';
import 'package:ecom/common/widget/custom_shapes/Container/search_container.dart';
import 'package:ecom/common/widget/layouts/grid_layout.dart';
import 'package:ecom/common/widget/product/product_cards/product_card_vertical.dart';
import 'package:ecom/common/widget/texts/section_heading.dart';
import 'package:ecom/features/shop/screens/home/widget/home_appbar.dart';
import 'package:ecom/features/shop/screens/home/widget/home_categories.dart';
import 'package:ecom/features/shop/screens/home/widget/promo_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  THomeAppBar(),
                  SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  TSearchContainer(
                    text: 'Search in Store',
                  ),
                  SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: TSizes.defaultSpace),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TSectionHeading(
                          title: 'Popular Catgories',
                          showActionButton: false,
                        ),
                        SizedBox(
                          height: TSizes.spaceBtwItems,
                        ),
                        THomeCategories()
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  TPromoSlider(
                    banner: [
                      TImages.promoBanner1,
                      TImages.promoBanner2,
                      TImages.promoBanner3,
                    ],
                  ),
                  SizedBox(height: TSizes.spaceBtwSections),
                  TSectionHeading(title: TTexts.popularProducts,onPressed: (){}),
                  SizedBox(height:TSizes.spaceBtwItems),
                  TGridLayout(itemCount: 4,itemBuilder: (_,index) => TProductCardVertical()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


