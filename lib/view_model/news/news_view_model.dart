import 'package:flutter_mvvm_api_news/model/apis/api_response.dart';
import 'package:flutter_mvvm_api_news/model/news/news.dart';
import 'package:flutter_mvvm_api_news/model/news/news_parameter.dart';
import 'package:flutter_mvvm_api_news/model/service/news/news_repository.dart';

import 'package:flutter_mvvm_api_news/model/service/news/links.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class NewsViewModel with ChangeNotifier {
  TextEditingController searchController = TextEditingController(text: "yemen");
  ApiResponse<News> response = ApiResponse<News>.initial('initial status');
  NewsParamter newsParamter = NewsParamter(pageSize: 10, page: 1, q: "yemen");

  // used for refreshing
  RefreshController refreshController =
      RefreshController(initialRefresh: false);

  bool isRefreshing = false;

  void onRefresh() async {
    isRefreshing = true;
    newsParamter =
        NewsParamter(pageSize: 10, page: 1, q: searchController.text);
    await fetchNews();
    refreshController.refreshCompleted(resetFooterState: true);
    isRefreshing = false;
    notifyListeners();
  }

  bool isShimmerStates() {
    return response.status == Status.LOADING ||
        response.status == Status.INITIAL;
  }

  bool isRefreshEnabled() {
    if (isRefreshing) return true;
    bool status = (response.status == Status.LOADING ||
        response.status == Status.INITIAL);

    return !status;
  }

  void onLoading() async {
    if (response.data?.totalResults != null &&
        (newsParamter.page * newsParamter.pageSize) <
            (response.data!.totalResults ?? 0)) {
      ++newsParamter.page;

      News? news = await NewsRepository().fetchNews(query: buildUri());
      if (news != null && news.articles!.isNotEmpty) {
        refreshController.loadComplete();
        response.data?.refreshNews(news);
      } else {
        refreshController.loadNoData();
      }

      notifyListeners();
    } else {
      refreshController.loadNoData();
    }
  }

  Future<void> fetchNews() async {
    response = ApiResponse<News>.loading('Fetching News data');
    // await Future.delayed(const Duration(seconds: 5)); // only for testing
    notifyListeners();

    try {
      var news = await NewsRepository().fetchNews(query: buildUri());

      response = ApiResponse<News>.completed(news);
    } catch (e) {
      response = ApiResponse<News>.error(e.toString());
      print(e);
    }
    notifyListeners();
  }

  Uri buildUri() {
    Uri uri = Uri(
        queryParameters: newsParamter.toJson(),
        scheme: 'https',
        host: 'newsapi.org',
        //   port: 8000,
        path: QueryLinks.evertything());
    print("url = ${uri.toString()}");

    return uri;
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}
