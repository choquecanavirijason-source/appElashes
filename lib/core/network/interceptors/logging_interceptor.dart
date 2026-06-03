import 'dart:developer' as developer;

import 'package:dio/dio.dart';

class LoggingInterceptor extends Interceptor {
  const LoggingInterceptor();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    developer.log(
      '→ ${options.method} ${options.uri}',
      name: 'http.request',
    );
    handler.next(options);
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    developer.log(
      '← ${response.statusCode} ${response.requestOptions.uri}',
      name: 'http.response',
    );
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    developer.log(
      '✕ ${err.response?.statusCode ?? '-'} ${err.requestOptions.uri} :: ${err.message}',
      name: 'http.error',
    );
    handler.next(err);
  }
}
