import 'package:flutter_mvvm_api_news/view/others/extensions.dart';
import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  DefaultButton({
    Key? key,
    this.text,
    required this.press,
    this.gradient,
    this.boxShadow,
    this.isPregress = false,
  }) : super(key: key);
  final String? text;
  Function()? press;
  List<BoxShadow>? boxShadow;
  LinearGradient? gradient;
  bool isPregress;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: (56),
      child: Container(
        decoration: BoxDecoration(
          gradient: gradient,
          boxShadow: boxShadow,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                text!,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
            isPregress
                ? Container(
                    width: (16),
                    height: 16,
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    child: const CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 1,
                    ),
                  )
                : const SizedBox(
                    height: 0,
                    width: 0,
                  )
          ],
        ).addRipple(onTap: isPregress ? () {} : press ?? () {}),
      ),
    );
  }
}
