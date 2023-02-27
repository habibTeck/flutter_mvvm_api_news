import 'package:flutter_mvvm_api_news/view/others/constant.dart';
import 'package:flutter_mvvm_api_news/view_model/theme/dark_theme_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Utils {
  BuildContext context;

  Utils(this.context);
  static convertDateTimeToString(DateTime date) =>
      "${date.year.toString()}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";

  bool get getTheme => Provider.of<DarkThemeProvider>(
        context,
      ).getDarkTheme;
  Color color({bool reverse = false}) => getTheme
      ? reverse
          ? kBlackThemeColor
          : Colors.white
      : reverse
          ? Colors.white
          : kBlackThemeColor;
  Size get getScreenSize => MediaQuery.of(context).size;
}
