import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Styles {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    final textColor = isDarkTheme ? Colors.white : Colors.black;
    final backgroundColor = isDarkTheme ? Colors.black : Colors.white;
    final selectedItemColor = isDarkTheme ? Colors.white : Colors.black;

    return ThemeData(
      scaffoldBackgroundColor:
          isDarkTheme ? const Color(0xFF00001a) : const Color(0xFFFFFFFF),
      primaryColor: Colors.blue,
      colorScheme: ThemeData().colorScheme.copyWith(
            secondary:
                isDarkTheme ? const Color(0xFF1a1f3c) : const Color(0xFFE8FDFD),
            brightness: isDarkTheme ? Brightness.dark : Brightness.light,
          ),
      cardColor:
          isDarkTheme ? const Color(0xff0a0d2c) : const Color(0xFFF2FDFD),
      canvasColor: backgroundColor,
      buttonTheme: Theme.of(context).buttonTheme.copyWith(
            colorScheme: isDarkTheme
                ? const ColorScheme.dark()
                : const ColorScheme.light(),
          ),
      textTheme:
          GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme).apply(
        bodyColor: textColor,
      ),
    );
  }
}
