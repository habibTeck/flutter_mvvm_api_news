import 'package:flutter/material.dart';

class ImageShwimmer extends StatelessWidget {
  const ImageShwimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.black,
      ),
    );
  }
}
