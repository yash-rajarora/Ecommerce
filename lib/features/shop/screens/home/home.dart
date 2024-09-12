import 'package:ecom/Utils/constants/sizes.dart';
import 'package:ecom/Utils/constants/text_strings.dart';
import 'package:ecom/common/widget/custom_shapes/Container/primary_header_container.dart';
import 'package:ecom/common/widget/custom_shapes/Container/search_container.dart';
import 'package:ecom/common/widget/layouts/grid_layout.dart';
import 'package:ecom/common/widget/product/product_cards/product_card_vertical.dart';
import 'package:ecom/common/widget/shimmers/vertical_product_shimmer.dart';
import 'package:ecom/common/widget/texts/section_heading.dart';
import 'package:ecom/features/shop/controllers/product_controller.dart';
import 'package:ecom/features/shop/screens/all_products/all_products.dart';
import 'package:ecom/features/shop/screens/home/widget/home_appbar.dart';
import 'package:ecom/features/shop/screens/home/widget/home_categories.dart';
import 'package:ecom/features/shop/screens/home/widget/promo_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const TPrimaryHeaderContainer(
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
                  ),
                  SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  const TPromoSlider(),
                  const SizedBox(height: TSizes.spaceBtwSections),
                  TSectionHeading(
                      title: TTexts.popularProducts,
                      onPressed: () => Get.to(() => const AllProducts())),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  Obx(
                      () {
                        if(controller.isLoading.value) return const TVerticalProductShimmer();
                        if(controller.featuredProducts.isEmpty){
                          return Center(child: Text('No data Found!', style: Theme.of(context).textTheme.bodyMedium));
                        }
                        return TGridLayout(
                            itemCount: controller.featuredProducts.length,
                            itemBuilder: (_,
                                index) => TProductCardVertical(product:controller.featuredProducts[index]));
                      }),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
