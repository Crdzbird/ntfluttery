import 'package:equatable/equatable.dart';
import 'package:ntfluttery/src/models/enums/network_error_type.dart';

/// A base class representing a failure.
///
/// This abstract class is intended to be extended by specific types of failures.
/// It extends `Equatable` to facilitate value comparison.
abstract class Failure extends Equatable {
  /// Provides a list of properties for value comparison.
  ///
  /// Overrides the `props` getter from `Equatable`. Since `Failure` is a base class,
  /// it returns an empty list by default.
  @override
  List<Object> get props => [];
}

/// A class representing server-related failures.
///
/// This class extends `Failure` to specify failures that originate from server interactions,
/// such as network errors or API failures.
class ServerFailure extends Failure {
  /// Constructs a `ServerFailure`.
  ///
  /// - [errorMessage]: A tuple-like object containing details about the error,
  ///   including the network error type and a specific error message from Dio.
  ServerFailure({required this.errorMessage});

  /// The error message associated with the server failure.
  ///
  /// It may contain a `NetworkErrorType` indicating the type of network error,
  /// and/or a specific error message from the Dio package.
  final (NetworkErrorType? networkErrorType, String? dioError) errorMessage;

  /// Provides a list of properties for value comparison.
  ///
  /// Overrides the `props` getter from `Equatable` to include `errorMessage`.
  @override
  List<Object> get props => [errorMessage];
}
