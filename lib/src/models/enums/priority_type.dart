/// Enum representing various priority levels.
///
/// This enumeration is used to categorize different levels of priority,
/// ranging from minimum to maximum.
enum PriorityType {
  /// The minimum priority level.
  min(1),

  /// A low priority level.
  low(2),

  /// Indicates no specific priority (neutral).
  none(3),

  /// A high priority level.
  high(4),

  /// The maximum priority level.
  max(5);

  /// Constructs a `PriorityType` instance with a specific integer value.
  ///
  /// Each priority level is associated with a unique integer value.
  const PriorityType(this.type);

  /// The integer value representing the priority level.
  final int type;

  /// Retrieves the `PriorityType` corresponding to a given integer value.
  ///
  /// This method attempts to map a provided integer [value] to a `PriorityType`.
  /// If no matching type is found, it defaults to `PriorityType.none`.
  ///
  /// - [value]: The integer value to be converted into a `PriorityType`.
  /// - Returns: The corresponding `PriorityType` instance or `PriorityType.none`
  ///   if no match is found.
  static fromValue(int value) => PriorityType.values.firstWhere(
        (e) => e.type == value,
        orElse: () => PriorityType.none,
      );

  /// Retrieves the `PriorityType` corresponding to a given string representation.
  ///
  /// This method attempts to map a string representation [value] to a `PriorityType`.
  /// If no matching type is found, it defaults to `PriorityType.none`.
  ///
  /// - [value]: The string representation of the `PriorityType` to be converted.
  /// - Returns: The corresponding `PriorityType` instance or `PriorityType.none`
  ///   if no match is found.
  static fromString(String value) => PriorityType.values.firstWhere(
        (e) => e.toString() == value,
        orElse: () => PriorityType.none,
      );
}
