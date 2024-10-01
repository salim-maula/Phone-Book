import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phone_book_app/data/repositories/home/home_repository.dart';

import '../../../../utils/constants/images_string.dart';
import '../../../../utils/popups/full_screen_loader.dart';
import '../../../../utils/popups/status_snackbar.dart';

class HomeController extends GetxController {
  static HomeController get instance => Get.find();

  //? Variable
  final homeRepository = Get.put(HomeRepository());
  var userData = {}.obs;
  var contactsList = <Map<String, dynamic>>[].obs;
  RxString name = "".obs;
  TextEditingController searchController = TextEditingController();
  FocusNode searchFocus = FocusNode();
  RxString searchQuery = "".obs;
  var filteredContactsList = <Map<String, dynamic>>[].obs;

  void fetchUserDetails() async {
    final fetchedData = await homeRepository.fetchUserDetails();
    userData.value = fetchedData.toJson();
  }

  void fetchContacts() async {
    final fetchedContacts = await homeRepository.getContacts();
    contactsList.value = fetchedContacts;
  }

  void deleteContact(String id) async {
    PFullScreenLoader.openLoadingDialog(PImages.loaderAnimation);

    final isDeleted = await homeRepository.deleteContact(id);

    if (isDeleted) {
      fetchContacts();
      PFullScreenLoader.stopLoading();
      PLoaders.successSnackBar(
          title: "Succes", message: "Your contact success delete");
    } else {
      PFullScreenLoader.stopLoading();
      PLoaders.errorSnackBar(
          title: "Error", message: "Error, your contact can't be deleted");
    }
  }

  //? Search Contacts
  void searchContacts(String query) {
    searchQuery.value = query;

    if (query.isEmpty) {
      filteredContactsList.value =
          contactsList; 
    } else {
      filteredContactsList.value = contactsList.where((contact) {
        final nameLower = contact['Name'].toLowerCase();
        final searchLower = query.toLowerCase();
        return nameLower.contains(searchLower);
      }).toList(); 
    }
  }

  @override
  void onReady() {
    searchContacts('');
    super.onReady();
  }

  @override
  void onInit() {
    fetchContacts();
    fetchUserDetails();
    super.onInit();
  }
}
