import 'package:ecom/Utils/constants/sizes.dart';
import 'package:ecom/common/widget/appbar/appbar.dart';
import 'package:ecom/common/widget/custom_shapes/Container/primary_header_container.dart';
import 'package:ecom/common/widget/list_tiles/settings_menu_tile.dart';
import 'package:ecom/common/widget/list_tiles/user_profile_tile.dart';
import 'package:ecom/common/widget/texts/section_heading.dart';
import 'package:ecom/data/repositories/authentication/authentication_repository.dart';
import 'package:ecom/features/personalization/screens/address/address.dart';
import 'package:ecom/features/personalization/screens/settings/widgets/load_data.dart';
import 'package:ecom/features/shop/screens/cart/cart.dart';
import 'package:ecom/features/shop/screens/order/order.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Header
            TPrimaryHeaderContainer(
                child: Column(
              children: [
                TAppBar(
                    title: Text('Account',
                        style: Theme.of(context).textTheme.headlineMedium)),
                const TUserProfileTile(),
                const SizedBox(height: TSizes.spaceBtwSections),
              ],
            )),

            /// Body
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  const TSectionHeading(
                      title: 'Account Settings', showActionButton: false),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  TSettingsMenuTile(
                      icon: Iconsax.safe_home,
                      onTap: ()=> Get.to(()=> const UserAddressScreen()),
                      title: 'My Addresses',
                      subTitle: 'Set shopping delivery address'),
                  TSettingsMenuTile(
                      onTap: ()=> Get.to(()=> const CartScreen()),
                      icon: Iconsax.shopping_cart,
                      title: 'My Cart ',
                      subTitle: 'Add, remove products and move to checkout'),
                  TSettingsMenuTile(
                      onTap: ()=> Get.to(()=> const OrderScreen()),
                      icon: Iconsax.bag_tick,
                      title: 'My Orders',
                      subTitle: 'In-progress and Completed Orders'),
                  const TSettingsMenuTile(
                      icon: Iconsax.bank,
                      title: 'Bank Account',
                      subTitle: 'Withdraw balance to registered bank account'),
                  const TSettingsMenuTile(
                      icon: Iconsax.discount_shape,
                      title: 'My Coupons',
                      subTitle: 'List of all the discounted coupons'),
                  const TSettingsMenuTile(
                      icon: Iconsax.notification,
                      title: 'Notifications',
                      subTitle: 'Set any kind of notification message'),
                  const TSettingsMenuTile(
                      icon: Iconsax.security_card,
                      title: 'Account Privacy',
                      subTitle: 'Manage data usage and connected accounts'),
                  const SizedBox(height: TSizes.spaceBtwSections),
                  const TSectionHeading(
                      title: 'App Settings', showActionButton: false),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  TSettingsMenuTile(
                      icon: Iconsax.document_upload,
                      title: 'Load Data',
                      subTitle: 'Upload Data to your Cloud Firebase',
                      onTap: ()=> Get.to(()=> const LoadDataScreen()),
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.location,
                    title: 'Geolocation',
                    subTitle: 'Set recommendation based on location',
                    trailing: Switch(value: true, onChanged: (value) {}),
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.location,
                    title: 'Safe Mode',
                    subTitle: 'Search result is safe for all ages',
                    trailing: Switch(value: false, onChanged: (value) {}),
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.location,
                    title: 'HD Image Quality',
                    subTitle: 'Set image quality to be seen',
                    trailing: Switch(value: false, onChanged: (value) {}),
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(onPressed: ()=>AuthenticationRepository.instance.logout(), child: Text('Logout')),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
