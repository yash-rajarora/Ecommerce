import 'package:ecom/Utils/constants/image_strings.dart';
import 'package:ecom/Utils/helpers/network_manager.dart';
import 'package:ecom/Utils/popup/full_screen_loader.dart';
import 'package:ecom/Utils/popup/loaders.dart';
import 'package:ecom/data/repositories/authentication/authentication_repository.dart';
import 'package:ecom/features/authentications/screens/password/reset_password.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ForgetPasswordController extends GetxController{
  static ForgetPasswordController get instance => Get.find();

  final email = TextEditingController();
  GlobalKey<FormState>forgetPasswordFormKey = GlobalKey<FormState>();

  sendPasswordResetEmail()async{
    try{
      TFullScreenLoader.openLoadingDialog('Processing your request...', TImages.docerAnimation);
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected){
        TFullScreenLoader.stopLoading();
        return;
      }
      if(!forgetPasswordFormKey.currentState!.validate()){
        TFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance.sendPasswordResetEmail(email.text.trim());
      TFullScreenLoader.stopLoading();
      Get.to(()=>ResetPassword(email: email.text.trim()));
    }catch(e){
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap',message: e.toString());
    }
  }

  resendPasswordResetEmail(String email)async{
    try{
      TFullScreenLoader.openLoadingDialog('Processing your request...', TImages.docerAnimation);
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected){
        TFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance.sendPasswordResetEmail(email);
      TFullScreenLoader.stopLoading();
      TLoaders.successSnackBar(title: 'Email Sent' ,message: 'Email Link Sent to Reset your Password');
    }catch(e){
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap',message: e.toString());
    }
  }
}