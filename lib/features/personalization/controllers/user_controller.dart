import 'package:ecom/Utils/popup/loaders.dart';
import 'package:ecom/data/repositories/user/user_repository.dart';
import 'package:ecom/features/authentications/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final userRepository = Get.put(UserRepository());

  Future<void> saveUserRecord(UserCredential? userCredentials) async {
    try {
      if (userCredentials != null) {
        final nameParts = UserModel.nameParts(
            userCredentials.user!.displayName ?? '');
        final username = UserModel.generateUsername(
            userCredentials.user!.displayName ?? '');

        final newUser = UserModel(
            id: userCredentials.user!.uid,
            firstName: nameParts[0],
            lastName: nameParts.length>1?nameParts.sublist(1).join(' '): ' ',
            username: username ,
            email: userCredentials.user!.email??'',
            phoneNumber: userCredentials.user!.phoneNumber??'',
            profilePicture: userCredentials.user!.photoURL??'',
        );

        await userRepository.saveUserRecord(newUser);
      }
    } catch (e) {
      TLoaders.warningSnackBar(title: 'Data not saved',
          message: 'Something went wrong while saving your information. You can re-save your data in your Profile.');
    }
  }
}