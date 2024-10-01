import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phone_book_app/data/repositories/home/home_repository.dart';
import 'package:phone_book_app/features/phone_book/controller/home/home_controller.dart';
import 'package:phone_book_app/features/phone_book/view/home/home_screen.dart';
import 'package:phone_book_app/utils/popups/status_snackbar.dart';

import '../../../../utils/constants/images_string.dart';
import '../../../../utils/helpers/network_manager.dart';
import '../../../../utils/popups/full_screen_loader.dart';

class EditContactController extends GetxController {
  static EditContactController get instance => Get.find();

  //? Variable
  final homeRepository = HomeRepository.instance;
  final homeController = HomeController.instance;
  final email = TextEditingController();
  final name = TextEditingController();
  final phoneNumber = TextEditingController();
  String? id;
  GlobalKey<FormState> addFormKey = GlobalKey<FormState>();


  void saveContact() async {
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
      if (!addFormKey.currentState!.validate()) {
        //? Remove Loader
        PFullScreenLoader.stopLoading();
        return;
      }

      await homeRepository.updateContact(
          id!, name.text, email.text, phoneNumber.text);
      homeController.fetchContacts();

      //? show success
      PLoaders.successSnackBar(
          title: "Succes", message: "Your contact success updated.");

      Get.off(() => HomeScreen());
    } catch (e) {
      //? Remove loader
      PFullScreenLoader.stopLoading();
      //? show some generic error
      PLoaders.errorSnackBar(title: 'Oh snap!', message: e.toString());
    }
  }
}
