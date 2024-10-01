import 'package:flutter/material.dart';
import 'package:phone_book_app/utils/constants/colors.dart';

class PCheckboxTheme {
  PCheckboxTheme._();

  static CheckboxThemeData lightCheckboxThemeData = CheckboxThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4),
    ),
    checkColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        return Colors.white;
      } else {
        return Colors.black;
      }
    }),
    fillColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        return PColors.primary;
      } else {
        return Colors.transparent;
      }
    }),
  );

}
