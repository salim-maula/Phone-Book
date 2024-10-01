import 'package:flutter/material.dart';
import 'package:phone_book_app/utils/constants/colors.dart';

import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_string.dart';
import 'widgets/sign_up_form.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PColors.neutral,
      appBar: AppBar(
        backgroundColor: PColors.neutral,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(PSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //?TItle
              Text(
                PTexts.titleRegister,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: PSizes.spaceBtwSections),

              //? Form
              const TSignupForm(),
            ],
          ),
        ),
      ),
    );
  }
}
