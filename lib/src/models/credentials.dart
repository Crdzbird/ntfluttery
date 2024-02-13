import 'dart:convert';

import 'package:equatable/equatable.dart';

/// A class representing user credentials with a username and a password.
///
/// This class extends `Equatable` to facilitate value comparison and
/// is typically used for authentication purposes.
class Credentials extends Equatable {
  /// The username associated with the credentials.
  final String username;

  /// The password associated with the credentials.
  final String password;

  /// Constructs `Credentials` with optional username and password.
  ///
  /// If not provided, both `username` and `password` default to empty strings.
  const Credentials({
    this.username = '',
    this.password = '',
  });

  /// Creates `Credentials` from a JSON string.
  ///
  /// This factory constructor parses a JSON string to extract `username` and `password`.
  ///
  /// - [data]: The JSON string containing the credentials.
  /// - Returns: A `Credentials` instance.
  factory Credentials.fromJson(String data) =>
      Credentials.fromMap(json.decode(data) as Map<String, dynamic>);

  /// Creates `Credentials` from a map of key-value pairs.
  ///
  /// This factory constructor extracts `username` and `password` from a map.
  ///
  /// - [data]: The map containing the credentials.
  /// - Returns: A `Credentials` instance.
  factory Credentials.fromMap(Map<String, dynamic> data) => Credentials(
        username: data['username'] as String? ?? '',
        password: data['password'] as String? ?? '',
      );

  /// Converts the `Credentials` to a map of key-value pairs.
  ///
  /// Useful for serialization.
  Map<String, dynamic> get toMap => {
        'username': username,
        'password': password,
      };

  /// Converts the `Credentials` to a JSON string.
  ///
  /// Useful for serialization.
  String get toJson => json.encode(toMap);

  /// Encodes the `Credentials` into a Basic Authentication header string.
  ///
  /// - Returns: A base64-encoded string representing the `username` and `password`
  ///   formatted for Basic Authentication.
  String get basicAuth =>
      'Basic ${base64Encode(utf8.encode('$username:$password'))}';

  /// Creates a copy of this credentials with modified fields.
  ///
  /// Allows for creating a new `Credentials` instance with some updated fields
  /// while keeping others from the current instance.
  ///
  /// - [username]: An optional new username.
  /// - [password]: An optional new password.
  /// - Returns: A new `Credentials` instance.
  Credentials copyWith({
    String? username,
    String? password,
  }) =>
      Credentials(
        username: username ?? this.username,
        password: password ?? this.password,
      );

  /// Determines whether to stringify the credentials.
  ///
  /// Overridden from `Equatable`. When true, the `toString` method will
  /// return a string representation of the credentials.
  @override
  bool get stringify => true;

  /// Provides a list of properties for value comparison.
  ///
  /// Overrides the `props` getter from `Equatable` to include `username` and `password`
  /// for comparison purposes.
  @override
  List<Object?> get props => [username, password];
}
