import 'package:flutter/material.dart';
import 'package:phone_book_app/common/styles/spacing_styles.dart';
import 'package:phone_book_app/features/authentication/view/login/widgets/login_form.dart';
import 'package:phone_book_app/utils/constants/colors.dart';

import '../../../../utils/constants/sizes.dart';
import 'widgets/login_header.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: PColors.neutral,
      body: SingleChildScrollView(
        padding: PSpacingStyle.paddingWithAppBarHeight,
        child: Column(
          children: [
            SizedBox(
              height: PSizes.lg,
            ),
            PLoginHeader(),
            PLoginForm(),
          ],
        ),
      ),
    );
  }
}
