import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:room_movie/util/logger.dart';

class LoggerInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    Logger.d(
      'Request : ${options.uri}\n'
      '——————————————————————————————————————————————————————————————————————\n'
      'Header: ${options.headers}\n'
      '——————————————————————————————————————————————————————————————————————\n'
      'Request Body: ${options.data}\n',
    );
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    var prettyString =
        const JsonEncoder.withIndent('  ').convert(response.data);
    Logger.d(
      'URI: ${response.realUri}\n'
      '——————————————————————————————————————————————————————————————————————\n'
      'Method: ${response.requestOptions.method}\n'
      '——————————————————————————————————————————————————————————————————————\n'
      'Status code: ${response.statusCode}\n'
      '——————————————————————————————————————————————————————————————————————\n'
      'Header: ${response.requestOptions.headers}\n'
      '——————————————————————————————————————————————————————————————————————\n'
      'Response : $prettyString\n',
    );
    return handler.next(response);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    Logger.e(
      'URI: ${err.response?.realUri}\n'
      '——————————————————————————————————————————————————————————————————————\n'
      'Method: ${err.response?.requestOptions.method}\n'
      '——————————————————————————————————————————————————————————————————————\n'
      'Status code: ${err.response?.statusCode}\n'
      '——————————————————————————————————————————————————————————————————————\n'
      'Header: ${err.response?.requestOptions.headers}\n'
      '——————————————————————————————————————————————————————————————————————\n'
      'Error : ${err.response?.data}\n',
      ex: err,
      stacktrace: err.stackTrace,
    );
    return handler.next(err);
  }
}
