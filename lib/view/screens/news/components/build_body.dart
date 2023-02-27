import 'package:flutter_mvvm_api_news/model/apis/api_response.dart';
import 'package:flutter_mvvm_api_news/view/others/app_theme.dart';
import 'package:flutter_mvvm_api_news/view/others/helper.dart';
import 'package:flutter_mvvm_api_news/view/others/responsive.dart';
import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mvvm_api_news/view_model/news/news_view_model.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import 'shimmer_components/news_shwimar.dart';
import 'small_news_list.dart';

class BuildBody extends StatelessWidget {
  const BuildBody({Key? key}) : super(key: key);

// deals with all cases of you response
  Widget NewsWidget(NewsViewModel viewModel, BuildContext context) {
    switch (viewModel.response.status) {
      case Status.INITIAL:
        return Shimmer.fromColors(
            baseColor: AppTheme.baseColor(context),
            highlightColor: AppTheme.highlightColor(context),
            child: buildListOfShimmer());
      case Status.LOADING:
        return Shimmer.fromColors(
            baseColor: AppTheme.baseColor(context),
            highlightColor: AppTheme.highlightColor(context),
            child: buildListOfShimmer());
      case Status.COMPLETED:
        return const Responsive(
          mobile: SmallNewsList(),
          desktop:
              SmallNewsList(), // if you want your design to look differnt in bigger screens
        );
      case Status.ERROR:
        return Center(
          child: Text(
            " ${viewModel.response.message} ",
            textAlign: TextAlign.center,
          ),
        );

      case Status.UPLOADING:
        return Center(
          child: Text(
            " ${viewModel.response.message} ",
            textAlign: TextAlign.center,
          ),
        );
      case Status.DELETING:
        return const Center(
          child: Text("Deleting"),
        );
    }
  }

  buildListOfShimmer() {
    return LiveList.options(
        shrinkWrap: true,
        controller: ScrollController(),
        physics: const NeverScrollableScrollPhysics(),
        options: Helper.options,
        itemCount: 5,
        itemBuilder: (context, index, animation) {
          return NewsShimmer(animation: animation);
        });
  }

  @override
  Widget build(BuildContext context) {
    var viewModel = Provider.of<NewsViewModel>(context);
    return NewsWidget(viewModel, context);
  }
}
