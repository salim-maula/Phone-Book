import 'package:flutter/material.dart';
import 'package:phone_book_app/utils/constants/colors.dart';

import 'custom_theme/checkbox_theme.dart';
import 'custom_theme/chip_theme.dart';
import 'custom_theme/elevated_button_theme.dart';
import 'custom_theme/outlined_button_theme.dart';
import 'custom_theme/text_field_theme.dart';

class PAppTheme {
  PAppTheme._(); //to avoid creating instance

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: PColors.primary,
    scaffoldBackgroundColor: Colors.white,
    elevatedButtonTheme: PElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: POutlinedButton.lightOutlinedButtonTheme,
    chipTheme: PChipTheme.lightChipTheme,
    inputDecorationTheme: PTextFormFieldTheme.lightInputDecorationTheme,
    checkboxTheme: PCheckboxTheme.lightCheckboxThemeData,
  );
}
