import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../data/repositories/authentication/authentication_repository.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/images_string.dart';
import '../../../controller/home/home_controller.dart';

class HomeDrawerMenu extends StatelessWidget {
  const HomeDrawerMenu({
    super.key,
    required this.controller,
    required this.instance,
  });

  final HomeController controller;
  final AuthenticationRepository instance;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: PColors.neutral,
      surfaceTintColor: PColors.neutral,
      child: Column(
        children: <Widget>[
          Obx(() {
            return UserAccountsDrawerHeader(
              decoration: const BoxDecoration(color: PColors.neutral),
              accountName: Text(
                controller.userData['Name'],
                style: const TextStyle(color: Colors.black),
              ),
              accountEmail: Text(controller.userData['Email'],
                  style: const TextStyle(color: Colors.black)),
              currentAccountPicture: Image.asset(PImages.logo), //
            );
          }),
          const Spacer(),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 24),
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                instance.logout();
              },
              child: const Text("Logout"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  'App Version V.0.0.1',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                Text(
                  '© 2024 By Salim - Teepee ',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}