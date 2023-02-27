import 'package:flutter/cupertino.dart';
import 'package:flutter_mvvm_api_news/view/screens/news/news_screen.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  NewsScreen.routeName: (context) => const NewsScreen(),
};
