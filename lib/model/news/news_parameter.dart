import 'package:flutter_mvvm_api_news/model/service/news/links.dart';

// class to handle the parameter of the api
enum SORTBY { relevancy, popularity, publishedAt }

enum LANGUAGE { ar, de, en, es, fr, he, it, nl, no, pt, ru, sv, ud, zh }

enum SEARCHIN { title, description, content }

class NewsParamter {
  String apiKey;
  var q;
  var from;
  var to;
  var pageSize;
  var page;

  SORTBY? sortBy;
  LANGUAGE? language;
  SEARCHIN? searchIn;

  NewsParamter({
    this.apiKey = QueryLinks.apk_key,
    this.q,
    this.from,
    this.to,
    this.sortBy,
    this.language,
    this.pageSize,
    this.searchIn,
    this.page,
  });

  Map<String, dynamic> toJson() {
    return {
      "apiKey": apiKey,
      "q": q ?? "",
      if (from != null) "from": from.toString(),
      if (sortBy != null) "sortBy": sortBy.toString(),
      if (to != null) "to": to.toString(),
      if (language != null) "language": language.toString(),
      if (pageSize != null) "pageSize": pageSize.toString(),
      if (searchIn != null) "searchIn": searchIn.toString(),
      if (page != null) "page": page.toString()
    };
  }
}
