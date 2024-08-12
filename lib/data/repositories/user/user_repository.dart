import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecom/Utils/exceptions/firebase_exceptions.dart';
import 'package:ecom/Utils/exceptions/format_exceptions.dart';
import 'package:ecom/Utils/exceptions/platform_exceptions.dart';
import 'package:ecom/features/personalization/models/user_model.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find<UserRepository>();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db.collection("Users").doc(user.id).set(user.toJson());
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      // Consider using a logging package for better error reporting.
      print('An unexpected error occurred: $e');
      rethrow; // Rethrow the error if you want the calling function to handle it.
    }
  }
}
