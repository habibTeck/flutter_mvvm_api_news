import 'package:flutter_mvvm_api_news/view/others/helper.dart';
import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mvvm_api_news/view_model/news/news_view_model.dart';
import 'package:provider/provider.dart';

import 'news_widget.dart';

class SmallNewsList extends StatelessWidget {
  const SmallNewsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var viewModel = Provider.of<NewsViewModel>(context);
    return LiveList.options(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      options: Helper.options,
      itemCount: (viewModel.response.data?.articles?.length) ?? 0,
      itemBuilder: (context, index, animation) {
        return NewsWidget(
          artical: viewModel.response.data!.articles![index],
          animation: animation,
          onClick: () async {
            /// to
            /// move to another Screen
          },
          //
        );
      },
    );
  }
}
