import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:phone_book_app/features/phone_book/controller/edit/edit_contact_controller.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/validators/validation.dart';

class EditContactScreen extends StatefulWidget {
  const EditContactScreen(
      {super.key,
      required this.id,
      required this.name,
      required this.email,
      required this.phoneNumber});

  final String id;
  final String name;
  final String email;
  final String phoneNumber;

  @override
  State<EditContactScreen> createState() => _EditContactScreenState();
}

class _EditContactScreenState extends State<EditContactScreen> {
  final controller = Get.put(EditContactController());

  @override
  void initState() {
    controller.name.text = widget.name;
    controller.email.text = widget.email;
    controller.phoneNumber.text = widget.phoneNumber;
    controller.id = widget.id;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PColors.neutral,
       appBar: AppBar(
        backgroundColor: PColors.neutral,
        centerTitle: true,
        title: const Text('Edit Contact'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(PSizes.defaultSpace),
          child: Form(
            key: controller.addFormKey,
            child: Column(
              children: [
                //? name
                TextFormField(
                  validator: (value) =>
                      PValidator.validatorEmptyText('Name', value),
                  controller: controller.name,
                  expands: false,
                  decoration: const InputDecoration(
                      labelText: "Name", prefixIcon: Icon(Iconsax.user)),
                ),
                const SizedBox(height: PSizes.spaceBtwInputFields),
                //? email
                TextFormField(
                  expands: false,
                  validator: (value) => PValidator.validateEmail(value),
                  controller: controller.email,
                  decoration: const InputDecoration(
                      labelText: "Email", prefixIcon: Icon(Iconsax.direct)),
                ),
                const SizedBox(height: PSizes.spaceBtwInputFields),

                //? phoneNumber
                TextFormField(
                  validator: (value) => PValidator.validatePhoneNumber(value),
                  expands: false,
                  controller: controller.phoneNumber,
                  decoration: const InputDecoration(
                      labelText: "Phone Number",
                      prefixIcon: Icon(Iconsax.call)),
                ),
                const SizedBox(height: PSizes.spaceBtwInputFields),

                const SizedBox(height: PSizes.spaceBtwSections),

                //? Signup Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => controller.saveContact(),
                    child: const Text("Save"),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
