import 'package:dio/dio.dart';
import 'package:ntfluttery/ntfluttery.dart';
import 'package:test/test.dart';

void main() {
  group('ExceptionExtension Tests', () {
    test('Retrieving custom message and network error type', () {
      var exception = Exception();
      var result = exception.message;
      expect(result, equals((NetworkErrorType.unknownError, null)));
    });

    test('Retrieving custom message and network error type', () {
      var exception = Exception('Error');
      var result = exception.message;
      expect(result, equals((NetworkErrorType.unknownError, null)));

      // var dioException = DioExceptions(
      //     error: DioException.badResponse(
      //         statusCode: 400,
      //         requestOptions: RequestOptions(path: 'path'),
      //         response: Response(
      //             requestOptions: RequestOptions(path: 'path'),
      //             statusCode: 400,
      //             data: {'message': 'Error message'})));
      // var exceptionDio = Exception([dioException]);
      // var resultDio = exceptionDio.message;
      // expect(
      //     resultDio, equals(('Error message', NetworkErrorType.badResponse)));
    });

    test('Retrieving body error message', () {
      final exception = Exception(DioExceptions(
          error: DioException.badResponse(
              statusCode: 400,
              requestOptions: RequestOptions(path: 'path'),
              response: Response(
                  requestOptions: RequestOptions(path: 'path'),
                  statusCode: 400,
                  data: {'message': 'Error message'}))));

      print(exception.message.$1);
      // expect(exception.message, equals((null, null)));
    });
  });
}
