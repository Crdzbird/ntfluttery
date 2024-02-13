import 'package:ntfluttery/src/models/enums/network_error_type.dart';
import 'package:ntfluttery/src/models/error/dio_exceptions.dart';

/// Extension on `Exception` to provide additional functionalities.
///
/// This extension adds a utility method to the `Exception` class
/// to extract meaningful error messages and types from exceptions, specifically
/// handling Dio exceptions.
extension ExceptionExtension on Exception {
  /// Retrieves a custom message and network error type from the exception.
  ///
  /// This method uses `DioExceptions` to interpret the exception, extracting
  /// a network error type and a custom error message, if applicable. If the
  /// error is identified as a custom type, it returns a detailed error message.
  /// Otherwise, it categorizes the error into one of the predefined network error types.
  ///
  /// - Returns: A tuple containing a `NetworkErrorType` (if not custom) and
  ///   a custom error message (if the error type is custom).
  ///
  /// Example:
  /// ```
  /// try {
  ///   // Some operation that might throw an exception
  /// } catch (e) {
  ///   var (errorType, errorMessage) = e.message;
  ///   // Handle the error based on type or message
  /// }
  /// ```
  (NetworkErrorType?, String? dioMessage) get message {
    final dioExceptions = DioExceptions(error: this);
    final networkType = dioExceptions.errorMessage;
    if (networkType == NetworkErrorType.custom) {
      return (null, dioExceptions.bodyErrorMessage);
    }
    return (networkType, null);
  }
}
