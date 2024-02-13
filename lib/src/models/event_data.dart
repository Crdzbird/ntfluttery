import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:ntfluttery/src/models/attachment.dart';
import 'package:ntfluttery/src/models/enums/event_types.dart';
import 'package:ntfluttery/src/models/enums/priority_type.dart';
import 'package:ntfluttery/src/models/extensions/datetime_extension.dart';
import 'package:ntfluttery/src/models/extensions/int_extension.dart';

/// A class representing event data with various attributes.
///
/// This class extends `Equatable` to facilitate value comparison.
/// It is designed to hold detailed information about an event, including
/// time, type, priority, and associated metadata.
class EventData extends Equatable {
  final String id;
  final DateTime time;
  final DateTime expires;
  final EventTypes event;
  final String topic;
  final String title;
  final String message;
  final PriorityType priority;
  final List<String> tags;
  final String click;
  final Attachment attachment;

  /// Constructs an `EventData`.
  ///
  /// - [id]: A unique identifier for the event.
  /// - [time]: The time at which the event occurs.
  /// - [expires]: The expiration time of the event.
  /// - [event]: The type of event.
  /// - [topic]: The topic associated with the event.
  /// - [title]: The title of the event.
  /// - [message]: The message or description of the event.
  /// - [priority]: The priority level of the event.
  /// - [tags]: A list of tags associated with the event.
  /// - [click]: A click action or URL associated with the event.
  /// - [attachment]: An attachment related to the event.
  EventData({
    this.id = '',
    DateTime? time,
    DateTime? expires,
    this.event = EventTypes.none,
    this.topic = '',
    this.title = '',
    this.message = '',
    this.priority = PriorityType.none,
    this.tags = const [],
    this.click = '',
    this.attachment = const Attachment(),
  })  : time = time ?? DateTime.now(),
        expires = expires ?? DateTime.now();

  /// Creates an `EventData` from a map of key-value pairs.
  ///
  /// - [data]: The map containing the event data.
  /// - Returns: An `EventData` instance.
  factory EventData.fromMap(Map<String, dynamic> data) => EventData(
        id: data['id'] as String? ?? '',
        time: data['time'] == null
            ? DateTime.now()
            : int.parse('${data['time']}').toDateTimeFromUnix,
        expires: data['expires'] == null
            ? DateTime.now()
            : int.parse('${data['expires']}').toDateTimeFromUnix,
        event: EventTypes.fromValue(data['event']),
        topic: data['topic'] as String? ?? '',
        title: data['title'] as String? ?? '',
        message: data['message'] as String? ?? '',
        priority:
            PriorityType.fromValue(int.tryParse('${data['priority']}') ?? 0),
        tags: (data['tags'] as List<dynamic>?)
                ?.map((e) => e as String)
                .toList() ??
            [],
        click: data['click'] as String? ?? '',
        attachment: data['attachment'] == null
            ? const Attachment()
            : Attachment.fromMap(data['attachment'] as Map<String, dynamic>),
      );

  /// Creates an `EventData` from a JSON string.
  ///
  /// - [data]: The JSON string containing the event data.
  /// - Returns: An `EventData` instance.
  factory EventData.fromJson(String data) =>
      EventData.fromMap(json.decode(data) as Map<String, dynamic>);

  /// Converts the `EventData` to a map of key-value pairs.
  ///
  /// Useful for serialization.
  Map<String, dynamic> get toMap => {
        'id': id,
        'time': time.toUnix,
        'expires': expires.toUnix,
        'event': event.event,
        'topic': topic,
        'title': title,
        'message': message,
        'priority': priority.type,
        'tags': tags,
        'click': click,
        'attachment': attachment.toMap,
      };

  /// Converts the `EventData` to a JSON string.
  ///
  /// Useful for serialization.
  String get toJson => jsonEncode(toMap);

  /// Creates a list of `EventData` instances from a list of dynamic objects.
  ///
  /// - [data]: The list of dynamic objects representing event data.
  /// - Returns: A list of `EventData` instances.
  static List<EventData> fromList(List<dynamic> data) =>
      data.map((e) => EventData.fromMap(e as Map<String, dynamic>)).toList();

  /// Creates a copy of this event data with modified fields.
  ///
  /// - [Implementation details for each field]
  /// - Returns: A new `EventData` instance.
  EventData copyWith({
    String? id,
    DateTime? time,
    DateTime? expires,
    EventTypes? event,
    String? topic,
    String? title,
    String? message,
    PriorityType? priority,
    List<String>? tags,
    String? click,
    Attachment? attachment,
  }) =>
      EventData(
        id: id ?? this.id,
        time: time ?? this.time,
        expires: expires ?? this.expires,
        event: event ?? this.event,
        topic: topic ?? this.topic,
        title: title ?? this.title,
        message: message ?? this.message,
        priority: priority ?? this.priority,
        tags: tags ?? this.tags,
        click: click ?? this.click,
        attachment: attachment ?? this.attachment,
      );

  /// Provides a list of properties for value comparison.
  ///
  /// Overrides the `props` getter from `Equatable`.
  @override
  List<Object?> get props => [
        id,
        time,
        expires,
        event,
        topic,
        title,
        message,
        priority,
        tags,
        click,
        attachment
      ];

  /// Determines whether to stringify the event data.
  ///
  /// Overridden from `Equatable`. When true, the `toString` method will
  /// return a string representation of the event data.
  @override
  bool get stringify => true;
}
