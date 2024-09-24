import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecom/Utils/constants/colors.dart';
import 'package:ecom/Utils/helpers/helper_functions.dart';
import 'package:ecom/common/widget/appbar/appbar.dart';
import 'package:ecom/common/widget/custom_shapes/curved_edges_widget.dart';
import 'package:ecom/common/widget/icons/t_circular_icon.dart';
import 'package:ecom/common/widget/images/t_rounded_image.dart';
import 'package:ecom/features/shop/controllers/product/images_controller.dart';
import 'package:ecom/features/shop/models/product_model.dart';
import 'package:ecom/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TproductImageSlider extends StatelessWidget {
  const TproductImageSlider({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final controller = Get.put(ImagesController());
    final images = controller.getAllProductImages(product);
    return TCurvedEdgesWidget(
      child: Container(
        color: dark ? TColors.darkerGrey : TColors.light,
        child: Stack(
          children: [
            ///Main Image
            SizedBox(
              height: 400,
              child: Padding(
                padding: const EdgeInsets.all(TSizes.productImageRadius * 2),
                child: Center(child: Obx(() {
                  final image = controller.selectedProductImage.value;
                  return GestureDetector(
                    onTap: ()=> controller.showEnlargedImage(image),
                    child: CachedNetworkImage(
                      imageUrl: image,
                      progressIndicatorBuilder: (_, __, downloadProgress) =>
                          CircularProgressIndicator(
                              value: downloadProgress.progress,
                              color: TColors.primary),
                    ),
                  );
                })),
              ),
            ),

            ///Image Slider
            Positioned(
              right: 0,
              bottom: 30,
              left: TSizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  separatorBuilder: (_, __) =>
                      const SizedBox(width: TSizes.spaceBtwItems),
                  itemCount: images.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemBuilder: (_, index) => Obx(
                      (){
                        final imageSelected = controller.selectedProductImage.value==images[index];
                        return TRoundedImage(
                          isNetworkImage: true,
                          width: 80,
                          backgroundColor: dark ? TColors.dark : TColors.white,
                          border: Border.all(color: imageSelected ? TColors.primary : Colors.transparent),
                          padding: const EdgeInsets.all(TSizes.sm),
                          imageUrl: images[index],
                        );
                      }
                  ),
                ),
              ),
            ),
            const TAppBar(
              showBackArrow: true,
              actions: [
                TCircularIcon(
                  icon: Iconsax.heart5,
                  color: Colors.red,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
