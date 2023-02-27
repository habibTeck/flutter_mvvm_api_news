import 'package:flutter_mvvm_api_news/view/others/constant.dart';
import 'package:flutter/material.dart';

class Styles {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    InputDecorationTheme inputDecorationTheme() {
      OutlineInputBorder outlineInputBorder = OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        borderSide:
            BorderSide(color: isDarkTheme ? Colors.white : Colors.black),
        gapPadding: 10,
      );

      OutlineInputBorder outlineInputBorder2 = OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        borderSide: BorderSide(color: KSecondColor),
        gapPadding: 10,
      );
      return InputDecorationTheme(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder2,
        border: outlineInputBorder,
      );
    }

    return ThemeData(
      inputDecorationTheme: inputDecorationTheme(),
      scaffoldBackgroundColor:
          //0A1931  // white yellow 0xFFFCF8EC
          isDarkTheme ? kBlackThemeColor : const Color(0xFFFFFFFF),
      primaryColor: KPrimaryColor,
      indicatorColor: KSecondColor,
      colorScheme: ThemeData().colorScheme.copyWith(
            secondary:
                isDarkTheme ? const Color(0xFF1a1f3c) : const Color(0xFFE9FCFC),
            brightness: isDarkTheme ? Brightness.dark : Brightness.light,
          ),
      cardColor:
          isDarkTheme ? const Color(0xFF0a0d2c) : const Color(0xFFF2FDFD),
      canvasColor: isDarkTheme ? Colors.black : Colors.grey[50],
      buttonTheme: Theme.of(context).buttonTheme.copyWith(
          colorScheme: isDarkTheme
              ? const ColorScheme.dark()
              : const ColorScheme.light()),
    );
  }
}
