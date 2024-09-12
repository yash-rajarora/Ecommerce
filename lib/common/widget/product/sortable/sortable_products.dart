import 'package:ecom/Utils/constants/sizes.dart';
import 'package:ecom/common/widget/layouts/grid_layout.dart';
import 'package:ecom/common/widget/product/product_cards/product_card_vertical.dart';
import 'package:ecom/features/shop/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TSortableProducts extends StatelessWidget {
  const TSortableProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ///Dropdown
        DropdownButtonFormField(
          decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
          onChanged: (value) {},
          items: [
            'Name','Higher Price','Lower Price','Sale','Newest','Popularity'
          ].map((option) => DropdownMenuItem(value:option,child: Text(option))).toList(),
        ),
        const SizedBox(height: TSizes.spaceBtwSections),

        ///Products
        TGridLayout(itemCount: 10, itemBuilder: (_,index)=> TProductCardVertical(product: ProductModel.empty()))
      ],
    );
  }
}

