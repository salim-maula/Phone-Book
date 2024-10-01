
import 'package:flutter/material.dart';
import 'package:phone_book_app/utils/constants/images_string.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_string.dart';

class PLoginHeader extends StatelessWidget {
  const PLoginHeader({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Center(
          child: Image(
            height: 150,
            image: AssetImage(PImages.logo),
          ),
        ),
         const SizedBox(
          height: PSizes.xl,
        ),
        Text(
          PTexts.titleLogin,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(
          height: PSizes.sm,
        ),
        Text(
          PTexts.subTitleLogin,
          style: Theme.of(context).textTheme.bodyMedium,
        )
      ],
    );
  }
}
