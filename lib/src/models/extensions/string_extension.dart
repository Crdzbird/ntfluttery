import 'dart:convert';

/// Extension on `String` to provide additional functionalities.
///
/// This extension adds a utility method to the `String` class to parse
/// potentially multiple JSON objects contained within a single string.
extension StringExtension on String {
  /// Separates and parses multiple JSON objects within the string.
  ///
  /// This method is useful when the string contains several JSON objects
  /// concatenated together without delimiters. It separates these JSON objects
  /// and attempts to parse each one into a `Map<String, dynamic>`.
  ///
  /// - Returns: A list of `Map<String, dynamic>` representing the parsed JSON objects.
  ///   If the string is empty or parsing fails, an empty list is returned.
  ///
  /// Example:
  /// ```
  /// var jsonString = '{"name":"John"}{"age":30}';
  /// var jsonObjects = jsonString.separateAndParseJson;
  /// for (var jsonObj in jsonObjects) {
  ///   print(jsonObj); // Prints each parsed JSON object
  /// }
  /// ```
  List<Map<String, dynamic>> get separateAndParseJson {
    if (isEmpty) return [];
    List<Map<String, dynamic>> jsonObjects = [];
    int openBrackets = 0;
    int start = 0;
    for (int i = 0; i < length; i++) {
      if (this[i] == '{') {
        if (openBrackets == 0) start = i;
        openBrackets++;
      }
      if (this[i] == '}') {
        openBrackets--;
        if (openBrackets == 0) {
          var jsonStr = substring(start, i + 1);
          try {
            jsonObjects.add(json.decode(jsonStr));
          } catch (e) {
            print('Error parsing JSON: $e');
          }
        }
      }
    }
    return jsonObjects;
  }
}
