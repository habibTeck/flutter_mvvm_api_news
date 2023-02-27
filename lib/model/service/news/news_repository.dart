import 'package:flutter_mvvm_api_news/model/news/news.dart';

import 'news_service.dart';

class NewsRepository {
  final NewsService _newsService = NewsService();

  Future<News?> fetchNews({required Uri query}) async {
    dynamic response = await _newsService.getResource(query: query);
    News? news = News.fromJson(response);

    return news;
  }

  Future<dynamic> createNews(
      {required Uri query, required Map<String, dynamic> body}) async {
    dynamic response =
        await _newsService.postResource(query: query, body: body);

    return response;
  }

  Future<dynamic> updateNews(
      {required Uri query, required Map<String, dynamic> body}) async {
    dynamic response = await _newsService.putResource(query: query, body: body);

    return response;
  }
}
