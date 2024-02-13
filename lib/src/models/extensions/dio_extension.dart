import 'package:dio/dio.dart';
import 'package:ntfluttery/src/models/credentials.dart';
import 'package:ntfluttery/src/service/dio_interceptor.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

/// Extension on `Dio` to add custom interceptor functionalities.
///
/// This extension augments the `Dio` class with additional methods
/// for managing interceptors, specifically for logging and handling
/// credentials-related tasks.
extension DioInterceptors on Dio {
  /// Adds a `PrettyDioLogger` to Dio's interceptors.
  ///
  /// This method enables detailed logging for Dio requests and responses,
  /// including headers and body. It is useful for debugging purposes.
  void addInterceptors() => interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseHeader: true,
        ),
      );

  /// Adds a custom `DioInterceptor` to Dio's interceptors.
  ///
  /// This method adds an instance of `DioInterceptor`, passing optional
  /// [credentials]. The interceptor can be used for tasks like
  /// authentication handling, token refreshing, etc.
  ///
  /// - [credentials]: Optional `Credentials` instance to be used by the interceptor.
  void addWatcher(Credentials? credentials) =>
      interceptors.add(DioInterceptor(credentials: credentials));
}
