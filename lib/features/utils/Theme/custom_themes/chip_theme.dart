import 'package:flutter/material.dart';


class TChipTheme {
  TChipTheme._();

  static ChipThemeData lightChipTheme = ChipThemeData(
    checkmarkColor: Colors.white,
    selectedColor: Colors.orange,
    disabledColor: Colors.grey.withOpacity(0.4),
    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
    labelStyle: const TextStyle(color: Colors.black, fontFamily: 'Poppins'),
  );

  static ChipThemeData darkChipTheme = const ChipThemeData(
    checkmarkColor: Colors.white,
    selectedColor: Colors.orange,
    disabledColor: Colors.grey,
    padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
    labelStyle: TextStyle(color: Colors.white, fontFamily: 'Poppins'),
  );
}
