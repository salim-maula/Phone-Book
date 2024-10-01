import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phone_book_app/data/repositories/authentication/authentication_repository.dart';
import 'package:phone_book_app/features/phone_book/controller/home/home_controller.dart';
import 'package:phone_book_app/features/phone_book/view/add/add_contact.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:phone_book_app/features/phone_book/view/edit/edit_screen.dart';
import 'package:phone_book_app/utils/constants/colors.dart';

import '../detail/detail_screen.dart';
import 'widgets/home_drawer_menu.dart';
import 'widgets/search_contact.dart';

class HomeScreen extends StatelessWidget {
  final controller = Get.put(HomeController());
  final instance = AuthenticationRepository.instance;

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PColors.neutral,
      appBar: AppBar(
        backgroundColor: PColors.neutral,
        centerTitle: true,
        title: const Text('My Contact'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Get.to(() => AddContactScreen());
              // Handle add contact action
            },
          ),
        ],
      ),
      drawer: HomeDrawerMenu(controller: controller, instance: instance),
      body: Obx(() {
        return controller.contactsList.isEmpty
            ? const Center(child: Text("Add contact firts"))
            : Column(
                children: [
                  //? Serarch widget
                  SearchContact(controller: controller),
                  Expanded(
                    child: Obx(() {
                      return controller.filteredContactsList.isEmpty
                          ? const Center(
                              child: Text(
                                  "No contacts found"), // Tampilkan pesan jika tidak ada hasil pencarian
                            )
                          : ListView.builder(
                              itemCount: controller.filteredContactsList.length,
                              itemBuilder: (context, index) {
                                final contact =
                                    controller.filteredContactsList[index];
                                return Slidable(
                                  key: ValueKey(contact),
                                  actionExtentRatio: 0.15,
                                  secondaryActions: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 16.0),
                                      child: IconSlideAction(
                                        onTap: () {
                                          controller.searchFocus.unfocus();
                                          controller.searchController.clear();
                                          controller.filteredContactsList
                                              .value = controller.contactsList;
                                          controller
                                              .deleteContact(contact['id']);
                                        },
                                        color: Colors.redAccent,
                                        icon: Icons
                                            .delete, // Adjust the flex value to control width
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 16.0),
                                      child: IconSlideAction(
                                        onTap: () {
                                          controller.searchController.clear();
                                          controller.filteredContactsList
                                              .value = controller.contactsList;
                                          Get.to(() => EditContactScreen(
                                              id: contact['id'],
                                              name: contact['Name'],
                                              email: contact['Email'],
                                              phoneNumber:
                                                  contact['PhoneNumber']));
                                        },
                                        color: Colors.green,
                                        icon: Icons
                                            .edit, // Adjust the flex value to control width
                                      ),
                                    ),
                                  ],
                                  actionPane: const SlidableBehindActionPane(),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ListTile(
                                      tileColor: Colors.white,
                                      title: Text(contact['Name']),
                                      subtitle: Text(contact['PhoneNumber']),
                                      trailing: const Icon(
                                        Icons.chevron_right_rounded,
                                        color: PColors.border,
                                      ),
                                      leading: const CircleAvatar(
                                        backgroundColor: PColors.border,
                                        child: Icon(Icons.account_circle),
                                      ),
                                      onTap: () {
                                        Get.to(() => DetailScreen(
                                            contactName: contact['Name'],
                                            phoneNumber: contact['PhoneNumber'],
                                            emailAddress: contact['Email']));
                                      },
                                    ),
                                  ),
                                );
                              },
                            );
                    }),
                  ),
                ],
              );
      }),
    );
  }
}

