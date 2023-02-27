import 'package:flutter_mvvm_api_news/view/others/constant.dart';
import 'package:flutter_mvvm_api_news/view/others/utils.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static const LinearGradient gradient = LinearGradient(colors: []);

  static LinearGradient primaryGradient = LinearGradient(
    colors: [kPrimaryColorLight, KPrimaryColor],
  );
  static Color boldColorFont(BuildContext context) => Utils(context).getTheme
      ? const Color(0xFFFFFFFF)
      : const Color(0xFF2A2E49);

  static Color baseColor(BuildContext context) =>
      Utils(context).getTheme ? Colors.grey[600]! : Colors.grey[300]!;
  static Color highlightColor(BuildContext context) =>
      Utils(context).getTheme ? Colors.grey[500]! : Colors.white;

  static Color normalColorFont(BuildContext context, {bool reverse = false}) =>
      Utils(context).getTheme
          ? const Color(0xFFa2a1ae)
          : const Color(0xFF2A2E49);

  static TextStyle text1(BuildContext context, {bool reverse = false}) =>
      TextStyle(
        fontSize: 16,
        color: normalColorFont(context, reverse: reverse),
        fontWeight: FontWeight.w500,
      );

  static TextStyle text3(BuildContext context) => TextStyle(
        fontSize: 14,
        color: normalColorFont(context).withOpacity(0.7),
        fontWeight: FontWeight.w500,
      );
}
