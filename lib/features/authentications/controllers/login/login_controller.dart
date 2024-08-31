import 'package:ecom/Utils/constants/image_strings.dart';
import 'package:ecom/Utils/helpers/network_manager.dart';
import 'package:ecom/Utils/popup/full_screen_loader.dart';
import 'package:ecom/Utils/popup/loaders.dart';
import 'package:ecom/data/repositories/authentication/authentication_repository.dart';
import 'package:ecom/features/personalization/controllers/user_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final userController = Get.put(UserController());

  @override
  void onInit() {
    email.text = localStorage.read('REMEMBER_ME_EMAIL') ?? '';
    password.text = localStorage.read('REMEMBER_ME_PASSWORD') ?? '';
    super.onInit();
  }
  ///Email and password signin
  Future<void> emailAndPasswordSignIn() async{
    try{
      TFullScreenLoader.openLoadingDialog('Logging you in...', TImages.docerAnimation);
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected){
        TFullScreenLoader.stopLoading();
        return;
      }
      if(!loginFormKey.currentState!.validate()){
        TFullScreenLoader.stopLoading();
        return;
      }
      if(rememberMe.value){
        localStorage.write('REMEMBER_ME_EMAIL',email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD',password.text.trim());
      }
      final userCredentials = await AuthenticationRepository.instance.loginWithEmailAndPassword(email.text.trim(), password.text.trim());
      TFullScreenLoader.stopLoading();
      AuthenticationRepository.instance.screenRedirect();
    } catch(e){
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap',message: e.toString());
    }
  }

  ///Google Signin
  Future<void> googleSignIn() async{
    try{
      TFullScreenLoader.openLoadingDialog('Logging you in.....', TImages.docerAnimation);
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected){
        TFullScreenLoader.stopLoading();
        return;
      }

      final userCredentials = await AuthenticationRepository.instance.signInWithGoogle();

      // Ensure userCredentials is not null before proceeding
      if (userCredentials != null) {
        await userController.saveUserRecord(userCredentials);
        AuthenticationRepository.instance.screenRedirect();
      } else {
        TFullScreenLoader.stopLoading();
        TLoaders.errorSnackBar(title: 'Sign-In Failed', message: 'No user credentials returned.');
      }
    }catch(e){
      TLoaders.errorSnackBar(title: 'Oh Snap',message: e.toString());
    }
  }
}