import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecom/Utils/constants/enums.dart';
import 'package:ecom/data/Services/cloud_storage/firebase_storage_service.dart';
import 'package:ecom/features/shop/models/product_model.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ProductRepository extends GetxController {
  static ProductRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  ///Get featured Products
  Future<List<ProductModel>> getFeaturedProducts() async {
    try {
      final snapshot = await _db.collection('Products').where('IsFeatured',isEqualTo: true).limit(4).get();
      return snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
    } on FirebaseException catch (e) {
      throw e.message!;
    } on PlatformException catch (e) {
      throw e.message!;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  ///Upload Dummy Data
  Future<void> uploadDummyData(List<ProductModel> products) async {
    try {
      final storage = Get.put(TFirebaseStorageService());
      for (var product in products) {
        final thumbnail = await storage.getImageDataFromAssets(
            product.thumbnail);
        final url = await storage.uploadImageData(
            'Products/Images', thumbnail, product.thumbnail.toString());
        product.thumbnail = url!;

        if (product.images != null && product.images!.isNotEmpty) {
          List<String> imagesUrl = [];
          for (var image in product.images!) {
            final assetImage = await storage.getImageDataFromAssets(image);
            final url = await storage.uploadImageData(
                'Products/Images', assetImage, image);
            imagesUrl.add(url!);
          }
          product.images!.clear();
          product.images!.addAll(imagesUrl);
        }

        ///Upload Variations
        if (product.productType == ProductType.variable.toString()) {
          for (var variation in product.productVariations!) {
            final assetImage = await storage.getImageDataFromAssets(
                variation.image);
            final url = await storage.uploadImageData(
                'Products/Images', assetImage, variation.image);
            variation.image = url!;
          }
        }

        await _db.collection("Products").doc(product.id).set(product.toJson());
      }
    } on FirebaseException catch (e) {
      throw e.message!;
    } on PlatformException catch (e) {
      throw e.message!;
    } catch (e) {
      throw e.toString();
    }
  }
}