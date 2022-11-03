import 'package:flutter/material.dart';

class CustomTheme {
  var theme = ThemeData(
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black87,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all<Color>(const Color(0xfff25723)),
      ),
    ),
  );
}
