
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../data/repositories/authentication/authentication_repository.dart';
import '../../../../utils/constants/images_string.dart';
import '../../../../utils/helpers/network_manager.dart';
import '../../../../utils/popups/full_screen_loader.dart';
import '../../../../utils/popups/status_snackbar.dart';

class LoginController extends GetxController {
  //? Variable
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  

  @override
  void onInit() {
    if (localStorage.read('REMEMBER_ME_EMAIL').toString() != "null" &&
        localStorage.read('REMEMBER_ME_PASSWORD').toString() != "null") {
      email.text = localStorage.read('REMEMBER_ME_EMAIL').toString();
      password.text = localStorage.read('REMEMBER_ME_PASSWORD').toString();
    }

    super.onInit();
  }

  //? Email and Password Signin
  Future<void> emailPasswordSignIn() async {
    try {
      //? Start Loading
      PFullScreenLoader.openLoadingDialog(
          PImages.loaderAnimation);

      //? Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        PFullScreenLoader.stopLoading();
        return;
      }

      //? Form Validation
      if (!loginFormKey.currentState!.validate()) {
        PFullScreenLoader.stopLoading();
        return;
      }

      //? Save Data if Remember me Is Selected
      if (rememberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }

      //? Login user using EMail & Password Authenticaton
      final userCredential = await AuthenticationRepository.instance
          .loginWithEmainlAndPassword(email.text.trim(), password.text.trim());

      //? Remove Loader
      PFullScreenLoader.stopLoading();

      //? Redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      PFullScreenLoader.stopLoading();
      PLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }
}
