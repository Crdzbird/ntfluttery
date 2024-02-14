import 'package:ntfluttery/ntfluttery.dart';
import 'package:test/test.dart';

void main() {
  group('EventDataListExtension Tests', () {
    test('Filter open messages', () {
      var eventList = [
        EventData(expires: DateTime.now().add(Duration(days: 1))),
        EventData(expires: DateTime.now().subtract(Duration(days: 1))),
      ];
      var openMessages = eventList.openMessages;
      expect(openMessages.length, equals(1));
      expect(openMessages[0].expires.isAfter(DateTime.now()), isTrue);
    });

    test('Filter expired messages', () {
      var eventList = [
        EventData(expires: DateTime.now().subtract(Duration(days: 2))),
        EventData(expires: DateTime.now().add(Duration(days: 1))),
      ];
      var expiredMessages = eventList.expiredMessages;
      expect(expiredMessages.length, equals(1));
      expect(expiredMessages[0].expires.isBefore(DateTime.now()), isTrue);
    });

    test('Sort by time', () {
      var eventList = [
        EventData(time: DateTime.now().subtract(Duration(hours: 2))),
        EventData(time: DateTime.now().add(Duration(hours: 1))),
      ];
      var sortedByTime = eventList.sortedByTime;
      expect(sortedByTime.length, equals(2));
      expect(sortedByTime[0].time.isAfter(sortedByTime[1].time), isTrue);
    });

    test('Sort by priority', () {
      var eventList = [
        EventData(priority: PriorityType.low),
        EventData(priority: PriorityType.high),
      ];
      var sortedByPriority = eventList.sortedByPriority;
      expect(sortedByPriority.length, equals(2));
      expect(
          sortedByPriority[0].priority.index >
              sortedByPriority[1].priority.index,
          isTrue);
    });

    test('Sort by topic', () {
      var eventList = [
        EventData(topic: 'topicB'),
        EventData(topic: 'topicA'),
      ];
      var sortedByTopic = eventList.sortedByTopic;
      expect(sortedByTopic.length, equals(2));
      expect(
          sortedByTopic[0].topic.compareTo(sortedByTopic[1].topic) < 0, isTrue);
    });

    test('Sort by event', () {
      var eventList = [
        EventData(event: EventTypes.message),
        EventData(event: EventTypes.none),
      ];
      var sortedByEvent = eventList.sortedByEvent;
      expect(sortedByEvent.length, equals(2));
      expect(
          sortedByEvent[0].event.index < sortedByEvent[1].event.index, isTrue);
    });

    test('Sort by title', () {
      var eventList = [
        EventData(title: 'titleB'),
        EventData(title: 'titleA'),
      ];
      var sortedByTitle = eventList.sortedByTitle;
      expect(sortedByTitle.length, equals(2));
      expect(
          sortedByTitle[0].title.compareTo(sortedByTitle[1].title) < 0, isTrue);
    });

    test('Sort by message', () {
      var eventList = [
        EventData(message: 'messageB'),
        EventData(message: 'messageA'),
      ];
      var sortedByMessage = eventList.sortedByMessage;
      expect(sortedByMessage.length, equals(2));
      expect(
          sortedByMessage[0].message.compareTo(sortedByMessage[1].message) < 0,
          isTrue);
    });

    test('Sort by tags', () {
      var eventList = [
        EventData(tags: ['tagB']),
        EventData(tags: ['tagA']),
      ];
      var sortedByTags = eventList.sortedByTags;
      expect(sortedByTags.length, equals(2));
      expect(
          sortedByTags[0].tags.join().compareTo(sortedByTags[1].tags.join()) <
              0,
          isTrue);
    });

    test('Retrieve latest message', () {
      var eventList = [
        EventData(time: DateTime.now().subtract(Duration(hours: 2))),
        EventData(time: DateTime.now().add(Duration(hours: 1))),
      ];
      var latestMessage = eventList.latestMessage;
      expect(latestMessage.time, equals(eventList[0].time));
    });

    test('Retrieve oldest message', () {
      var eventList = [
        EventData(time: DateTime.now().subtract(Duration(hours: 2))),
        EventData(time: DateTime.now().add(Duration(hours: 1))),
      ];
      var oldestMessage = eventList.oldestMessage;
      expect(oldestMessage.time, equals(eventList[1].time));
    });

    test('Retrieve open messages sorted by time', () {
      var eventList = [
        EventData(
            expires: DateTime.now().add(Duration(days: 2)),
            time: DateTime.now().subtract(Duration(hours: 1))),
        EventData(
            expires: DateTime.now().add(Duration(days: 2)),
            time: DateTime.now()),
      ];
      var openMessagesSorted = eventList.openMessagesSortedByTime;
      expect(openMessagesSorted.length, equals(2));
      expect(
          openMessagesSorted[0].expires.isAfter(openMessagesSorted[1].expires),
          isTrue);
    });

    test('Retrieve open messages sorted by priority', () {
      var eventList = [
        EventData(
            expires: DateTime.now().add(Duration(days: 2)),
            priority: PriorityType.high),
        EventData(
            expires: DateTime.now().add(Duration(days: 2)),
            priority: PriorityType.low),
      ];
      var openMessagesSorted = eventList.openMessagesSortedByPriority;
      expect(openMessagesSorted.length, equals(2));
      expect(
          openMessagesSorted[0].priority.index >
              openMessagesSorted[1].priority.index,
          isTrue);
    });

    test('Retrieve open messages sorted by topic', () {
      var eventList = [
        EventData(
            expires: DateTime.now().add(Duration(days: 2)),
            topic: "Technology"),
        EventData(
            expires: DateTime.now().add(Duration(days: 2)), topic: "Sports"),
      ];
      var openMessagesSorted = eventList.openMessagesSortedByTopic;
      expect(openMessagesSorted.length, equals(2));
      expect(
          openMessagesSorted[0].topic.compareTo(openMessagesSorted[1].topic) <
              0,
          isTrue);
    });

    test('Retrieve open messages sorted by event type', () {
      var eventList = [
        EventData(
            expires: DateTime.now().add(Duration(days: 2)),
            event: EventTypes.pollRequest),
        EventData(
            expires: DateTime.now().add(Duration(days: 2)),
            event: EventTypes.open),
      ];
      var openMessagesSorted = eventList.openMessagesSortedByEvent;
      expect(openMessagesSorted.length, equals(2));
      expect(
          openMessagesSorted[0].event.index < openMessagesSorted[1].event.index,
          isTrue);
    });

    test('Retrieve open messages sorted by title', () {
      var eventList = [
        EventData(
            expires: DateTime.now().add(Duration(days: 2)),
            title: "Board Meeting"),
        EventData(
            expires: DateTime.now().add(Duration(days: 2)),
            title: "Annual Conference"),
      ];
      var openMessagesSorted = eventList.openMessagesSortedByTitle;
      expect(openMessagesSorted.length, equals(2));
      expect(
          openMessagesSorted[0].title.compareTo(openMessagesSorted[1].title) <
              0,
          isTrue);
    });

    test('Retrieve open messages sorted by message content', () {
      var eventList = [
        EventData(
            expires: DateTime.now().add(Duration(days: 2)),
            message: "Meeting starts at 10 AM"),
        EventData(
            expires: DateTime.now().add(Duration(days: 2)),
            message: "Welcome to the conference"),
      ];
      var openMessagesSorted = eventList.openMessagesSortedByMessage;
      expect(openMessagesSorted.length, equals(2));
      expect(
          openMessagesSorted[0]
                  .message
                  .compareTo(openMessagesSorted[1].message) <
              0,
          isTrue);
    });

    test('Retrieve open messages sorted by tags', () {
      var eventList = [
        EventData(
            expires: DateTime.now().add(Duration(days: 2)),
            tags: ["business", "meeting"]),
        EventData(
            expires: DateTime.now().add(Duration(days: 2)),
            tags: ["education", "conference"]),
      ];
      var openMessagesSorted = eventList.openMessagesSortedByTags;
      expect(openMessagesSorted.length, equals(2));
      expect(
          openMessagesSorted[0]
                  .tags
                  .join()
                  .compareTo(openMessagesSorted[1].tags.join()) <
              0,
          isTrue);
    });

    test('Retrieve expired messages sorted by time', () {
      var eventList = [
        EventData(
            expires: DateTime.now().subtract(Duration(days: 2)),
            time: DateTime.now().subtract(Duration(hours: 1))),
        EventData(
            expires: DateTime.now().subtract(Duration(days: 2)),
            time: DateTime.now()),
      ];
      var expiredMessagesSorted = eventList.expiredMessagesSortedByTime;
      expect(expiredMessagesSorted.length, equals(2));
      expect(
          expiredMessagesSorted[0]
              .expires
              .isAfter(expiredMessagesSorted[1].expires),
          isTrue);
    });

    test('Retrieve expired messages sorted by priority', () {
      var eventList = [
        EventData(
            expires: DateTime.now().subtract(Duration(days: 2)),
            priority: PriorityType.high),
        EventData(
            expires: DateTime.now().subtract(Duration(days: 2)),
            priority: PriorityType.low),
      ];
      var expiredMessagesSorted = eventList.expiredMessagesSortedByPriority;
      expect(expiredMessagesSorted.length, equals(2));
      expect(
          expiredMessagesSorted[0].priority.index >
              expiredMessagesSorted[1].priority.index,
          isTrue);
    });

    test('Retrieve expired messages sorted by topic', () {
      var eventList = [
        EventData(
            expires: DateTime.now().subtract(Duration(days: 2)),
            topic: "Technology"),
        EventData(
            expires: DateTime.now().subtract(Duration(days: 2)),
            topic: "Sports"),
      ];
      var expiredMessagesSorted = eventList.expiredMessagesSortedByTopic;
      expect(expiredMessagesSorted.length, equals(2));
      expect(
          expiredMessagesSorted[1]
              .topic
              .compareTo(expiredMessagesSorted[0].topic),
          1,
          reason: 'The second topic should come first');
    });

    test('Retrieve messages', () {
      var eventList = [
        EventData(
            expires: DateTime.now().subtract(Duration(days: 2)),
            time: DateTime.now().subtract(Duration(hours: 1))),
        EventData(
            expires: DateTime.now().add(Duration(days: 2)),
            time: DateTime.now().add(Duration(hours: 1))),
      ];
      var messages = eventList.messages;
      expect(messages.length, equals(1));
    });

    test('Retrieve open messages sorted by time and priority', () {
      var eventList = [
        EventData(
            expires: DateTime.now().add(Duration(days: 2)),
            time: DateTime.now().subtract(Duration(hours: 1)),
            priority: PriorityType.high),
        EventData(
            expires: DateTime.now().add(Duration(days: 2)),
            time: DateTime.now().add(Duration(hours: 1)),
            priority: PriorityType.low),
      ];
      var openMessagesSorted = eventList.openMessagesSortedByTimeAndPriority;
      expect(openMessagesSorted.length, equals(2));
      expect(
          openMessagesSorted[0].expires.isBefore(openMessagesSorted[1].expires),
          isTrue);
      expect(
          openMessagesSorted[0].priority.index >
              openMessagesSorted[1].priority.index,
          isTrue);
    });

    test('Retrieve open messages sorted by priority and time', () {
      var eventList = [
        EventData(
            expires: DateTime.now().add(Duration(days: 2)),
            time: DateTime.now().subtract(Duration(hours: 1)),
            priority: PriorityType.high),
        EventData(
            expires: DateTime.now().add(Duration(days: 2)),
            time: DateTime.now().add(Duration(hours: 1)),
            priority: PriorityType.low),
      ];
      var openMessagesSorted = eventList.openMessagesSortedByPriorityAndTime;
      expect(openMessagesSorted.length, equals(2));
      expect(
          openMessagesSorted[0].priority.index <
              openMessagesSorted[1].priority.index,
          isTrue);
      expect(
          openMessagesSorted[0].expires.isAfter(openMessagesSorted[1].expires),
          isTrue);
    });

    test('Retrieve open messages sorted by time and topic', () {
      var eventList = [
        EventData(
            expires: DateTime.now().add(Duration(days: 2)),
            time: DateTime.now().subtract(Duration(hours: 1)),
            topic: "Technology"),
        EventData(
            expires: DateTime.now().add(Duration(days: 2)),
            time: DateTime.now().add(Duration(hours: 1)),
            topic: "Sports"),
      ];
      var openMessagesSorted = eventList.openMessagesSortedByTimeAndTopic;
      expect(openMessagesSorted.length, equals(2));
      expect(
          openMessagesSorted[0].expires.isAfter(openMessagesSorted[1].expires),
          isTrue);
      expect(
          openMessagesSorted[0].topic.compareTo(openMessagesSorted[1].topic) <
              0,
          isTrue);
    });

    test('Retrieve open messages sorted by topic and time', () {
      var eventList = [
        EventData(
            expires: DateTime.now().add(Duration(days: 2)),
            time: DateTime.now().subtract(Duration(hours: 1)),
            topic: "Technology"),
        EventData(
            expires: DateTime.now().add(Duration(days: 2)),
            time: DateTime.now().add(Duration(hours: 1)),
            topic: "Sports"),
      ];
      var openMessagesSorted = eventList.openMessagesSortedByTopicAndTime;
      expect(openMessagesSorted.length, equals(2));
      expect(
          openMessagesSorted[0].topic.compareTo(openMessagesSorted[1].topic) <
              0,
          isTrue);
      expect(
          openMessagesSorted[0].expires.isAfter(openMessagesSorted[1].expires),
          isTrue);
    });

    test('Retrieve open messages sorted by time and event', () {
      var eventList = [
        EventData(
            expires: DateTime.now().add(Duration(days: 2)),
            time: DateTime.now().subtract(Duration(hours: 1)),
            event: EventTypes.pollRequest),
        EventData(
            expires: DateTime.now().add(Duration(days: 2)),
            time: DateTime.now().add(Duration(hours: 1)),
            event: EventTypes.open),
      ];
      var openMessagesSorted = eventList.openMessagesSortedByTimeAndEvent;
      expect(openMessagesSorted.length, equals(2));
      expect(
          openMessagesSorted[0].expires.isAfter(openMessagesSorted[1].expires),
          isTrue);
      expect(
          openMessagesSorted[0].event.index < openMessagesSorted[1].event.index,
          isTrue);
    });

    test('Retrieve expired messages sorted by event', () {
      var eventList = [
        EventData(
            expires: DateTime.now().subtract(Duration(days: 2)),
            event: EventTypes.pollRequest),
        EventData(
            expires: DateTime.now().subtract(Duration(days: 2)),
            event: EventTypes.open),
      ];
      var expiredMessagesSorted = eventList.expiredMessagesSortedByEvent;
      expect(expiredMessagesSorted.length, equals(2));
      expect(
          expiredMessagesSorted[0].event.index <
              expiredMessagesSorted[1].event.index,
          isTrue);
    });

    test('Retrieve expired messages sorted by title', () {
      var eventList = [
        EventData(
            expires: DateTime.now().subtract(Duration(days: 2)),
            title: "Board Meeting"),
        EventData(
            expires: DateTime.now().subtract(Duration(days: 2)),
            title: "Annual Conference"),
      ];
      var expiredMessagesSorted = eventList.expiredMessagesSortedByTitle;
      expect(expiredMessagesSorted.length, equals(2));
      expect(
          expiredMessagesSorted[0]
                  .title
                  .compareTo(expiredMessagesSorted[1].title) <
              0,
          isTrue);
    });

    test('Retrieve expired messages sorted by messages', () {
      var eventList = [
        EventData(
            expires: DateTime.now().subtract(Duration(days: 2)),
            message: "Meeting starts at 10 AM"),
        EventData(
            expires: DateTime.now().subtract(Duration(days: 2)),
            message: "Welcome to the conference"),
      ];
      var expiredMessagesSorted = eventList.expiredMessagesSortedByMessage;
      expect(expiredMessagesSorted.length, equals(2));
      expect(
          expiredMessagesSorted[0]
                  .message
                  .compareTo(expiredMessagesSorted[1].message) <
              0,
          isTrue);
    });

    test('Retrieve expired messages sorted by tags', () {
      var eventList = [
        EventData(
            expires: DateTime.now().subtract(Duration(days: 2)),
            tags: ["business", "meeting"]),
        EventData(
            expires: DateTime.now().subtract(Duration(days: 2)),
            tags: ["education", "conference"]),
      ];
      var expiredMessagesSorted = eventList.expiredMessagesSortedByTags;
      expect(expiredMessagesSorted.length, equals(2));
      expect(
          expiredMessagesSorted[0]
                  .tags
                  .join()
                  .compareTo(expiredMessagesSorted[1].tags.join()) <
              0,
          isTrue);
    });

    test('Retrieve messages sorted by time', () {
      var eventList = [
        EventData(
            expires: DateTime.now().subtract(Duration(days: 2)),
            time: DateTime.now().subtract(Duration(hours: 1))),
        EventData(
            expires: DateTime.now().add(Duration(days: 2)),
            time: DateTime.now().add(Duration(hours: 1))),
      ];
      var messagesSorted = eventList.messagesSortedByTime;
      expect(messagesSorted.length, equals(1));
      expect(messagesSorted[0].expires.isBefore(messagesSorted[0].expires),
          isFalse);
    });

    test('Retrieve messages sorted by priority', () {
      var eventList = [
        EventData(
            expires: DateTime.now().subtract(Duration(days: 2)),
            priority: PriorityType.high),
        EventData(
            expires: DateTime.now().add(Duration(days: 2)),
            priority: PriorityType.low),
      ];
      var messagesSorted = eventList.messagesSortedByPriority;
      expect(messagesSorted.length, equals(1));
      expect(
          messagesSorted[0].priority.index > messagesSorted[0].priority.index,
          isFalse);
    });

    test('Retrieve messages sorted by topic', () {
      var eventList = [
        EventData(
            expires: DateTime.now().subtract(Duration(days: 2)),
            topic: "Technology"),
        EventData(
            expires: DateTime.now().add(Duration(days: 2)), topic: "Sports"),
      ];
      var messagesSorted = eventList.messagesSortedByTopic;
      expect(messagesSorted.length, equals(1));
      expect(messagesSorted[0].topic.compareTo(messagesSorted[0].topic) < 0,
          isFalse);
    });

    test('Retrieve messages sorted by event', () {
      var eventList = [
        EventData(
            expires: DateTime.now().subtract(Duration(days: 2)),
            event: EventTypes.pollRequest),
        EventData(
            expires: DateTime.now().add(Duration(days: 2)),
            event: EventTypes.open),
      ];
      var messagesSorted = eventList.messagesSortedByEvent;
      expect(messagesSorted.length, equals(1));
      expect(messagesSorted[0].event.index < messagesSorted[0].event.index,
          isFalse);
    });

    test('Retrieve messages sorted by title', () {
      var eventList = [
        EventData(
            expires: DateTime.now().subtract(Duration(days: 2)),
            title: "Board Meeting"),
        EventData(
            expires: DateTime.now().add(Duration(days: 2)),
            title: "Annual Conference"),
      ];
      var messagesSorted = eventList.messagesSortedByTitle;
      expect(messagesSorted.length, equals(1));
      expect(messagesSorted[0].title.compareTo(messagesSorted[0].title) < 0,
          isFalse);
    });

    test('Retrieve messages sorted by message', () {
      var eventList = [
        EventData(
            expires: DateTime.now().subtract(Duration(days: 2)),
            message: "Meeting starts at 10 AM"),
        EventData(
            expires: DateTime.now().add(Duration(days: 2)),
            message: "Welcome to the conference"),
      ];
      var messagesSorted = eventList.messagesSortedByMessage;
      expect(messagesSorted.length, equals(1));
      expect(messagesSorted[0].message.compareTo(messagesSorted[0].message) < 0,
          isFalse);
    });

    test('Retrieve messages sorted by tags', () {
      var eventList = [
        EventData(
            expires: DateTime.now().subtract(Duration(days: 2)),
            tags: ["business", "meeting"]),
        EventData(
            expires: DateTime.now().add(Duration(days: 2)),
            tags: ["education", "conference"]),
      ];
      var messagesSorted = eventList.messagesSortedByTags;
      expect(messagesSorted.length, equals(1));
      expect(
          messagesSorted[0]
                  .tags
                  .join()
                  .compareTo(messagesSorted[0].tags.join()) <
              0,
          isFalse);
    });

    test('Retrieve splitExpiration', () {
      var eventList = [
        EventData(
            expires: DateTime.now().subtract(Duration(days: 2)),
            time: DateTime.now().subtract(Duration(hours: 1))),
        EventData(
            expires: DateTime.now().add(Duration(days: 2)),
            time: DateTime.now().add(Duration(hours: 1))),
      ];
      var splitExpiration = eventList.splitExpiration;
      expect(splitExpiration.$1.length, equals(1));
      expect(splitExpiration.$2.length, equals(1));
    });

    test('Retrieve splitEvent', () {
      var eventList = [
        EventData(
            expires: DateTime.now().subtract(Duration(days: 2)),
            event: EventTypes.message),
        EventData(
            expires: DateTime.now().add(Duration(days: 2)),
            event: EventTypes.open),
      ];
      var splitEvent = eventList.splitEvent;
      expect(splitEvent.$1.length, equals(1));
      expect(splitEvent.$2.length, equals(1));
    });
  });
}
