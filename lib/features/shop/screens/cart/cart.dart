import 'package:ecom/Utils/constants/sizes.dart';
import 'package:ecom/common/widget/appbar/appbar.dart';
import 'package:ecom/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:ecom/features/shop/screens/checkout/checkout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(
          'Cart',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: TCartItems(),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(onPressed: ()=> Get.to(()=> const CheckoutScreen()), child: const Text('Checkout \$256.0')),
      ),
    );
  }
}




