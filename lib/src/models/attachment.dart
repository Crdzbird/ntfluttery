import 'dart:convert';

import 'package:equatable/equatable.dart';

/// A class representing an attachment with a name and a URL.
///
/// This class extends `Equatable` to facilitate value comparison.
/// It is designed to hold information about an attachment, typically used
/// in the context of messages or documents.
class Attachment extends Equatable {
  /// The name of the attachment.
  final String name;

  /// The URL pointing to the attachment's location.
  final String url;

  /// Constructs an `Attachment`.
  ///
  /// - [name]: The name of the attachment. Defaults to an empty string if not provided.
  /// - [url]: The URL of the attachment. Defaults to an empty string if not provided.
  const Attachment({
    this.name = '',
    this.url = '',
  });

  /// Creates an `Attachment` from a JSON string.
  ///
  /// This factory constructor parses a JSON string to extract `name` and `url`.
  ///
  /// - [data]: The JSON string containing the attachment data.
  /// - Returns: An `Attachment` instance.
  factory Attachment.fromJson(String data) =>
      Attachment.fromMap(json.decode(data) as Map<String, dynamic>);

  /// Creates an `Attachment` from a map of key-value pairs.
  ///
  /// This factory constructor extracts `name` and `url` from a map.
  ///
  /// - [data]: The map containing the attachment data.
  /// - Returns: An `Attachment` instance.
  factory Attachment.fromMap(Map<String, dynamic> data) => Attachment(
        name: data['name'] as String? ?? '',
        url: data['url'] as String? ?? '',
      );

  /// Converts the `Attachment` to a map of key-value pairs.
  ///
  /// Useful for serialization.
  Map<String, dynamic> get toMap => {
        'name': name,
        'url': url,
      };

  /// Converts the `Attachment` to a JSON string.
  ///
  /// Useful for serialization.
  String get toJson => json.encode(toMap);

  /// Creates a copy of this attachment with modified fields.
  ///
  /// Allows for creating a new `Attachment` instance with some updated fields
  /// while keeping others from the current instance.
  ///
  /// - [name]: An optional new name.
  /// - [url]: An optional new URL.
  /// - Returns: A new `Attachment` instance.
  Attachment copyWith({
    String? name,
    String? url,
  }) =>
      Attachment(
        name: name ?? this.name,
        url: url ?? this.url,
      );

  /// Determines whether to stringify the attachment.
  ///
  /// Overridden from `Equatable`. When true, the `toString` method will
  /// return a string representation of the attachment.
  @override
  bool get stringify => true;

  /// Provides a list of properties for value comparison.
  ///
  /// Overrides the `props` getter from `Equatable` to include `name` and `url`
  /// for comparison purposes.
  @override
  List<Object?> get props => [name, url];
}
