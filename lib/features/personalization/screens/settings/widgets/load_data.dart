import 'package:ecom/Utils/constants/sizes.dart';
import 'package:ecom/common/widget/appbar/appbar.dart';
import 'package:ecom/common/widget/list_tiles/settings_menu_tile.dart';
import 'package:ecom/data/dummydata/dummy_data.dart';
import 'package:ecom/data/repositories/banners/banner_repository.dart';
import 'package:ecom/data/repositories/categories/category_repository.dart';
import 'package:ecom/data/repositories/product/product_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class LoadDataScreen extends StatelessWidget {
  const LoadDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(
        showBackArrow: true,
        title: Text('Load Data'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            Column(
              children: [
                TSettingsMenuTile(
                    icon: Iconsax.document_upload,
                    onTap: () async {
                        try {
                        await CategoryRepository.instance.uploadDummyData(TDummyData.categories);
                        Get.snackbar('Success', 'Dummy data uploaded successfully!');
                        } catch (e) {
                        Get.snackbar('Error', e.toString());
                        }
                    },
                    title: 'Load Categories',
                    subTitle: 'Upload the Categories Dummy data'
                ),
                TSettingsMenuTile(
                    icon: Iconsax.document_upload,
                    onTap: () async {
                      try{
                        await BannerRepository.instance.uploadDummyData(TDummyData.banners);
                        Get.snackbar('Success', 'Dummy Data Uploaded');
                      } catch(e){
                        Get.snackbar('Error', e.toString());
                      }
                    },
                    title: 'Load Banners',
                    subTitle: 'Upload the Banners Dummy data'
                ),
                TSettingsMenuTile(
                    icon: Iconsax.document_upload,
                    onTap: () async {
                      try{
                        await ProductRepository.instance.uploadDummyData(TDummyData.products);
                        Get.snackbar('Success', 'Dummy Data Uploaded');
                      } catch(e){
                        Get.snackbar('Error', e.toString());
                      }
                    },
                    title: 'Load Products',
                    subTitle: 'Upload the Categories Dummy data'
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
