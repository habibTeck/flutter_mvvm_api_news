import 'package:flutter/material.dart';

import 'components/body.dart';

class NewsScreen extends StatelessWidget {
  static String routeName = "NewsScreen";
  const NewsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SafeArea(child: Body()));
  }
}
