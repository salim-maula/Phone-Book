import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:phone_book_app/utils/constants/text_string.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/validators/validation.dart';
import '../../../controller/login/login_controller.dart';
import '../../signup/sign_up_screen.dart';

class PLoginForm extends StatelessWidget {
  const PLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Form(
      key: controller.loginFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: PSizes.spaceBtwSections),
        child: Column(
          children: [
            //? email
            TextFormField(
              controller: controller.email,
              validator: (value) => PValidator.validateEmail(value),
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: "Email",
              ),
            ),
            const SizedBox(height: PSizes.spaceBtwInputFields),

            //? password
            Obx(() {
              return TextFormField(
                validator: (value) => PValidator.validatePassword(value),
                expands: false,
                obscureText: controller.hidePassword.value,
                controller: controller.password,
                decoration: InputDecoration(
                  labelText: "Password",
                  prefixIcon: const Icon(Iconsax.password_check),
                  suffixIcon: IconButton(
                    icon: Icon(controller.hidePassword.value
                        ? Iconsax.eye_slash
                        : Iconsax.eye),
                    onPressed: () => controller.hidePassword.value =
                        !controller.hidePassword.value,
                  ),
                ),
              );
            }),
            const SizedBox(height: PSizes.spaceBtwInputFields),

            //? Remember me
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Obx(() {
                      return Checkbox(
                          value: controller.rememberMe.value,
                          onChanged: (value) => controller.rememberMe.value =
                              !controller.rememberMe.value);
                    }),
                    const Text("remember me"),
                  ],
                ),
              ],
            ),
            const SizedBox(height: PSizes.spaceBtwSections),
             //? Sign in button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => controller.emailPasswordSignIn(),
                child: const Text(PTexts.btnSignIn),
              ),
            ),
            const SizedBox(height: PSizes.spaceBtwItems),
            //? Create Account button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () => Get.to(() => const SignUpScreen()),
                child: const Text(PTexts.btnRegister),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
