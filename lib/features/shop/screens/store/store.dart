import 'package:ecom/Utils/constants/colors.dart';
import 'package:ecom/Utils/constants/sizes.dart';
import 'package:ecom/Utils/helpers/helper_functions.dart';
import 'package:ecom/common/widget/brands/TBrandCard.dart';
import 'package:ecom/common/widget/appbar/appbar.dart';
import 'package:ecom/common/widget/appbar/tabbar.dart';
import 'package:ecom/common/widget/custom_shapes/Container/search_container.dart';
import 'package:ecom/common/widget/layouts/grid_layout.dart';
import 'package:ecom/common/widget/product/cart/cart_menu_icon.dart';
import 'package:ecom/common/widget/texts/section_heading.dart';
import 'package:ecom/features/shop/screens/store/widgets/category_tab.dart';
import 'package:flutter/material.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: TAppBar(
          title:
              Text('Store', style: Theme.of(context).textTheme.headlineMedium),
          actions: [
            TCartCounterIcon(onPressed: () {}),
          ],
        ),
        body: NestedScrollView(
            headerSliverBuilder: (_, innerBoxScrolled) {
              return [
                SliverAppBar(
                    automaticallyImplyLeading: false,
                    pinned: true,
                    floating: true,
                    backgroundColor: THelperFunctions.isDarkMode(context)
                        ? TColors.black
                        : TColors.white,
                    expandedHeight: 440,
                    flexibleSpace: Padding(
                      padding: const EdgeInsets.all(TSizes.defaultSpace),
                      child: ListView(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          const SizedBox(height: TSizes.spaceBtwItems),
                          const TSearchContainer(
                              text: 'Search in store',
                              showBorder: true,
                              showBackground: false,
                              padding: EdgeInsets.zero),
                          const SizedBox(height: TSizes.spaceBtwSections),
                          TSectionHeading(
                            title: 'Featured Brands',
                            onPressed: () {},
                          ),
                          const SizedBox(height: TSizes.spaceBtwItems / 1.5),
                          TGridLayout(
                              itemCount: 4,
                              mainAxisExtent: 80,
                              itemBuilder: (_, index) {
                                return const TBrandCard(showBorder: true);
                              }),
                        ],
                      ),
                    ),
                    bottom: const TTabBar(tabs: [
                      Tab(child: Text('Sports')),
                      Tab(child: Text('Furniture')),
                      Tab(child: Text('Electronics')),
                      Tab(child: Text('Clothes')),
                      Tab(child: Text('Cosmetics'))
                    ])),
              ];
            },
            body: const TabBarView(
              children: [
                TCategoryTab(),
                TCategoryTab(),
                TCategoryTab(),
                TCategoryTab(),
                TCategoryTab(),
              ],
            )),
      ),
    );
  }
}


