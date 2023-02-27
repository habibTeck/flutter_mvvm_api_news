import 'package:flutter_mvvm_api_news/view/others/app_theme.dart';
import 'package:flutter_mvvm_api_news/view/others/constant.dart';
import 'package:flutter_mvvm_api_news/view/others/utils.dart';
import 'package:flutter_mvvm_api_news/view/others/responsive.dart';
import 'package:flutter_mvvm_api_news/view/screens/news/components/shimmer_components/news_shwimar.dart';
import 'package:flutter_mvvm_api_news/view/screens/news/components/total_result.dart';
import 'package:flutter_mvvm_api_news/view/widgets/header.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mvvm_api_news/view_model/news/news_view_model.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shimmer/shimmer.dart';

import 'build_body.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var viewModel = Provider.of<NewsViewModel>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      child: SmartRefresher(
          enablePullDown: viewModel.isRefreshEnabled(),
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          enablePullUp: kIsWeb && Responsive.isDesktop(context) ? false : true,
          primary: true,
          header: WaterDropHeader(
            waterDropColor: KPrimaryColor,
            complete: const Text("تم التحديث"),
          ),
          footer:
              CustomFooter(builder: (BuildContext context, LoadStatus? mode) {
            Widget body;

            if (mode == LoadStatus.idle) {
              if (kIsWeb) {
                body = InkWell(
                    onTap: () {
                      viewModel.refreshController.requestLoading();
                    },
                    child: const Text("انقر لتحميل المزيد"));
              } else {
                body = const Text("اسحب للتحميل");
              }
            } else if (mode == LoadStatus.loading) {
              body = Shimmer.fromColors(
                  // enabled: true,
                  baseColor: AppTheme.baseColor(context),
                  highlightColor: AppTheme.highlightColor(context),
                  child: const NewsShimmer());
            } else if (mode == LoadStatus.failed) {
              body = const Text("فشل التحميل");
            } else if (mode == LoadStatus.canLoading) {
              body = const Text("اترك الشاشة للتحميل");
            } else {
              body = const Text("لا يوجد مزيد البيانات");
            }
            return SizedBox(
              child: Center(child: body),
            );
          }),
          controller: viewModel.refreshController,
          onRefresh: viewModel.isShimmerStates() ? null : viewModel.onRefresh,
          onLoading: viewModel.isShimmerStates() ? null : viewModel.onLoading,
          child: CustomScrollView(
              shrinkWrap: true,
              primary: false,
              physics: const NeverScrollableScrollPhysics(),
              slivers: <Widget>[
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  expandedHeight: 20,
                  floating: true,
                  iconTheme: IconThemeData(
                      color: Utils(context).color(reverse: false)),

                  backgroundColor: Utils(context).color(reverse: true),

                  flexibleSpace: Header(
                    controller: viewModel.searchController,
                    fct: () {
                      viewModel.fetchNews();
                    },
                    onChnage: (value) {
                      viewModel.newsParamter.q = value;
                    },
                  ),

                  //this is the most amazi
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      const SizedBox(
                        height: 8,
                      ),
                      const TotalResultWidget(),
                      const SizedBox(
                        height: 8,
                      ),
                      const BuildBody(),
                      const SizedBox(
                        height: 8,
                      ),
                    ],
                  ),
                )
              ])),
    );
  }
}
