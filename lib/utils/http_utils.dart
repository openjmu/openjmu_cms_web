import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../constants/constants.dart';

enum FetchType { get, post }

class HttpUtils {
  const HttpUtils._();

  static Future<ResponseModel<T>> fetch<T extends DataModel>(
    FetchType fetchType, {
    @required String url,
    Map<String, String> queryParameters,
    dynamic body,
    Map<String, String> headers,
  }) async {
    final http.Response response = await _getResponse(
      fetchType,
      url: url,
      queryParameters: queryParameters,
      body: body,
      headers: headers,
    );

    final Map<String, dynamic> json =
        jsonDecode(response.body) as Map<String, dynamic>;
    final ResponseModel<T> model = ResponseModel<T>.fromJson(json);
    if (model.isSucceed) {
      return model;
    } else {
      realDebugPrint('Response is not succeed: ${model.msg}');
      throw AssertionError(model.msg);
    }
  }

  static Future<ResponseModel<T>> fetchModels<T extends DataModel>(
    FetchType fetchType, {
    @required String url,
    Map<String, String> queryParameters,
    dynamic body,
    Map<String, String> headers,
  }) async {
    final http.Response response = await _getResponse(
      fetchType,
      url: url,
      queryParameters: queryParameters,
      body: body,
      headers: headers,
    );

    final Map<String, dynamic> json =
        jsonDecode(response.body) as Map<String, dynamic>;
    final ResponseModel<T> model =
        ResponseModel<T>.fromJson(json, isModels: true);
    if (model.isSucceed) {
      return model;
    } else {
      realDebugPrint('Response is not succeed: ${model.msg}');
      throw AssertionError(model.msg);
    }
  }

  static Future<http.Response> _getResponse(
    FetchType fetchType, {
    @required String url,
    Map<String, String> queryParameters,
    dynamic body,
    Map<String, String> headers,
  }) async {
    http.Response response;
    headers['Content-Type'] = 'application/json;charset=utf-8';
    switch (fetchType) {
      case FetchType.get:
        response = await http.get(
          Uri.parse(url).replace(queryParameters: queryParameters),
          headers: headers,
        );
        break;
      case FetchType.post:
        response = await http.post(
          Uri.parse(url).replace(queryParameters: queryParameters),
          body: jsonEncode(body),
          headers: headers,
        );
        break;
    }
    return response;
  }
}