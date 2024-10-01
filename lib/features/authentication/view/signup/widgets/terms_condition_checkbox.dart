import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../controller/signup/signup_controller.dart';

class PTermsAndConditionCheckbox extends StatelessWidget {
  const PTermsAndConditionCheckbox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());

    return Row(
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: Obx(() {
            return Checkbox(
              value: controller.privacyPolicy.value,
              onChanged: (value) => controller.privacyPolicy.value =
                  !controller.privacyPolicy.value,
            );
          }),
        ),
        const SizedBox(height: PSizes.spaceBtwItems),
        Flexible(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: ' I agree to ',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                TextSpan(
                  text: 'Privacy Policy ',
                  style: Theme.of(context).textTheme.bodyMedium!.apply(
                        color: PColors.primary,
                        decoration: TextDecoration.underline,
                        decorationColor: PColors.primary,
                      ),
                ),
                TextSpan(
                  text: 'and ',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                TextSpan(
                  text: 'Terms of use ',
                  style: Theme.of(context).textTheme.bodyMedium!.apply(
                        color: PColors.primary,
                        decoration: TextDecoration.underline,
                        decorationColor: PColors.primary,
                      ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
