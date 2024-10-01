import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phone_book_app/utils/constants/images_string.dart';
import 'package:phone_book_app/utils/popups/status_snackbar.dart';

import '../../../../data/repositories/authentication/authentication_repository.dart';
import '../../../../data/repositories/user/user_repository.dart';
import '../../../../utils/helpers/network_manager.dart';
import '../../../../utils/popups/full_screen_loader.dart';
import '../../model/user_model.dart';
import '../../view/signup/verify_email_screen.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  //? Variables
  final hidePassword = true.obs;
  final privacyPolicy = true.obs;
  final email = TextEditingController();
  final name = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  final phoneNumber = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  //? SIGNUP
  void signup() async {
    try {
      //? start leading
      PFullScreenLoader.openLoadingDialog(PImages.loaderAnimation);

      //? check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        //? Remove Loader
        PFullScreenLoader.stopLoading();
        return;
      }

      //?form validation
      if (!signupFormKey.currentState!.validate()) {
        //? Remove Loader
        PFullScreenLoader.stopLoading();
        return;
      }

      //?privacy policy check
      if (!privacyPolicy.value) {
        PFullScreenLoader.stopLoading();

        PLoaders.warningSnackBar(
            title: 'Accept Privacy Policy',
            message:
                "in order to create account, you must have to read and accept the privacy policy & terms of us");

        return;
      }

      //?register user in the firebase authentiation
      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());

      //? save authenticator
      final newUser = UserModel(
        id: userCredential.user!.uid,
        name: name.text.trim(),
        username: username.text.trim(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
      );

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      //? show success
      PLoaders.successSnackBar(
          title: "Congratulations",
          message: "Your account have been created! Verivy email to continue.");

      //?move to ferivy email
      Get.to(() => VerifyEmailScreen(
            email: email.text.trim(),
          ));
    } catch (e) {
      //? Remove loader
      PFullScreenLoader.stopLoading();

      //? show some generic error
      PLoaders.errorSnackBar(title: 'Oh snap!', message: e.toString());
    }
  }
}
