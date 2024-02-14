import 'dart:io';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:ntfluttery/src/models/enums/network_error_type.dart';
import 'package:ntfluttery/src/models/error/error_response.dart';

/// A class that handles exceptions related to Dio operations.
///
/// This class extends `Equatable` to facilitate value comparison and
/// provides custom exception handling mechanisms specific to Dio errors.
/// It translates Dio exceptions and other related errors into more
/// user-friendly forms, such as custom messages and error types.
class DioExceptions extends Equatable {
  /// Constructs a `DioExceptions` instance.
  ///
  /// Requires an [Exception] object to initialize.
  ///
  /// - [error]: The exception that occurred during Dio operations.
  const DioExceptions({required this.error}) : super();

  /// The exception that triggered the error handling.
  final Exception error;

  /// Retrieves a user-friendly error message from the Dio exception.
  ///
  /// This method extracts the error message from the Dio exception's response.
  /// If the response contains a map, it uses `ErrorResponse.fromMap` to parse
  /// the error. Otherwise, it falls back to a plain message extraction.
  ///
  /// - Returns: A string representing the user-friendly error message.
  String get bodyErrorMessage {
    if ((error as DioException).response?.data is Map) {
      final errorResponse = ErrorResponse.fromMap(
        (error as DioException).response?.data as Map<String, dynamic>,
      );
      return errorResponse.message.isEmpty
          ? errorResponse.msg
          : errorResponse.message;
    }
    final errorResponse = ErrorResponse.plainMessage(
        (error as DioException).response?.statusCode ?? 0,
        '${(error as DioException).response?.data}');
    return errorResponse.message;
  }

  /// Maps the Dio exception to a corresponding `NetworkErrorType`.
  ///
  /// This method categorizes Dio exceptions into various `NetworkErrorType`
  /// values based on the exception type and response content. It covers
  /// a range of standard network error types and custom error scenarios.
  ///
  /// - Returns: A `NetworkErrorType` value representing the error.
  NetworkErrorType get errorMessage {
    if (error is DioException) {
      final dioError = error as DioException;
      if (dioError.response?.data != null) {
        if (dioError.response?.data is Map) {
          final errorResponse = ErrorResponse.fromMap(
            dioError.response?.data as Map<String, dynamic>,
          );
          if (errorResponse.message.isNotEmpty ||
              errorResponse.msg.isNotEmpty) {
            return NetworkErrorType.custom;
          }
        }
        if (dioError.response?.data is String) {
          final errorResponse = ErrorResponse.plainMessage(
              dioError.response?.statusCode ?? 0, '${dioError.response?.data}');
          if (errorResponse.message.isNotEmpty ||
              errorResponse.msg.isNotEmpty) {
            return NetworkErrorType.custom;
          }
          if (errorResponse.statusCode != 0) {
            return NetworkErrorType.custom;
          }
        }
      }
      switch (dioError.type) {
        case DioExceptionType.cancel:
          return NetworkErrorType.requestCancelled;
        case DioExceptionType.connectionTimeout:
          return NetworkErrorType.networkConnectTimeoutError;
        case DioExceptionType.receiveTimeout:
          return NetworkErrorType.networkReceiveTimeoutError;
        case DioExceptionType.badCertificate:
          return NetworkErrorType.badCertificate;
        case DioExceptionType.sendTimeout:
          return NetworkErrorType.networkSendTimeoutError;
        case DioExceptionType.badResponse:
          return NetworkErrorType.badResponse;
        case DioExceptionType.connectionError:
          return NetworkErrorType.connectionError;
        case DioExceptionType.unknown:
          if (dioError.response != null &&
              dioError.response!.statusCode != null) {
            return NetworkErrorType.fromStatusCode(
              dioError.response!.statusCode!,
            );
          }
      }
    }
    if (error is SocketException) {
      return NetworkErrorType.noInternetConnection;
    }
    return NetworkErrorType.unknownError;
  }

  /// Provides the list of properties to be used by Equatable for value comparison.
  ///
  /// Overrides the `props` getter from Equatable to include the `error` field.
  ///
  /// - Returns: A list containing the [error] field for comparison.
  @override
  List<Object?> get props => [error];
}
