import 'dart:async';
import 'dart:io';

import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:dio/dio.dart';
import 'package:room_movie/util/constant.dart';
import 'package:room_movie/util/exception.dart';

import 'interceptors.dart';

class DioUtil {
  final _dio = Dio();

  factory DioUtil() => _instance;
  static final DioUtil _instance = DioUtil._internal();

  DioUtil._internal() {
    _dio.options.baseUrl = Constant.baseUrl;
    _dio.options.connectTimeout = 90000;
    _dio.options.receiveTimeout = 50000;
    _dio.interceptors.add(LoggerInterceptor());
    _dio.interceptors.add(ChuckerDioInterceptor());
    _dio.options.headers = {
      "Content-Type": "application/json",
      "Accept": "*/*",
    };
  }

  Future<Map<String, dynamic>> post({
    required String uri,
    String? authorization,
    Map<String, dynamic>? body,
    Map<String, String>? headers,
    Map<String, String>? param,
    encoding,
  }) async {
    if (authorization != null) _dio.addToken(authorization);
    if (headers != null) _dio.addHeader(headers);
    try {
      var res = await _dio.post(uri, data: body, queryParameters: param);
      return _handleResponse(res);
    } on DioError catch (error) {
      return _handleError(error);
    } on Exception {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> get({
    required String uri,
    String? authorization,
    Map<String, String>? headers,
    Map<String, String>? param,
    encoding,
  }) async {
    if (authorization != null) _dio.addToken(authorization);
    if (headers != null) _dio.addHeader(headers);
    try {
      var res = await _dio.get(uri, queryParameters: param);
      return _handleResponse(res);
    } on DioError catch (error) {
      return _handleError(error);
    } on Exception {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> put({
    required String uri,
    String? authorization,
    Map<String, dynamic>? body,
    Map<String, String>? headers,
    Map<String, String>? param,
    encoding,
  }) async {
    if (authorization != null) _dio.addToken(authorization);
    if (headers != null) _dio.addHeader(headers);
    try {
      var res = await _dio.put(uri, data: body, queryParameters: param);
      return _handleResponse(res);
    } on DioError catch (error) {
      return _handleError(error);
    } on Exception {
      rethrow;
    }
  }

  /////////////////////////HANDLE RESPONSE////////////////////////////////////

  dynamic _handleResponse(Response res) {
    if (res.statusCode! != 200) {
      throw ErrorResponse.mapErrorResponse(
        statusCode: res.statusCode,
        message: res.data["message"] ?? "Internal server error",
        errorCode: res.data['errorCode'],
      );
    } else if (res.data['success'] != null && res.data['success'] == false) {
      throw ErrorResponse.mapErrorResponse(
        statusCode: res.statusCode,
        message: res.data["message"] ?? "Internal server error",
        errorCode: res.data['errorCode'],
      );
    }

    return res.data;
  }

  dynamic _handleError(DioError res) {
    if (res.error is SocketException) {
      throw FetchDataException(
        message: res.message.toString(),
        statusCode: 600,
      );
    } else if (res.error is TimeoutException) {
      throw FetchDataException(
        message: res.message.toString(),
        statusCode: 408,
      );
    }
    return ErrorResponse.mapErrorResponse(
      statusCode: res.response?.statusCode,
      message: res.response?.data['message'] ?? res.message,
      errorCode: res.response?.data['errorCode'],
    );
  }
}

extension DioEx on Dio {
  void addHeader(Map<String, dynamic> header) {
    (this).options.headers.addAll(header);
  }

  void addToken(String token) {
    (this).options.headers.addAll({'token': token});
  }
}
