import 'package:ecom/common/widget/image_text_widget/vertical_image_text.dart';
import 'package:ecom/common/widget/shimmers/category_shimmer.dart';
import 'package:ecom/features/shop/controllers/category_controller.dart';
import 'package:ecom/features/shop/screens/sub_category/sub_categories.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class THomeCategories extends StatelessWidget {
  const THomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryController());
    return Obx(() {
      if(controller.isLoading.value) return const TCategoryShimmer() ;
      if(controller.featuredCategories.isEmpty){
        return Center(
          child: Text(
            'No Data Found',
            style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white),
          ),
        );
      }
      return SizedBox(
        height: 80,
        child: ListView.builder(
          itemCount: controller.featuredCategories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            final category = controller.featuredCategories[index];
            return TVerticalImageText(
              image: category.image,
              title: category.name,
              onTap: () => Get.to(() => const SubCatergoriesScreen()),
            );
          },
        ),
      );
    });
  }
}
