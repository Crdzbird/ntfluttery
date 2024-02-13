import 'package:ntfluttery/src/models/enums/network_error_type.dart';
import 'package:test/test.dart';

void main() {
  group('NetworkErrorType Tests', () {
    test('Enum values should match numeric error codes', () {
      expect(NetworkErrorType.requestCancelled.statusCode, equals(1));
      expect(NetworkErrorType.noInternetConnection.statusCode, equals(2));
      expect(NetworkErrorType.badRequest.statusCode, equals(400));
      expect(NetworkErrorType.unauthorized.statusCode, equals(401));
      expect(NetworkErrorType.paymentRequired.statusCode, equals(402));
      expect(NetworkErrorType.forbidden.statusCode, equals(403));
      expect(NetworkErrorType.notFound.statusCode, equals(404));
      expect(NetworkErrorType.methodNotAllowed.statusCode, equals(405));
      expect(NetworkErrorType.notAcceptable.statusCode, equals(406));
      expect(
          NetworkErrorType.proxyAuthenticationRequired.statusCode, equals(407));
      expect(NetworkErrorType.requestTimeout.statusCode, equals(408));
      expect(NetworkErrorType.conflict.statusCode, equals(409));
      expect(NetworkErrorType.gone.statusCode, equals(410));
      expect(NetworkErrorType.lengthRequired.statusCode, equals(411));
      expect(NetworkErrorType.preconditionFailed.statusCode, equals(412));
      expect(NetworkErrorType.payloadTooLarge.statusCode, equals(413));
      expect(NetworkErrorType.uriTooLong.statusCode, equals(414));
      expect(NetworkErrorType.unsupportedMediaType.statusCode, equals(415));
      expect(NetworkErrorType.rangeNotSatisfiable.statusCode, equals(416));
      expect(NetworkErrorType.expectationFailed.statusCode, equals(417));
      expect(NetworkErrorType.imATeapot.statusCode, equals(418));
      expect(NetworkErrorType.authenticationTimeout.statusCode, equals(419));
      expect(NetworkErrorType.methodFailure.statusCode, equals(420));
      expect(NetworkErrorType.misdirectedRequest.statusCode, equals(421));
      expect(NetworkErrorType.unprocessableEntity.statusCode, equals(422));
      expect(NetworkErrorType.locked.statusCode, equals(423));
      expect(NetworkErrorType.failedDependency.statusCode, equals(424));
      expect(NetworkErrorType.upgradeRequired.statusCode, equals(426));
      expect(NetworkErrorType.preconditionRequired.statusCode, equals(428));
      expect(NetworkErrorType.tooManyRequests.statusCode, equals(429));
      expect(
          NetworkErrorType.requestHeaderFieldsTooLarge.statusCode, equals(431));
      expect(
          NetworkErrorType.unavailableForLegalReasons.statusCode, equals(451));
      expect(NetworkErrorType.clientClosedRequest.statusCode, equals(499));
      expect(NetworkErrorType.internalServerError.statusCode, equals(500));
      expect(NetworkErrorType.notImplemented.statusCode, equals(501));
      expect(NetworkErrorType.badGateway.statusCode, equals(502));
      expect(NetworkErrorType.serviceUnavailable.statusCode, equals(503));
      expect(NetworkErrorType.gatewayTimeout.statusCode, equals(504));
      expect(NetworkErrorType.httpVersionNotSupported.statusCode, equals(505));
    });

    test('fromStatusCode should return correct enum for valid input', () {
      expect(NetworkErrorType.fromStatusCode(1),
          equals(NetworkErrorType.requestCancelled));
      expect(NetworkErrorType.fromStatusCode(2),
          equals(NetworkErrorType.noInternetConnection));
      expect(NetworkErrorType.fromStatusCode(400),
          equals(NetworkErrorType.badRequest));
      expect(NetworkErrorType.fromStatusCode(401),
          equals(NetworkErrorType.unauthorized));
      expect(NetworkErrorType.fromStatusCode(402),
          equals(NetworkErrorType.paymentRequired));
      expect(NetworkErrorType.fromStatusCode(403),
          equals(NetworkErrorType.forbidden));
      expect(NetworkErrorType.fromStatusCode(404),
          equals(NetworkErrorType.notFound));
      expect(NetworkErrorType.fromStatusCode(405),
          equals(NetworkErrorType.methodNotAllowed));
      expect(NetworkErrorType.fromStatusCode(406),
          equals(NetworkErrorType.notAcceptable));
      expect(NetworkErrorType.fromStatusCode(407),
          equals(NetworkErrorType.proxyAuthenticationRequired));
      expect(NetworkErrorType.fromStatusCode(408),
          equals(NetworkErrorType.requestTimeout));
      expect(NetworkErrorType.fromStatusCode(409),
          equals(NetworkErrorType.conflict));
      expect(
          NetworkErrorType.fromStatusCode(410), equals(NetworkErrorType.gone));
      expect(NetworkErrorType.fromStatusCode(411),
          equals(NetworkErrorType.lengthRequired));
      expect(NetworkErrorType.fromStatusCode(412),
          equals(NetworkErrorType.preconditionFailed));
      expect(NetworkErrorType.fromStatusCode(413),
          equals(NetworkErrorType.payloadTooLarge));
      expect(NetworkErrorType.fromStatusCode(414),
          equals(NetworkErrorType.uriTooLong));
      expect(NetworkErrorType.fromStatusCode(415),
          equals(NetworkErrorType.unsupportedMediaType));
      expect(NetworkErrorType.fromStatusCode(416),
          equals(NetworkErrorType.rangeNotSatisfiable));
      expect(NetworkErrorType.fromStatusCode(417),
          equals(NetworkErrorType.expectationFailed));
      expect(NetworkErrorType.fromStatusCode(418),
          equals(NetworkErrorType.imATeapot));
      expect(NetworkErrorType.fromStatusCode(419),
          equals(NetworkErrorType.authenticationTimeout));
      expect(NetworkErrorType.fromStatusCode(420),
          equals(NetworkErrorType.methodFailure));
      expect(NetworkErrorType.fromStatusCode(421),
          equals(NetworkErrorType.misdirectedRequest));
      expect(NetworkErrorType.fromStatusCode(422),
          equals(NetworkErrorType.unprocessableEntity));
      expect(NetworkErrorType.fromStatusCode(423),
          equals(NetworkErrorType.locked));
      expect(NetworkErrorType.fromStatusCode(424),
          equals(NetworkErrorType.failedDependency));
      expect(NetworkErrorType.fromStatusCode(426),
          equals(NetworkErrorType.upgradeRequired));
      expect(NetworkErrorType.fromStatusCode(428),
          equals(NetworkErrorType.preconditionRequired));
      expect(NetworkErrorType.fromStatusCode(429),
          equals(NetworkErrorType.tooManyRequests));
      expect(NetworkErrorType.fromStatusCode(431),
          equals(NetworkErrorType.requestHeaderFieldsTooLarge));
      expect(NetworkErrorType.fromStatusCode(451),
          equals(NetworkErrorType.unavailableForLegalReasons));
      expect(NetworkErrorType.fromStatusCode(499),
          equals(NetworkErrorType.clientClosedRequest));
      expect(NetworkErrorType.fromStatusCode(500),
          equals(NetworkErrorType.internalServerError));
      expect(NetworkErrorType.fromStatusCode(501),
          equals(NetworkErrorType.notImplemented));
      expect(NetworkErrorType.fromStatusCode(502),
          equals(NetworkErrorType.badGateway));
      expect(NetworkErrorType.fromStatusCode(503),
          equals(NetworkErrorType.serviceUnavailable));
      expect(NetworkErrorType.fromStatusCode(504),
          equals(NetworkErrorType.gatewayTimeout));
      expect(NetworkErrorType.fromStatusCode(505),
          equals(NetworkErrorType.httpVersionNotSupported));
    });
  });
}
