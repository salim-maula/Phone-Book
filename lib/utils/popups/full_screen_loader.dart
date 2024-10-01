import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:phone_book_app/utils/constants/images_string.dart';

class PFullScreenLoader {
  static void openLoadingDialog( String animation) {
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false,
      builder: (_) => PopScope(
        child: Container(
          color: Colors.black.withOpacity(0.7),
          width: double.infinity,
          height: double.infinity,
          child: Center(
            child:
                Lottie.asset(PImages.loaderAnimation, width: 100, height: 100),
          ),
        ),
      ),
    );
  }

  static stopLoading() {
    Navigator.of(Get.overlayContext!).pop();
  }
}
