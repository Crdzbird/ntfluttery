/// Extension on `DateTime` to provide additional functionalities.
///
/// This extension adds utility methods to the `DateTime` class
/// that are not available in the standard library.
extension DateTimeExtension on DateTime {
  /// Converts the `DateTime` instance to a Unix timestamp.
  ///
  /// This method converts the `DateTime` instance to UTC and then
  /// calculates the Unix timestamp (the number of seconds since
  /// the Unix epoch at 00:00:00 UTC on 1 January 1970).
  ///
  /// - Returns: The Unix timestamp as an integer.
  int get toUnix => toUtc().millisecondsSinceEpoch ~/ 1000;
}
