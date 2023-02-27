import 'package:flutter_mvvm_api_news/view/others/app_theme.dart';
import 'package:flutter_mvvm_api_news/view/others/constant.dart';
import 'package:flutter_mvvm_api_news/view/others/utils.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  Header({
    Key? key,
    required this.fct,
    required this.onChnage,
    this.controller,
  }) : super(key: key);

  final Function()? fct;
  Function(String)? onChnage;

  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
      child: Row(
        children: [
          Expanded(
              child: TextField(
            controller: controller,
            onChanged: onChnage,
            onSubmitted: (value) => {
              if (fct != null) {fct!()}
            },
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 8,
                ),
                hintText: "Search",
                fillColor: Theme.of(context).cardColor,
                filled: false,
                border: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                iconColor: Utils(context).color(),
                suffixIcon: InkWell(
                  onTap: fct,
                  child: Container(
                    padding: const EdgeInsets.all(defaultPadding * 0.80),
                    margin: const EdgeInsets.symmetric(
                        horizontal: defaultPadding, vertical: 5),
                    decoration: BoxDecoration(
                      gradient: AppTheme.primaryGradient,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child:
                        const Icon(Icons.search, color: Colors.white, size: 25),
                  ),
                )),
          ))
        ],
      ),
    );
  }
}
