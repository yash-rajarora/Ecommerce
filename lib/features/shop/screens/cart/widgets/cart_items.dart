import 'package:ecom/Utils/constants/sizes.dart';
import 'package:ecom/common/widget/product/cart/add_remove_button.dart';
import 'package:ecom/common/widget/product/cart/cart_item.dart';
import 'package:ecom/common/widget/texts/product_price_text.dart';
import 'package:flutter/material.dart';

class TCartItems extends StatelessWidget {
  const TCartItems({
    super.key, this.showAddRemoveButtons = true,
  });

  final bool showAddRemoveButtons;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (_, __) =>
      const SizedBox(height: TSizes.spaceBtwSections),
      itemCount: 2,
      itemBuilder: (_, index) => Column(
        children: [
          const TCartItem(),
          if(showAddRemoveButtons) const SizedBox(height: TSizes.spaceBtwItems),
          if(showAddRemoveButtons) const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(width: 70),
                  TProductQuantityWithAddRemove(),
                ],
              ),
              TProductPriceText(price: '256')
            ],
          )
        ],
      ),
    );
  }
}