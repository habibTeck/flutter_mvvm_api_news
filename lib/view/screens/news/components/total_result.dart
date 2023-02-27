import 'package:flutter/widgets.dart';
import 'package:flutter_mvvm_api_news/view/others/app_theme.dart';
import 'package:flutter_mvvm_api_news/view_model/news/news_view_model.dart';
import 'package:provider/provider.dart';

class TotalResultWidget extends StatelessWidget {
  const TotalResultWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NewsViewModel viewModel = Provider.of<NewsViewModel>(context);

    int? getResult() {
      return viewModel.response.data?.totalResults ?? 0;
    }

    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: RichText(
          text: TextSpan(style: AppTheme.text3(context), children: [
            const TextSpan(text: "there is "),
            TextSpan(text: "${getResult()}", style: AppTheme.text1(context)),
            const TextSpan(text: "  result"),
          ]),
        ));
  }
}
