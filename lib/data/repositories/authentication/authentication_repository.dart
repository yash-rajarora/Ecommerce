import 'package:ecom/Utils/exceptions/firebase_auth_exceptions.dart';
import 'package:ecom/Utils/exceptions/firebase_exceptions.dart';
import 'package:ecom/Utils/exceptions/format_exceptions.dart';
import 'package:ecom/Utils/exceptions/platform_exceptions.dart';
import 'package:ecom/features/authentications/screens/login/login.dart';
import 'package:ecom/features/authentications/screens/onboarding/onboarding.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  screenRedirect() async {
    deviceStorage.writeIfNull('isFirstTime', true);
    deviceStorage.read('isFirstTime') != true
        ? Get.offAll(() => const LoginScreen())
        : Get.offAll(const OnBoardingScreen());
  }

  // ------------ Email & Password signin --------------
  /// SignIn

  /// Register
  Future<UserCredential> registerWithEmailAndPassword(String email, String password) async{
    try{
      return await _auth.createUserWithEmailAndPassword(email: email, password: password);
    }on FirebaseAuthException catch(e){
      throw TFirebaseAuthException(e.code).message;
    }on FirebaseException catch(e){
      throw TFirebaseException(e.code).message;
    }on FormatException catch(_){
      throw const TFormatException();
    }on PlatformException catch(e){
      throw TPlatformException(e.code).message;
    } catch(e){
      throw 'Something went wrong. Please try again';
    }
  }

  /// Email-verification

  /// ReAuthenticate User

  /// Forget Password

  // ------------ Social Login --------------
  ///Google

  ///Facebook

  // ------------ Logout and delete --------------
  ///Logout

  ///delete
}
