import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ntfluttery/src/models/credentials.dart';
import 'package:ntfluttery/src/models/error/error_response.dart';
import 'package:ntfluttery/src/models/extensions/string_extension.dart';

class DioInterceptor extends Interceptor {
  DioInterceptor({this.credentials});

  final Credentials? credentials;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    options.headers[HttpHeaders.accessControlAllowHeadersHeader] = true;
    if (credentials != null) {
      options.headers[HttpHeaders.authorizationHeader] = credentials!.basicAuth;
    }
    handler.next(options);
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    final data = '${response.data}'.separateAndParseJson;
    response.data = data;
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final errorResponse = ErrorResponse.plainMessage(
        err.response?.statusCode ?? 0, '${err.response?.data}');
    return handler.next(
      throw DioException(
        requestOptions: err.requestOptions,
        response: err.response,
        error: errorResponse.message,
        message: errorResponse.message,
      ),
    );
  }
}
