import 'dart:convert';
import 'dart:io';

import 'package:flutter_mvvm_api_news/model/apis/app_exception.dart';
import 'package:flutter_mvvm_api_news/model/service/base_service.dart';
import 'package:http/http.dart' as http;

class NewsService extends BaseService {
  @override
  Future getResource({required Uri query}) async {
    dynamic responseJson;
    try {
      final response = await http.get(
        query,
      );
      responseJson = await returnResponse(response);
    } on SocketException {
      throw FetchDataException('لا يوجد اتصال بالسرفر');
    }

    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        // body is empty in case of update
        var body =
            response.body.isEmpty ? '{"state":"success"}' : response.body;

        dynamic responseJson = jsonDecode(body);
        return responseJson;
      case 201:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;

      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException('وقعت مشكله اثناء التواصل بالسرفر '
            'رقم الخطأ : ${response.statusCode}');
    }
  }

  @override
  Future deleteResource({required Uri query}) async {
    dynamic responseJson;
    try {
      final response = await http.delete(
        query,
      );

      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('لا يوجد اتصال بالسرفر');
    }

    return responseJson;
  }

  @override
  Future postResource(
      {required Uri query, required Map<String, dynamic> body}) async {
    dynamic responseJson;

    try {
      final response = await http.post(
        query,
        body: json.encode(body),
      );

      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('لا يوجد اتصال بالسرفر');
    }

    return responseJson;
  }

  @override
  Future putResource(
      {required Uri query, required Map<String, dynamic> body}) async {
    dynamic responseJson;

    try {
      final response = await http.put(
        query,
        body: json.encode(body),
      );

      print('status code : ${response.statusCode}');
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('لا يوجد اتصال بالسرفر');
    }

    return responseJson;
  }

  @override
  Future patchResource(
      {required Object query, required Map<String, dynamic> body}) {
    // TODO: implement patchResource
    throw UnimplementedError();
  }
}
