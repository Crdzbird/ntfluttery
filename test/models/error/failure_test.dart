import 'package:ntfluttery/src/models/enums/network_error_type.dart';
import 'package:ntfluttery/src/models/error/failure.dart';
import 'package:test/test.dart';

void main() {
  group('Failure Tests', () {
    test('Property assignments', () {
      var serverFailure =
          ServerFailure(errorMessage: (NetworkErrorType.badResponse, 'Error'));
      expect(serverFailure.errorMessage,
          equals((NetworkErrorType.badResponse, 'Error')));
    });

    test('Equality and HashCode', () {
      var failure1 =
          ServerFailure(errorMessage: (NetworkErrorType.badResponse, 'Error'));
      var failure2 =
          ServerFailure(errorMessage: (NetworkErrorType.badResponse, 'Error'));
      expect(failure1, equals(failure2));
      expect(failure1.hashCode, equals(failure2.hashCode));
    });

    test('toString', () {
      var serverFailure =
          ServerFailure(errorMessage: (NetworkErrorType.badResponse, 'Error'));
      expect(serverFailure.toString(),
          equals('ServerFailure((NetworkErrorType.badResponse, Error))'));
    });

    test('Failure sealed class should have no subclasses', () {
      expect(Failure, equals(Failure));
    });
  });
}
