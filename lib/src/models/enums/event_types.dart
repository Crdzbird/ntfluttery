/// Enum representing different types of events.
///
/// This enum is used to categorize various events by their type.
enum EventTypes {
  /// Event type for 'open' events.
  open('open'),

  /// Event type for 'keepAlive' events.
  keepAlive('keepAlive'),

  /// Event type for 'message' events.
  message('message'),

  /// Event type for 'pollRequest' events.
  pollRequest('pollRequest'),

  /// Represents a lack of an event or an undefined event type.
  none('none');

  /// Constructs an `EventTypes` instance.
  ///
  /// Each event type is associated with a [String] value that
  /// represents the event.
  const EventTypes(this.event);

  /// The string representation of the event type.
  final String event;

  /// Creates an `EventTypes` from a [String] value.
  ///
  /// This method maps a string value to an `EventTypes` instance. If the
  /// provided [value] does not correspond to any event type, it defaults
  /// to [EventTypes.none].
  ///
  /// - [value]: The string value to convert to an `EventTypes`.
  /// - Returns: The corresponding `EventTypes` instance.
  static fromValue(String value) => EventTypes.values.firstWhere(
        (e) => e.event == value,
        orElse: () => EventTypes.none,
      );
}
