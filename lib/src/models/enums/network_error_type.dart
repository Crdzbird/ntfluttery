/// Enum representing various network error types.
///
/// This enumeration categorizes network errors primarily based on HTTP status codes,
/// along with some additional custom error types for more specific scenarios.
enum NetworkErrorType {
  requestCancelled(1),
  noInternetConnection(2),
  badRequest(400),
  unauthorized(401),
  paymentRequired(402),
  forbidden(403),
  notFound(404),
  methodNotAllowed(405),
  notAcceptable(406),
  proxyAuthenticationRequired(407),
  requestTimeout(408),
  conflict(409),
  gone(410),
  lengthRequired(411),
  preconditionFailed(412),
  payloadTooLarge(413),
  uriTooLong(414),
  unsupportedMediaType(415),
  rangeNotSatisfiable(416),
  expectationFailed(417),
  imATeapot(418),
  authenticationTimeout(419),
  methodFailure(420),
  misdirectedRequest(421),
  unprocessableEntity(422),
  locked(423),
  failedDependency(424),
  upgradeRequired(426),
  preconditionRequired(428),
  tooManyRequests(429),
  requestHeaderFieldsTooLarge(431),
  unavailableForLegalReasons(451),
  clientClosedRequest(499),
  internalServerError(500),
  notImplemented(501),
  badGateway(502),
  serviceUnavailable(503),
  gatewayTimeout(504),
  httpVersionNotSupported(505),
  variantAlsoNegotiates(506),
  insufficientStorage(507),
  loopDetected(508),
  notExtended(510),
  networkAuthenticationRequired(511),
  badResponse(520),
  connectionError(522),
  badCertificate(526),
  networkConnectTimeoutError(598),
  networkReceiveTimeoutError(599),
  networkSendTimeoutError(599),
  networkRequestCancelled(499),
  custom(999),
  unknownError(0);

  /// Constructs a `NetworkErrorType` instance with a specific status code.
  ///
  /// Each error type is associated with a unique numeric status code.
  const NetworkErrorType(this.statusCode);

  /// The numeric status code representing the network error type.
  final int statusCode;

  /// Retrieves the `NetworkErrorType` corresponding to a given status code.
  ///
  /// This method attempts to map a provided integer [statusCode] to a
  /// `NetworkErrorType`. If no matching type is found, it defaults to `null`.
  ///
  /// - [statusCode]: The status code to be converted into a `NetworkErrorType`.
  /// - Returns: The corresponding `NetworkErrorType` instance or `null` if
  ///   no match is found.
  static NetworkErrorType fromStatusCode(int statusCode) =>
      NetworkErrorType.values.firstWhere(
        (e) => e.statusCode == statusCode,
      );
}
