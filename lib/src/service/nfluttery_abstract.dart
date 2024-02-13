import 'package:dio/dio.dart';
import 'package:ntfluttery/src/models/error/failure.dart';
import 'package:ntfluttery/src/models/event_data.dart';

/// Abstract class representing the core functionalities of the Nfluttery service.
///
/// This class defines a set of methods for interacting with an API, including
/// fetching and posting data, and configuring the service.
abstract class NflutteryAbstract {
  /// Creates and configures the service.
  ///
  /// This method is used to initialize and configure the service, such as
  /// enabling logging.
  ///
  /// - [showLog]: A boolean indicating whether to show log messages.
  void addLogging(bool showLog);

  /// Fetches data from the given path and returns a stream of `EventData` and potential failure.
  ///
  /// This method makes an asynchronous GET request to the specified path and
  /// returns a stream of `EventData` along with a possible `Failure` instance if an error occurs.
  ///
  /// - [path]: The API endpoint path.
  /// - [queryParameters]: Optional query parameters.
  /// - [options]: Optional Dio request options.
  /// - Returns: A Future of a tuple containing a Stream of `EventData` and a `Failure` instance.
  Future<
      (
        Stream<(List<EventData> messages, List<EventData> openMessages)>,
        Failure? failure,
      )> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  });

  /// Fetches the latest message from the given path.
  ///
  /// Makes an asynchronous GET request to the specified path and retrieves
  /// the latest `EventData`.
  ///
  /// - [path]: The API endpoint path.
  /// - [queryParameters]: Optional query parameters.
  /// - [options]: Optional Dio request options.
  /// - Returns: A Future of the latest `EventData`.
  Future<EventData> getLatestMessage(String path,
      {Map<String, dynamic>? queryParameters, Options? options});

  /// Fetches messages from the given path and returns them in a tuple format.
  ///
  /// This method retrieves a list of `EventData` messages and open messages.
  ///
  /// - [path]: The API endpoint path.
  /// - [queryParameters]: Optional query parameters.
  /// - [options]: Optional Dio request options.
  /// - Returns: A Future of a tuple containing lists of messages and open messages.
  Future<(List<EventData> messages, List<EventData> openMessages)>
      getTupledMessages(String path,
          {Map<String, dynamic>? queryParameters, Options? options});

  /// Fetches all messages from the given path.
  ///
  /// - [path]: The API endpoint path.
  /// - [queryParameters]: Optional query parameters.
  /// - [options]: Optional Dio request options.
  /// - Returns: A Future of a list of `EventData` representing all messages.
  Future<List<EventData>> getAllMessages(String path,
      {Map<String, dynamic>? queryParameters, Options? options});

  /// Fetches open messages from the given path.
  ///
  /// Open messages are those that are currently active or relevant.
  ///
  /// - [path]: The API endpoint path.
  /// - [queryParameters]: Optional query parameters.
  /// - [options]: Optional Dio request options.
  /// - Returns: A Future of a list of `EventData` representing open messages.
  Future<List<EventData>> getOpenMessages(String path,
      {Map<String, dynamic>? queryParameters, Options? options});

  /// Fetches lists of expired and unexpired (open) messages from the given path.
  ///
  /// This method makes an asynchronous GET request to the specified path and
  /// retrieves two lists of `EventData` instances. The first list contains messages
  /// that have expired (i.e., their `expires` field is before the current time),
  /// and the second list contains messages that are unexpired (i.e., their `expires`
  /// field is after the current time).
  ///
  /// - [path]: The API endpoint path.
  /// - [queryParameters]: Optional query parameters.
  /// - [options]: Optional Dio request options.
  /// - Returns: A Future of a tuple containing two lists of `EventData` instances:
  ///   one for expired messages and one for unexpired messages.
  ///
  /// Example:
  /// ```
  /// var path = "api/messages";
  /// var response = await nflutteryAbstract.getExpiredUnexpiredMessages(path);
  /// var expiredMessages = response.item1;
  /// var unexpiredMessages = response.item2;
  /// ```
  Future<(List<EventData>, List<EventData>)> getExpiredUnexpiredMessages(
      String path,
      {Map<String, dynamic>? queryParameters,
      Options? options});

  /// Fetches unread messages from the given path.
  ///
  /// Unread messages are those that haven't been marked as read or seen by the user.
  ///
  /// - [path]: The API endpoint path.
  /// - [queryParameters]: Optional query parameters.
  /// - [options]: Optional Dio request options.
  /// - Returns: A Future of a list of `EventData` representing unread messages.
  Future<List<EventData>> getUnreadMessages(String path,
      {Map<String, dynamic>? queryParameters, Options? options});

  /// Makes a POST request to the given path.
  ///
  /// This method posts data to the specified path and retrieves the response.
  ///
  /// - [path]: The API endpoint path.
  /// - [data]: The data to post.
  /// - [queryParameters]: Optional query parameters.
  /// - [options]: Optional Dio request options.
  /// - Returns: A Future of a `Response` of type `T`.
  Future<Response<T>> post<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  });

  /// Creates a stream from a GET request to the given path.
  ///
  /// This method streams data from the specified path, providing continuous updates.
  ///
  /// - [path]: The API endpoint path.
  /// - [queryParameters]: Optional query parameters.
  /// - [options]: Optional Dio request options.
  /// - Returns: A Stream of `Response` of type `T`.
  Stream<Response<T>> getStream<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  });
}
