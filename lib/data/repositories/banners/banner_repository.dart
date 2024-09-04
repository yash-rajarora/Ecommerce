import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecom/Utils/exceptions/firebase_exceptions.dart';
import 'package:ecom/Utils/exceptions/format_exceptions.dart';
import 'package:ecom/Utils/exceptions/platform_exceptions.dart';
import 'package:ecom/data/Services/cloud_storage/firebase_storage_service.dart';
import 'package:ecom/features/shop/models/banner_model.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class BannerRepository extends GetxController{
  static BannerRepository get instance=>Get.find();

  final _db = FirebaseFirestore.instance;

  ///Get all order
  Future<List<BannerModel>> fetchBanners() async{
    try{
      final result = await _db.collection('Banners').where('Active',isEqualTo: true).get();
      return result.docs.map((documentSnapshot) => BannerModel.fromSnapshot(documentSnapshot)).toList();
    }on FirebaseException catch(e){
      throw TFirebaseException(e.code).message;
    }on FormatException catch(_){
      throw const TFormatException();
    } on PlatformException catch(e){
      throw TPlatformException(e.code).message;
    } catch (e){
      throw "Something went wrong while fetching Banners.";
    }
  }

  /// Upload banners
  Future<void> uploadDummyData(List<BannerModel> banners) async {
    try {
      final storage = Get.put(TFirebaseStorageService());
      for (var banner in banners) {
        final file = await storage.getImageDataFromAssets(banner.imageUrl);
        final url = await storage.uploadImageData(
            'Banners', file, banner.imageUrl);
        banner.imageUrl = url!;
        final docRef = _db.collection("Banners").doc();
        await docRef.set(banner.toJson());
      }
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again: ${e.toString()}';  // Improved error message
    }
  }


}