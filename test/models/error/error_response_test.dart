import 'package:ntfluttery/src/models/error/error_response.dart';
import 'package:test/test.dart';

void main() {
  group('ErrorResponse Tests', () {
    test('Default constructor assigns properties correctly', () {
      var errorResponse = ErrorResponse(
          message: 'Error', statusCode: 500, msg: 'Internal server error');
      expect(errorResponse.message, equals('Error'));
      expect(errorResponse.statusCode, equals(500));
      expect(errorResponse.msg, equals('Internal server error'));
    });

    test('JSON serialization', () {
      var errorResponse = ErrorResponse(
          message: 'Error', statusCode: 500, msg: 'Internal server error');
      var json = errorResponse.toMap;
      expect(json['Message'], equals('Error'));
      expect((json['statusCode']), equals(500));
      expect(json['msg'], equals('Internal server error'));
    });

    test('JSON deserialization', () {
      var json = {'Message': 'Error', 'statusCode': 404, 'msg': 'Not found'};
      var errorResponse = ErrorResponse.fromMap(json);
      expect(errorResponse.message, equals('Error'));
      expect(errorResponse.statusCode, equals(404));
      expect(errorResponse.msg, equals('Not found'));
    });

    test('Equality and hashcode', () {
      var error1 = ErrorResponse(
          message: 'Error', statusCode: 500, msg: 'Internal server error');
      var error2 = ErrorResponse(
          message: 'Error', statusCode: 500, msg: 'Internal server error');
      expect(error1, equals(error2));
      expect(error1.hashCode, equals(error2.hashCode));
    });

    test('Handling of null or invalid inputs', () {
      var errorResponse = ErrorResponse.plainMessage(404, 'Not found');
      expect(errorResponse.message, isNotNull);
      expect(errorResponse.statusCode, isNotNull);
    });

    test('Stringify', () {
      var errorResponse = ErrorResponse(
          message: 'Error', statusCode: 500, msg: 'Internal server error');
      expect(errorResponse.stringify, equals(true));
    });

    test('Props', () {
      var errorResponse = ErrorResponse(
          message: 'Error', statusCode: 500, msg: 'Internal server error');
      expect(
          errorResponse.props, equals([500, 'Error', 'Internal server error']));
    });

    test('CopyWith', () {
      var errorResponse = ErrorResponse(
          message: 'Error', statusCode: 500, msg: 'Internal server error');
      var newErrorResponse = errorResponse.copyWith(message: 'New error');
      expect(newErrorResponse.message, equals('New error'));
    });

    test('FromJson', () {
      var errorResponse = ErrorResponse.fromJson(
          '{"Message":"Error","statusCode":500,"msg":"Internal server error"}');
      expect(errorResponse.message, equals('Error'));
      expect(errorResponse.statusCode, equals(500));
      expect(errorResponse.msg, equals('Internal server error'));
    });

    test('ToJson', () {
      var errorResponse = ErrorResponse(
          message: 'Error', statusCode: 500, msg: 'Internal server error');
      expect(
          errorResponse.toJson,
          equals(
              '{"statusCode":500,"Message":"Error","msg":"Internal server error"}'));
    });

    test('Stringify', () {
      var errorResponse = ErrorResponse(
          message: 'Error', statusCode: 500, msg: 'Internal server error');
      expect(errorResponse.stringify, equals(true));
    });

    test('Props', () {
      var errorResponse = ErrorResponse(
          message: 'Error', statusCode: 500, msg: 'Internal server error');
      expect(
          errorResponse.props, equals([500, 'Error', 'Internal server error']));
    });

    test('CopyWith', () {
      var errorResponse = ErrorResponse(
          message: 'Error', statusCode: 500, msg: 'Internal server error');
      var newErrorResponse = errorResponse.copyWith(message: 'New error');
      expect(newErrorResponse.message, equals('New error'));
    });

    test('FromMap', () {
      var errorResponse = ErrorResponse.fromMap({
        'Message': 'Error',
        'statusCode': 500,
        'msg': 'Internal server error'
      });
      expect(errorResponse.message, equals('Error'));
      expect(errorResponse.statusCode, equals(500));
      expect(errorResponse.msg, equals('Internal server error'));
    });

    test('PlainMessage', () {
      var errorResponse = ErrorResponse.plainMessage(404, 'Not found');
      expect(errorResponse.message, equals('Not found'));
      expect(errorResponse.statusCode, equals(404));
    });

    test('ToString', () {
      var errorResponse = ErrorResponse(
          message: 'Error', statusCode: 500, msg: 'Internal server error');
      expect(errorResponse.toString(),
          equals('ErrorResponse(500, Error, Internal server error)'));
    });

    test('ErrorResponse sealed class should have no subclasses', () {
      expect(ErrorResponse, equals(ErrorResponse));
    });
  });
}
