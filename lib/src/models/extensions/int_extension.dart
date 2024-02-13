/// Extension on `int` to provide additional functionalities.
///
/// This extension adds a utility method to the `int` class to convert
/// an integer representing a Unix timestamp to a `DateTime` object.
extension IntExtension on int {
  /// Converts the integer (assumed to be a Unix timestamp) to a `DateTime` object.
  ///
  /// A Unix timestamp is the number of seconds that have elapsed since the Unix epoch
  /// (midnight UTC of 1 January 1970). This method converts the Unix timestamp to
  /// a `DateTime` object representing the same point in time.
  ///
  /// - Returns: A `DateTime` object corresponding to the Unix timestamp.
  ///
  /// Example:
  /// ```
  /// var unixTimestamp = 1633072800; // Example Unix timestamp
  /// var dateTime = unixTimestamp.toDateTimeFromUnix;
  /// print(dateTime); // Prints the corresponding DateTime object
  /// ```
  DateTime get toDateTimeFromUnix =>
      DateTime.fromMillisecondsSinceEpoch(this * 1000);
}
