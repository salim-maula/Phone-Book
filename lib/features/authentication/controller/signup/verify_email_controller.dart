import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:phone_book_app/utils/constants/text_string.dart';

import '../../../../common/widgets/success_screen/success_screen.dart';
import '../../../../data/repositories/authentication/authentication_repository.dart';
import '../../../../utils/constants/images_string.dart';
import '../../../../utils/popups/status_snackbar.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  //? Verivy email whenever verivy screen appears & set timer for auto redirect
  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }

  //? send Email verivication link
  sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      PLoaders.successSnackBar(
          title: 'Email Sent',
          message: 'Please Check your inbox and verify your email.');
    } catch (e) {
      PLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  //? Timer to automatically redirect on Email verivication
  setTimerForAutoRedirect() {
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if (user?.emailVerified ?? false) {
        timer.cancel();
        Get.off(() => SuccessScreen(
            image: PImages.successVerify,
            title: PTexts.titleSuccessVerify,
            subTitle: PTexts.subTitleSuccessVerify,
            onPressed: () =>
                AuthenticationRepository.instance.screenRedirect()));
      }
    });
  }

  //? Manually Check if Email verified
  checkEmailVerificationStatus() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null && currentUser.emailVerified) {
      Get.off(() => SuccessScreen(
          image: PImages.successVerify,
          title: PTexts.titleSuccessVerify,
          subTitle: PTexts.subTitleSuccessVerify,
          onPressed: () => AuthenticationRepository.instance.screenRedirect()));
    }else{
      PLoaders.successSnackBar(
          title: 'Check Email',
          message: 'Please Check your inbox and verify your email.');
    }
  }
}
