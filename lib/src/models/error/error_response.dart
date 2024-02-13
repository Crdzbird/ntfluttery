import 'dart:convert';

import 'package:equatable/equatable.dart';

/// A class representing the structure of an error response.
///
/// This class defines the common structure for error responses, including
/// status code and error messages. It extends `Equatable` for value comparison
/// and provides methods for creating `ErrorResponse` instances from different
/// sources like JSON strings or maps, as well as utility methods for serialization.
class ErrorResponse extends Equatable {
  /// Constructs a default `ErrorResponse`.
  ///
  /// Optionally, a status code and error messages can be provided.
  ///
  /// - [statusCode]: The HTTP status code of the error (defaults to 0).
  /// - [message]: A descriptive error message (defaults to an empty string).
  /// - [msg]: An alternative error message (defaults to an empty string).
  const ErrorResponse({this.statusCode = 0, this.message = '', this.msg = ''});

  /// Creates an `ErrorResponse` from a JSON string.
  ///
  /// Attempts to decode the provided JSON string into an `ErrorResponse`.
  /// If decoding fails, it returns a default `ErrorResponse`.
  ///
  /// - [data]: The JSON string to decode.
  /// - Returns: An `ErrorResponse` object.
  factory ErrorResponse.fromJson(String? data) {
    try {
      return data == null || data.isEmpty
          ? const ErrorResponse()
          : ErrorResponse.fromMap(json.decode(data) as Map<String, dynamic>);
    } catch (_) {
      return const ErrorResponse();
    }
  }

  /// Creates an `ErrorResponse` with a plain message.
  ///
  /// Useful for creating an error response with a specific status code and message.
  ///
  /// - [statusCode]: The HTTP status code of the error.
  /// - [message]: The error message.
  /// - Returns: An `ErrorResponse` object.
  factory ErrorResponse.plainMessage(int statusCode, String? message) =>
      ErrorResponse(statusCode: statusCode, message: message ?? '');

  /// Creates an `ErrorResponse` from a map.
  ///
  /// Decodes a map into an `ErrorResponse` object.
  ///
  /// - [data]: The map containing error response data.
  /// - Returns: An `ErrorResponse` object.
  factory ErrorResponse.fromMap(Map<String, dynamic> data) => ErrorResponse(
        statusCode: data['statusCode'] as int? ?? 0,
        message: data['Message'] as String? ?? data['message'] as String? ?? '',
        msg: data['msg'] as String? ?? '',
      );

  /// The HTTP status code associated with the error.
  final int statusCode;

  /// The primary error message.
  final String message;

  /// An alternative error message.
  final String msg;

  /// Converts the error response to a map.
  ///
  /// Useful for serialization to a map format.
  Map<String, dynamic> get toMap => {
        'statusCode': statusCode,
        'Message': message,
        'msg': msg,
      };

  /// Converts the error response to a JSON string.
  ///
  /// Useful for serialization to a JSON format.
  String get toJson => json.encode(toMap);

  /// Creates a copy of this error response with modified fields.
  ///
  /// Allows for creating a new `ErrorResponse` instance with some updated fields
  /// while keeping others from the current instance.
  ///
  /// - [statusCode]: An optional new status code.
  /// - [message]: An optional new message.
  /// - [msg]: An optional new alternative message.
  /// - Returns: A new `ErrorResponse` instance.
  ErrorResponse copyWith({
    int? statusCode,
    String? message,
    String? msg,
  }) =>
      ErrorResponse(
        statusCode: statusCode ?? this.statusCode,
        message: message ?? this.message,
        msg: msg ?? this.msg,
      );

  /// Determines whether to stringify the error response.
  ///
  /// Overridden from `Equatable`. When true, the `toString` method will
  /// return a string representation of the error response.
  @override
  bool get stringify => true;

  /// Provides a list of properties for value comparison.
  ///
  /// Overrides the `props` getter from `Equatable` to include `statusCode`,
  /// `message`, and `msg` for comparison purposes.
  @override
  List<Object?> get props => [statusCode, message, msg];
}
