
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phone_book_app/utils/constants/colors.dart';

import 'bindings/general_bindingg.dart';
import 'utils/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      theme: PAppTheme.lightTheme,
      initialBinding: GeneralBindings(),
      home: const Scaffold(
          backgroundColor: PColors.primary,
          body: Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          )),
    );
  }
}
