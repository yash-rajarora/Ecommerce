import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecom/Utils/constants/colors.dart';
import 'package:ecom/Utils/constants/sizes.dart';
import 'package:ecom/common/widget/custom_shapes/Container/circular_container.dart';
import 'package:ecom/common/widget/images/t_rounded_image.dart';
import 'package:ecom/common/widget/shimmers/shimmer.dart';
import 'package:ecom/features/shop/controllers/banner_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TPromoSlider extends StatelessWidget {
  const TPromoSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BannerController());
    return Obx(
          (){
            if(controller.isLoading.value){
              return const TShimmerEffect(width: double.infinity, height: 190);
            }
            if(controller.banners.isEmpty){
              return const Center(child:Text('No Data Found'));
            }
            else{
              return Column(
                children: [
                  CarouselSlider(
                    items: controller.banners.map((banner) =>
                        TRoundedImage(
                          imageUrl: banner.imageUrl,
                          isNetworkImage: true,
                          onPressed:()=> Get.toNamed(banner.targetScreen),
                        ),
                    ).toList(),
                    options: CarouselOptions(
                      onPageChanged: (index, _) => controller.updatePageIndicator(index),
                      viewportFraction: 1,
                    ),
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  Center(
                    child: Obx(
                          () =>
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              for (int i = 0; i < controller.banners.length; i++)
                                TCircularContainer(
                                  width: 20,
                                  height: 4,
                                  backgroundColor: controller.carouselCurrentIndex
                                      .value == i
                                      ? TColors.primary
                                      : TColors.grey,
                                  margin: const EdgeInsets.only(right: 10),
                                ),
                            ],
                          ),
                    ),
                  )
                ],
              );
            }
          },
    );
  }
}
