import 'package:dio/dio.dart';
import 'package:ntfluttery/src/models/enums/network_error_type.dart';
import 'package:ntfluttery/src/models/error/dio_exceptions.dart';
import 'package:test/test.dart';

void main() {
  group('DioExceptions', () {
    test('bodyErrorMessage should return correct error message', () {
      final dioException = DioExceptions(
          error: DioException.badResponse(
              statusCode: 400,
              requestOptions: RequestOptions(path: 'path'),
              response: Response(
                  requestOptions: RequestOptions(path: 'path'),
                  statusCode: 400,
                  data: {'message': 'Error message'})));

      expect(dioException.bodyErrorMessage, equals('Error message'));
    });

    test('bodyErrorMessage should return correct error msg', () {
      final dioException = DioExceptions(
          error: DioException.badResponse(
              statusCode: 400,
              requestOptions: RequestOptions(path: 'path'),
              response: Response(
                  requestOptions: RequestOptions(path: 'path'),
                  statusCode: 400,
                  data: {'msg': 'Error message'})));

      expect(dioException.bodyErrorMessage, equals('Error message'));
    });

    test('bodyErrorMessage should return msg from plain message', () {
      final dioException = DioExceptions(
          error: DioException.badResponse(
              statusCode: 400,
              requestOptions: RequestOptions(path: 'path'),
              response: Response(
                  requestOptions: RequestOptions(path: 'path'),
                  statusCode: 400,
                  data: 'Error message')));

      expect(dioException.bodyErrorMessage, equals('Error message'));
    });

    test('bodyErrorMessage should return empty string for null response', () {
      final dioException = DioExceptions(
        error: DioException.badResponse(
          statusCode: 400,
          requestOptions: RequestOptions(path: 'path'),
          response: Response(
            requestOptions: RequestOptions(path: 'path'),
          ),
        ),
      );

      expect(dioException.bodyErrorMessage, equals('null'));
    });

    test('bodyErrorMessage should return empty string for null data', () {
      final dioException = DioExceptions(
        error: DioException.badResponse(
          statusCode: 400,
          requestOptions: RequestOptions(path: 'path'),
          response: Response(
            requestOptions: RequestOptions(path: 'path'),
            statusCode: 400,
          ),
        ),
      );

      expect(dioException.bodyErrorMessage, equals('null'));
    });

    test(
        'bodyErrorMessage should return empty string for null response and data',
        () {
      final dioException = DioExceptions(
        error: DioException.badResponse(
          statusCode: 400,
          requestOptions: RequestOptions(path: 'path'),
          response: Response(
            requestOptions: RequestOptions(path: 'path'),
          ),
        ),
      );

      expect(dioException.bodyErrorMessage, equals('null'));
    });

    test('errorMessage should return correct error type', () {
      final dioException = DioExceptions(
          error: DioException.badResponse(
              statusCode: 400,
              requestOptions: RequestOptions(path: 'path'),
              response: Response(
                  requestOptions: RequestOptions(path: 'path'),
                  statusCode: 400,
                  data: {'message': 'Error message'})));

      expect(dioException.errorMessage, equals(NetworkErrorType.custom));
    });

    test('errorMessage should return correct error type for cancel', () {
      final dioException = DioExceptions(
          error: DioException.connectionError(
              requestOptions: RequestOptions(path: 'path'), reason: 'reason'));

      expect(
          dioException.errorMessage, equals(NetworkErrorType.connectionError));
    });

    test('errorMessage should return NetworkErrorType.custom', () {
      final dioException = DioExceptions(
          error: DioException.badResponse(
              statusCode: 400,
              requestOptions: RequestOptions(path: 'path'),
              response: Response(
                  requestOptions: RequestOptions(path: 'path'),
                  statusCode: 400,
                  data: {'msg': 'Error message'})));

      expect(dioException.errorMessage, equals(NetworkErrorType.custom));
    });

    test('errorMessage should return NetworkErrorType.custom', () {
      final dioException = DioExceptions(
          error: DioException.badResponse(
              statusCode: 400,
              requestOptions: RequestOptions(path: 'path'),
              response: Response(
                  requestOptions: RequestOptions(path: 'path'),
                  statusCode: 400,
                  data: '')));

      expect(dioException.errorMessage, equals(NetworkErrorType.custom));
    });

    test('errorMessage should return NetworkErrorType.unknown', () {
      final dioException = DioExceptions(
          error: DioException(
        requestOptions: RequestOptions(path: 'path'),
      ));
      expect(dioException.errorMessage, equals(NetworkErrorType.unknownError));
    });

    test('errorMessage should return NetworkErrorType.unknown with statusCode',
        () {
      final dioException = DioExceptions(
          error: DioException(
        error: DioException(
          requestOptions: RequestOptions(path: 'path'),
          response: Response(
              requestOptions: RequestOptions(path: 'path'), statusCode: 999),
        ),
        requestOptions: RequestOptions(
          path: 'path',
        ),
        response: Response(
          requestOptions: RequestOptions(path: 'path'),
          statusCode: 999,
        ),
      ));
      expect(dioException.errorMessage, equals(NetworkErrorType.custom));
    });

    test('errorMessage should return NetworkErrorType.unknown', () {
      final dioException = DioExceptions(
          error: DioException(
        error: DioException(
          requestOptions: RequestOptions(path: 'path'),
        ),
        requestOptions: RequestOptions(
          path: 'path',
        ),
        response: Response(
          requestOptions: RequestOptions(path: 'path'),
          statusCode: 999,
        ),
      ));
      expect(dioException.errorMessage, equals(NetworkErrorType.custom));
    });

    test('errorMessage should return correct error type for bad response', () {
      final dioException = DioExceptions(
          error: DioException.badResponse(
              statusCode: 400,
              requestOptions: RequestOptions(path: 'path'),
              response: Response(
                  requestOptions: RequestOptions(path: 'path'),
                  statusCode: 400,
                  data: {'message': 'Error message'})));

      expect(dioException.errorMessage, equals(NetworkErrorType.custom));
    });

    test('errorMessage should return correct error type for cancel', () {
      final dioException = DioExceptions(
          error: DioException.connectionError(
              requestOptions: RequestOptions(path: 'path'), reason: 'reason'));

      expect(
          dioException.errorMessage, equals(NetworkErrorType.connectionError));
    });

    test('Props', () {
      final dioException = DioExceptions(
          error: DioException.badResponse(
              statusCode: 400,
              requestOptions: RequestOptions(path: 'path'),
              response: Response(
                  requestOptions: RequestOptions(path: 'path'),
                  statusCode: 400,
                  data: {'message': 'Error message'})));

      expect(dioException.props, equals([dioException.error]));
    });
  });
}
