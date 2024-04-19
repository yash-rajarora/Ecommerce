import 'package:ecom/Utils/constants/image_strings.dart';
import 'package:ecom/common/widget/image_text_widget/vertical_image_text.dart';
import 'package:flutter/material.dart';

class THomeCategories extends StatelessWidget {
  const THomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        itemCount: 6,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          return TVerticalImageText(
            image: TImages.shoeIcon,
            title: 'shoes',
            onTap: (){},
          );
        },
      ),
    );
  }
}