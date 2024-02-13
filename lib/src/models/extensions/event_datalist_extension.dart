import 'package:ntfluttery/src/models/enums/event_types.dart';
import 'package:ntfluttery/src/models/event_data.dart';

/// Extension on `List<EventData>` to provide additional functionalities.
///
/// This extension adds utility methods to the `List<EventData>` class
/// for filtering, sorting, and retrieving specific types of `EventData`.
extension EventDataListExtension on List<EventData> {
  /// Filters the list to include only open messages.
  ///
  /// Open messages are defined as those whose `expires` field is after the current time.
  ///
  /// Example:
  /// ```
  /// var eventList = [
  ///   EventData(expires: DateTime.now().add(Duration(days: 1)), ...),
  ///   EventData(expires: DateTime.now().subtract(Duration(days: 1)), ...)
  /// ];
  /// var openMessages = eventList.openMessages;
  /// ```
  List<EventData> get openMessages =>
      where((element) => element.expires.isAfter(DateTime.now())).toList();

  /// Filters the list to include only messages that have already expired.
  ///
  /// Expired messages are defined as those whose `expires` field is before the current time.
  ///
  /// Example:
  /// ```
  /// var eventList = [
  ///   EventData(expires: DateTime.now().add(Duration(days: 1)), ...),
  ///   EventData(expires: DateTime.now().subtract(Duration(days: 1)), ...)
  /// ];
  /// var messages = eventList.messages;
  /// ```
  List<EventData> get messages =>
      where((element) => element.expires.isBefore(DateTime.now())).toList();

  /// Sorts the list of `EventData` by time in descending order.
  ///
  /// Example:
  /// ```
  /// var eventList = [
  ///   EventData(time: DateTime.now().subtract(Duration(hours: 2)), ...),
  ///   EventData(time: DateTime.now().add(Duration(hours: 1)), ...)
  /// ];
  /// var sortedByTime = eventList.sortedByTime;
  /// ```
  List<EventData> get sortedByTime =>
      this..sort((a, b) => b.time.compareTo(a.time));

  /// Sorts the list of `EventData` by priority in descending order.
  /// The priority is defined by the `Priority` enum.
  /// The order is `Priority.high`, `Priority.medium`, `Priority.low`.
  /// If the priority is the same, the messages are sorted by time.
  ///
  /// Example:
  /// ```
  /// var eventList = [
  ///  EventData(priority: Priority.low, time: DateTime.now().subtract(Duration(hours: 2)), ...),
  /// EventData(priority: Priority.high, time: DateTime.now().add(Duration(hours: 1)), ...)
  /// ];
  /// var sortedByPriority = eventList.sortedByPriority;
  /// ```
  List<EventData> get sortedByPriority =>
      this..sort((a, b) => b.priority.index.compareTo(a.priority.index));

  /// Sorts the list of `EventData` by topic in ascending order.
  ///
  /// Example:
  /// ```
  /// var eventList = [
  ///  EventData(topic: 'topicB', ...),
  /// EventData(topic: 'topicA', ...)
  /// ];
  /// var sortedByTopic = eventList.sortedByTopic;
  /// ```
  List<EventData> get sortedByTopic =>
      this..sort((a, b) => a.topic.compareTo(b.topic));

  /// Sorts the list of `EventData` by event in ascending order.
  ///
  /// Example:
  /// ```
  /// var eventList = [
  /// EventData(event: Event.message, ...),
  /// EventData(event: Event.alert, ...)
  /// ];
  /// var sortedByEvent = eventList.sortedByEvent;
  /// ```
  List<EventData> get sortedByEvent =>
      this..sort((a, b) => a.event.index.compareTo(b.event.index));

  /// Sorts the list of `EventData` by title in ascending order.
  ///
  /// Example:
  /// ```
  /// var eventList = [
  /// EventData(title: 'titleB', ...),
  /// EventData(title: 'titleA', ...)
  /// ];
  /// var sortedByTitle = eventList.sortedByTitle;
  /// ```
  List<EventData> get sortedByTitle =>
      this..sort((a, b) => a.title.compareTo(b.title));

  /// Sorts the list of `EventData` by message in ascending order.
  ///
  /// Example:
  /// ```
  /// var eventList = [
  /// EventData(message: 'messageB', ...),
  /// EventData(message: 'messageA', ...)
  /// ];
  /// var sortedByMessage = eventList.sortedByMessage;
  /// ```
  List<EventData> get sortedByMessage =>
      this..sort((a, b) => a.message.compareTo(b.message));

  /// Sorts the list of `EventData` by tags in ascending order.
  /// The tags are sorted by their string representation.
  /// If the tags are the same, the messages are sorted by time.
  ///
  /// Example:
  /// ```
  /// var eventList = [
  /// EventData(tags: ['tagB'], ...),
  /// EventData(tags: ['tagA'], ...)
  /// ];
  /// var sortedByTags = eventList.sortedByTags;
  /// ```
  List<EventData> get sortedByTags =>
      this..sort((a, b) => a.tags.join().compareTo(b.tags.join()));

  /// Retrieves the latest message from the list.
  ///
  /// Example:
  /// ```
  /// var eventList = [
  /// EventData(time: DateTime.now().subtract(Duration(hours: 2), ...),
  /// EventData(time: DateTime.now().add(Duration(hours: 1)), ...)
  /// ];
  /// var latestMessage = eventList.latestMessage;
  /// ```
  EventData get latestMessage => sortedByTime.first;

  /// Retrieves the oldest message from the list.
  ///
  /// Example:
  /// ```
  /// var eventList = [
  /// EventData(time: DateTime.now().subtract(Duration(hours: 2), ...),
  /// EventData(time: DateTime.now().add(Duration(hours: 1)), ...)
  /// ];
  /// var oldestMessage = eventList.oldestMessage;
  /// ```
  EventData get oldestMessage => sortedByTime.last;

  /// Filters the list to include only messages that have already expired.
  ///
  /// Expired messages are defined as those whose `expires` field is before the current time.
  ///
  /// Example:
  /// ```
  /// var eventList = [
  ///   EventData(expires: DateTime.now().subtract(Duration(days: 2)), ...),
  ///   EventData(expires: DateTime.now().add(Duration(days: 1)), ...)
  /// ];
  /// var expiredMessages = eventList.expiredMessages;
  /// ```
  List<EventData> get expiredMessages =>
      where((element) => element.expires.isBefore(DateTime.now())).toList();

  /// Retrieves a list of open `EventData` sorted by time.
  ///
  /// Example:
  /// ```
  /// var eventList = [
  ///   EventData(expires: DateTime.now().add(Duration(days: 2)), time: DateTime.now().subtract(Duration(hours: 1)), ...),
  ///   EventData(expires: DateTime.now().add(Duration(days: 2)), time: DateTime.now(), ...)
  /// ];
  /// var openMessagesSorted = eventList.openMessagesSortedByTime;
  /// ```
  List<EventData> get openMessagesSortedByTime => openMessages.sortedByTime;

  /// Retrieves a list of open `EventData` sorted by priority.
  ///
  /// Example:
  /// ```
  /// var eventList = [
  ///   EventData(expires: DateTime.now().add(Duration(days: 2)), priority: Priority.high, ...),
  ///   EventData(expires: DateTime.now().add(Duration(days: 2)), priority: Priority.low, ...)
  /// ];
  /// var openMessagesSorted = eventList.openMessagesSortedByPriority;
  /// ```
  List<EventData> get openMessagesSortedByPriority =>
      openMessages.sortedByPriority;

  /// Retrieves a list of open `EventData` sorted by topic.
  ///
  /// Example:
  /// ```
  /// var eventList = [
  ///   EventData(expires: DateTime.now().add(Duration(days: 2)), topic: "Technology", ...),
  ///   EventData(expires: DateTime.now().add(Duration(days: 2)), topic: "Sports", ...)
  /// ];
  /// var openMessagesSorted = eventList.openMessagesSortedByTopic;
  /// ```
  List<EventData> get openMessagesSortedByTopic => openMessages.sortedByTopic;

  /// Retrieves a list of open `EventData` sorted by event type.
  ///
  /// Example:
  /// ```
  /// var eventList = [
  ///   EventData(expires: DateTime.now().add(Duration(days: 2)), event: EventType.meeting, ...),
  ///   EventData(expires: DateTime.now().add(Duration(days: 2)), event: EventType.conference, ...)
  /// ];
  /// var openMessagesSorted = eventList.openMessagesSortedByEvent;
  /// ```
  List<EventData> get openMessagesSortedByEvent => openMessages.sortedByEvent;

  /// Retrieves a list of open `EventData` sorted by title.
  ///
  /// Example:
  /// ```
  /// var eventList = [
  ///   EventData(expires: DateTime.now().add(Duration(days: 2)), title: "Board Meeting", ...),
  ///   EventData(expires: DateTime.now().add(Duration(days: 2)), title: "Annual Conference", ...)
  /// ];
  /// var openMessagesSorted = eventList.openMessagesSortedByTitle;
  /// ```
  List<EventData> get openMessagesSortedByTitle => openMessages.sortedByTitle;

  /// Retrieves a list of open `EventData` sorted by message content.
  ///
  /// Example:
  /// ```
  /// var eventList = [
  ///   EventData(expires: DateTime.now().add(Duration(days: 2)), message: "Meeting starts at 10 AM", ...),
  ///   EventData(expires: DateTime.now().add(Duration(days: 2)), message: "Welcome to the conference", ...)
  /// ];
  /// var openMessagesSorted = eventList.openMessagesSortedByMessage;
  /// ```
  List<EventData> get openMessagesSortedByMessage =>
      openMessages.sortedByMessage;

  /// Retrieves a list of open `EventData` sorted by tags.
  ///
  /// Example:
  /// ```
  /// var eventList = [
  ///   EventData(expires: DateTime.now().add(Duration(days: 2)), tags: ["business", "meeting"], ...),
  ///   EventData(expires: DateTime.now().add(Duration(days: 2)), tags: ["education", "conference"], ...)
  /// ];
  /// var openMessagesSorted = eventList.openMessagesSortedByTags;
  /// ```
  List<EventData> get openMessagesSortedByTags => openMessages.sortedByTags;

  /// Retrieves a list of open `EventData` sorted by time and then by priority.
  ///
  /// Example:
  /// ```
  /// var eventList = [
  ///   EventData(time: DateTime.now(), priority: Priority.low, ...),
  ///   EventData(time: DateTime.now(), priority: Priority.high, ...)
  /// ];
  /// var sortedOpenMessages = eventList.openMessagesSortedByTimeAndPriority;
  /// ```
  List<EventData> get openMessagesSortedByTimeAndPriority =>
      openMessagesSortedByTime.sortedByPriority;

  /// Retrieves a list of open `EventData` sorted by priority and then by time.
  ///
  /// Example:
  /// ```
  /// var eventList = [
  ///   EventData(priority: Priority.high, time: DateTime.now().add(Duration(hours: 1)), ...),
  ///   EventData(priority: Priority.low, time: DateTime.now(), ...)
  /// ];
  /// var sortedOpenMessages = eventList.openMessagesSortedByPriorityAndTime;
  /// ```
  List<EventData> get openMessagesSortedByPriorityAndTime =>
      openMessagesSortedByPriority.sortedByTime;

  /// Retrieves a list of open `EventData` sorted by time and then by topic.
  ///
  /// Example:
  /// ```
  /// var eventList = [
  ///   EventData(time: DateTime.now(), topic: "Sports", ...),
  ///   EventData(time: DateTime.now(), topic: "Technology", ...)
  /// ];
  /// var sortedOpenMessages = eventList.openMessagesSortedByTimeAndTopic;
  /// ```
  List<EventData> get openMessagesSortedByTimeAndTopic =>
      openMessagesSortedByTime.sortedByTopic;

  /// Retrieves a list of open `EventData` sorted by topic and then by time.
  ///
  /// Example:
  /// ```
  /// var eventList = [
  ///   EventData(topic: "Technology", time: DateTime.now(), ...),
  ///   EventData(topic: "Sports", time: DateTime.now().add(Duration(hours: 1)), ...)
  /// ];
  /// var sortedOpenMessages = eventList.openMessagesSortedByTopicAndTime;
  /// ```
  List<EventData> get openMessagesSortedByTopicAndTime =>
      openMessagesSortedByTopic.sortedByTime;

  /// Retrieves a list of open `EventData` sorted by time and then by event type.
  ///
  /// Example:
  /// ```
  /// var eventList = [
  ///   EventData(time: DateTime.now(), event: EventType.conference, ...),
  ///   EventData(time: DateTime.now(), event: EventType.meeting, ...)
  /// ];
  /// var sortedOpenMessages = eventList.openMessagesSortedByTimeAndEvent;
  /// ```
  List<EventData> get openMessagesSortedByTimeAndEvent =>
      openMessagesSortedByTime.sortedByEvent;

  /// Retrieves a list of expired `EventData` sorted by time.
  ///
  /// Example:
  /// ```
  /// var eventList = [
  ///   EventData(expires: DateTime.now().subtract(Duration(days: 1)), time: DateTime.now().subtract(Duration(hours: 1)), ...),
  ///   EventData(expires: DateTime.now().subtract(Duration(days: 2)), time: DateTime.now().subtract(Duration(hours: 2)), ...)
  /// ];
  /// var sortedExpiredMessages = eventList.expiredMessagesSortedByTime;
  /// ```
  List<EventData> get expiredMessagesSortedByTime =>
      expiredMessages.sortedByTime;

  /// Retrieves a list of expired `EventData` sorted by priority.
  ///
  /// Example:
  /// ```
  /// var eventList = [
  ///   EventData(expires: DateTime.now().subtract(Duration(days: 1)), priority: Priority.high, ...),
  ///   EventData(expires: DateTime.now().subtract(Duration(days: 2)), priority: Priority.low, ...)
  /// ];
  /// var sortedExpiredMessages = eventList.expiredMessagesSortedByPriority;
  /// ```
  List<EventData> get expiredMessagesSortedByPriority =>
      expiredMessages.sortedByPriority;

  /// Retrieves a list of expired `EventData` sorted by topic.
  ///
  /// Example:
  /// ```
  /// var eventList = [
  ///   EventData(expires: DateTime.now().subtract(Duration(days: 1)), topic: "Technology", ...),
  ///   EventData(expires: DateTime.now().subtract(Duration(days: 1)), topic: "Sports", ...)
  /// ];
  /// var expiredMessagesSorted = eventList.expiredMessagesSortedByTopic;
  /// ```
  List<EventData> get expiredMessagesSortedByTopic =>
      expiredMessages.sortedByTopic;

  /// Retrieves a list of expired `EventData` sorted by event type.
  ///
  /// Example:
  /// ```
  /// var eventList = [
  ///   EventData(expires: DateTime.now().subtract(Duration(days: 1)), event: EventType.meeting, ...),
  ///   EventData(expires: DateTime.now().subtract(Duration(days: 1)), event: EventType.conference, ...)
  /// ];
  /// var expiredMessagesSorted = eventList.expiredMessagesSortedByEvent;
  /// ```
  List<EventData> get expiredMessagesSortedByEvent =>
      expiredMessages.sortedByEvent;

  /// Retrieves a list of expired `EventData` sorted by title.
  ///
  /// Example:
  /// ```
  /// var eventList = [
  ///   EventData(expires: DateTime.now().subtract(Duration(days: 1)), title: "Board Meeting", ...),
  ///   EventData(expires: DateTime.now().subtract(Duration(days: 1)), title: "Annual Conference", ...)
  /// ];
  /// var expiredMessagesSorted = eventList.expiredMessagesSortedByTitle;
  /// ```
  List<EventData> get expiredMessagesSortedByTitle =>
      expiredMessages.sortedByTitle;

  /// Retrieves a list of expired `EventData` sorted by message content.
  ///
  /// Example:
  /// ```
  /// var eventList = [
  ///   EventData(expires: DateTime.now().subtract(Duration(days: 1)), message: "Meeting starts at 10 AM", ...),
  ///   EventData(expires: DateTime.now().subtract(Duration(days: 1)), message: "Welcome to the conference", ...)
  /// ];
  /// var expiredMessagesSorted = eventList.expiredMessagesSortedByMessage;
  /// ```
  List<EventData> get expiredMessagesSortedByMessage =>
      expiredMessages.sortedByMessage;

  /// Retrieves a list of expired `EventData` sorted by tags.
  ///
  /// Example:
  /// ```
  /// var eventList = [
  ///   EventData(expires: DateTime.now().subtract(Duration(days: 1)), tags: ["business", "meeting"], ...),
  ///   EventData(expires: DateTime.now().subtract(Duration(days: 1)), tags: ["education", "conference"], ...)
  /// ];
  /// var expiredMessagesSorted = eventList.expiredMessagesSortedByTags;
  /// ```
  List<EventData> get expiredMessagesSortedByTags =>
      expiredMessages.sortedByTags;

  /// Retrieves a list of `EventData` that have already expired, sorted by time.
  ///
  /// Example:
  /// ```
  /// var eventList = [
  ///   EventData(expires: DateTime.now().subtract(Duration(days: 1)), time: DateTime.now().subtract(Duration(hours: 2)), ...),
  ///   EventData(expires: DateTime.now().subtract(Duration(days: 1)), time: DateTime.now(), ...)
  /// ];
  /// var messagesSorted = eventList.messagesSortedByTime;
  /// ```
  List<EventData> get messagesSortedByTime => messages.sortedByTime;

  /// Retrieves a list of `EventData` that have already expired, sorted by priority.
  ///
  /// Example:
  /// ```
  /// var eventList = [
  ///   EventData(expires: DateTime.now().subtract(Duration(days: 1)), priority: Priority.high, ...),
  ///   EventData(expires: DateTime.now().subtract(Duration(days: 1)), priority: Priority.low, ...)
  /// ];
  /// var messagesSorted = eventList.messagesSortedByPriority;
  /// ```
  List<EventData> get messagesSortedByPriority => messages.sortedByPriority;

  /// Retrieves a list of `EventData` that have already expired, sorted by topic.
  ///
  /// Example:
  /// ```
  /// var eventList = [
  ///   EventData(expires: DateTime.now().subtract(Duration(days: 1)), topic: "Technology", ...),
  ///   EventData(expires: DateTime.now().subtract(Duration(days: 1)), topic: "Sports", ...)
  /// ];
  /// var messagesSorted = eventList.messagesSortedByTopic;
  /// ```
  List<EventData> get messagesSortedByTopic => messages.sortedByTopic;

  /// Retrieves a list of `EventData` that have already expired, sorted by event type.
  ///
  /// Example:
  /// ```
  /// var eventList = [
  ///   EventData(expires: DateTime.now().subtract(Duration(days: 1)), event: EventType.meeting, ...),
  ///   EventData(expires: DateTime.now().subtract(Duration(days: 1)), event: EventType.conference, ...)
  /// ];
  /// var messagesSorted = eventList.messagesSortedByEvent;
  /// ```
  List<EventData> get messagesSortedByEvent => messages.sortedByEvent;

  /// Retrieves a list of `EventData` that have already expired, sorted by title.
  ///
  /// Example:
  /// ```
  /// var eventList = [
  ///   EventData(expires: DateTime.now().subtract(Duration(days: 1)), title: "Board Meeting", ...),
  ///   EventData(expires: DateTime.now().subtract(Duration(days: 1)), title: "Annual Conference", ...)
  /// ];
  /// var messagesSorted = eventList.messagesSortedByTitle;
  /// ```
  List<EventData> get messagesSortedByTitle => messages.sortedByTitle;

  /// Retrieves a list of `EventData` that have already expired, sorted by message content.
  ///
  /// Example:
  /// ```
  /// var eventList = [
  ///   EventData(expires: DateTime.now().subtract(Duration(days: 1)), message: "Meeting starts at 10 AM", ...),
  ///   EventData(expires: DateTime.now().subtract(Duration(days: 1)), message: "Welcome to the conference", ...)
  /// ];
  /// var messagesSorted = eventList.messagesSortedByMessage;
  /// ```
  List<EventData> get messagesSortedByMessage => messages.sortedByMessage;

  /// Retrieves a list of `EventData` that have already expired, sorted by tags.
  ///
  /// Example:
  /// ```
  /// var eventList = [
  ///   EventData(expires: DateTime.now().subtract(Duration(days: 1)), tags: ["business", "meeting"], ...),
  ///   EventData(expires: DateTime.now().subtract(Duration(days: 1)), tags: ["education", "conference"], ...)
  /// ];
  /// var messagesSorted = eventList.messagesSortedByTags;
  /// ```
  List<EventData> get messagesSortedByTags => messages.sortedByTags;

  /// Splits the list into two separate lists: one containing expired messages
  /// and the other containing unexpired (open) messages.
  ///
  /// 'Expired messages' are those whose `expires` field is before the current time.
  /// 'Unexpired messages' are those whose `expires` field is after the current time.
  ///
  /// Returns a tuple containing the lists of expired and unexpired messages.
  ///
  /// Example:
  /// ```
  /// var eventList = [
  ///   EventData(expires: DateTime.now().subtract(Duration(days: 1)), ...),
  ///   EventData(expires: DateTime.now().add(Duration(days: 1)), ...)
  /// ];
  /// var (expiredMessages, unexpiredMessages) = eventList.splitExpiration;
  /// ```
  (List<EventData> expiredMessages, List<EventData> unexpiredMessages)
      get splitExpiration => (messages, openMessages);

  /// Splits the list into two separate lists based on the event type: one for messages
  /// and the other for open events.
  ///
  /// This method separates `EventData` instances into two categories:
  /// those with an event type of `EventTypes.message` and those with `EventTypes.open`.
  ///
  /// Returns a tuple containing the lists of messages and open events.
  ///
  /// Example:
  /// ```
  /// var eventList = [
  ///   EventData(event: EventTypes.message, ...),
  ///   EventData(event: EventTypes.open, ...)
  /// ];
  /// var (messageEvents, openEvents) = eventList.splitEvent;
  /// ```
  (List<EventData> message, List<EventData> open) get splitEvent {
    List<EventData> message = [];
    List<EventData> open = [];
    for (var i = 0; i < length; i++) {
      if (this[i].event == EventTypes.message) {
        message.add(this[i]);
      }
      if (this[i].event == EventTypes.open) {
        open.add(this[i]);
      }
    }
    return (message, open);
  }
}
