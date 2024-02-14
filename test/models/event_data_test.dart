import 'package:ntfluttery/src/models/attachment.dart';
import 'package:ntfluttery/src/models/enums/event_types.dart';
import 'package:ntfluttery/src/models/enums/priority_type.dart';
import 'package:ntfluttery/src/models/event_data.dart';
import 'package:test/test.dart';

void main() {
  group('EventData Tests', () {
    test('Default constructor assigns properties correctly', () {
      var eventData = EventData();
      expect(eventData.id, equals(''));
      expect(eventData.time, isNotNull);
      expect(eventData.expires, isNotNull);
      expect(eventData.event, equals(EventTypes.none));
      expect(eventData.topic, equals(''));
      expect(eventData.title, equals(''));
      expect(eventData.message, equals(''));
      expect(eventData.priority, equals(PriorityType.none));
      expect(eventData.tags, isEmpty);
      expect(eventData.click, equals(''));
      expect(eventData.attachment, equals(Attachment()));
    });

    test('Constructor assigns properties correctly', () {
      var time = DateTime(2022, 1, 1);
      var expires = DateTime(2022, 1, 2);
      var eventData = EventData(
        id: '123',
        time: time,
        expires: expires,
        event: EventTypes.none,
        topic: 'Topic',
        title: 'Title',
        message: 'Message',
        priority: PriorityType.high,
        tags: ['tag1', 'tag2'],
        click: 'https://example.com',
        attachment: Attachment(),
      );
      expect(eventData.id, equals('123'));
      expect(eventData.time, equals(time));
      expect(eventData.expires, equals(expires));
      expect(eventData.event, equals(EventTypes.none));
      expect(eventData.topic, equals('Topic'));
      expect(eventData.title, equals('Title'));
      expect(eventData.message, equals('Message'));
      expect(eventData.priority, equals(PriorityType.high));
      expect(eventData.tags, equals(['tag1', 'tag2']));
      expect(eventData.click, equals('https://example.com'));
      expect(eventData.attachment, equals(Attachment()));
    });

    test('fromMap creates EventData instance correctly', () {
      var data = {
        'id': '123',
        'time': 1640995200, // January 1, 2022
        'expires': 1641081600, // January 2, 2022
        'event': 'info',
        'topic': 'Topic',
        'title': 'Title',
        'message': 'Message',
        'priority': 2,
        'tags': ['tag1', 'tag2'],
        'click': 'https://example.com',
        'attachment': {
          'name': 'file.txt',
          'url': '1024',
        },
      };
      var eventData = EventData.fromMap(data);
      expect(eventData.id, equals('123'));
      expect(eventData.time, equals(DateTime(2022, 1, 1, 1)));
      expect(eventData.expires, equals(DateTime(2022, 1, 2, 1)));
      expect(eventData.event, equals(EventTypes.none));
      expect(eventData.topic, equals('Topic'));
      expect(eventData.title, equals('Title'));
      expect(eventData.message, equals('Message'));
      expect(eventData.priority, equals(PriorityType.low));
      expect(eventData.tags, equals(['tag1', 'tag2']));
      expect(eventData.click, equals('https://example.com'));
      expect(eventData.attachment,
          equals(Attachment(name: 'file.txt', url: '1024')));
    });

    test(
        'fromMap creates EventData instance correctly with null dates and empty tags',
        () {
      var data = {
        'id': '123',
        'event': 'info',
        'topic': 'Topic',
        'title': 'Title',
        'message': 'Message',
        'priority': 2,
        'click': 'https://example.com',
        'attachment': {
          'name': 'file.txt',
          'url': '1024',
        },
      };
      var eventData = EventData.fromMap(data);
      expect(eventData.id, equals('123'));
      expect(eventData.time, isNotNull);
      expect(eventData.expires, isNotNull);
      expect(eventData.event, equals(EventTypes.none));
      expect(eventData.topic, equals('Topic'));
      expect(eventData.title, equals('Title'));
      expect(eventData.message, equals('Message'));
      expect(eventData.priority, equals(PriorityType.low));
      expect(eventData.tags.length, equals(0));
      expect(eventData.click, equals('https://example.com'));
      expect(eventData.attachment,
          equals(Attachment(name: 'file.txt', url: '1024')));
    });

    test('fromList', () {
      var data = [
        {
          'id': '123',
          'time': 1640995200, // January 1, 2022
          'expires': 1641081600, // January 2, 2022
          'event': 'info',
          'topic': 'Topic',
          'title': 'Title',
          'message': 'Message',
          'priority': 2,
          'tags': ['tag1', 'tag2'],
          'click': 'https://example.com',
          'attachment': {
            'name': 'file.txt',
            'url': '1024',
          },
        },
        {
          'id': '456',
          'time': 1640995200, // January 1, 2022
          'expires': 1641081600, // January 2, 2022
          'event': 'info',
          'topic': 'Topic',
          'title': 'Title',
          'message': 'Message',
          'priority': 2,
          'tags': ['tag1', 'tag2'],
          'click': 'https://example.com',
          'attachment': {
            'name': 'file.txt',
            'url': '1024',
          },
        },
      ];
      var eventDatas = EventData.fromList(data);
      expect(eventDatas.length, equals(2));
      expect(eventDatas[0].id, equals('123'));
      expect(eventDatas[1].id, equals('456'));
    });

    test('fromJson creates EventData instance correctly', () {
      var json = '''
        {
          "id": "123",
          "time": 1640995200,
          "expires": 1641081600,
          "event": "info",
          "topic": "Topic",
          "title": "Title",
          "message": "Message",
          "priority": 2,
          "tags": ["tag1", "tag2"],
          "click": "https://example.com",
          "attachment": {
            "name": "file.txt",
            "url": "1024"
          }
        }
      ''';
      var eventData = EventData.fromJson(json);
      expect(eventData.id, equals('123'));
      expect(eventData.time, equals(DateTime(2022, 1, 1, 1)));
      expect(eventData.expires, equals(DateTime(2022, 1, 2, 1)));
      expect(eventData.event, equals(EventTypes.none));
      expect(eventData.topic, equals('Topic'));
      expect(eventData.title, equals('Title'));
      expect(eventData.message, equals('Message'));
      expect(eventData.priority, equals(PriorityType.low));
      expect(eventData.tags, equals(['tag1', 'tag2']));
      expect(eventData.click, equals('https://example.com'));
      expect(eventData.attachment,
          equals(Attachment(name: 'file.txt', url: '1024')));
    });

    test('toMap returns correct map', () {
      var eventData = EventData(
        id: '123',
        time: DateTime(2022, 1, 1),
        expires: DateTime(2022, 1, 2),
        event: EventTypes.none,
        topic: 'Topic',
        title: 'Title',
        message: 'Message',
        priority: PriorityType.high,
        tags: ['tag1', 'tag2'],
        click: 'https://example.com',
        attachment: Attachment(name: 'file.txt', url: '1024'),
      );
      var map = eventData.toMap;
      expect(map['id'], equals('123'));
      expect(map['time'], equals(1640991600));
      expect(map['expires'], equals(1641078000));
      expect(map['event'], equals('none'));
      expect(map['topic'], equals('Topic'));
      expect(map['title'], equals('Title'));
      expect(map['message'], equals('Message'));
      expect(map['priority'], equals(4));
      expect(map['tags'], equals(['tag1', 'tag2']));
      expect(map['click'], equals('https://example.com'));
      expect(map['attachment'], equals({'name': 'file.txt', 'url': '1024'}));
    });

    test('toJson returns correct JSON string', () {
      var eventData = EventData(
        id: '123',
        time: DateTime(2022, 1, 1),
        expires: DateTime(2022, 1, 2),
        event: EventTypes.none,
        topic: 'Topic',
        title: 'Title',
        message: 'Message',
        priority: PriorityType.high,
        tags: ['tag1', 'tag2'],
        click: 'https://example.com',
        attachment: Attachment(name: 'file.txt', url: '1024'),
      );
      var json = eventData.toJson;
      expect(
          json,
          equals(
              '{"id":"123","time":1640991600,"expires":1641078000,"event":"none","topic":"Topic","title":"Title","message":"Message","priority":4,"tags":["tag1","tag2"],"click":"https://example.com","attachment":{"name":"file.txt","url":"1024"}}'));
    });

    test('copyWith creates new EventData instance with modified fields', () {
      var eventData = EventData(
        id: '123',
        time: DateTime(2022, 1, 1),
        expires: DateTime(2022, 1, 2),
        event: EventTypes.none,
        topic: 'Topic',
        title: 'Title',
        message: 'Message',
        priority: PriorityType.high,
        tags: ['tag1', 'tag2'],
        click: 'https://example.com',
        attachment: Attachment(name: 'file.txt', url: '1024'),
      );
      var newEventData = eventData.copyWith(
        id: '456',
        time: DateTime(2023, 1, 1),
        expires: DateTime(2023, 1, 2),
        event: EventTypes.keepAlive,
        topic: 'New Topic',
        title: 'New Title',
        message: 'New Message',
        priority: PriorityType.low,
        tags: ['tag3', 'tag4'],
        click: 'https://example2.com',
        attachment: Attachment(name: 'file2.txt', url: '2048'),
      );
      expect(newEventData.id, equals('456'));
      expect(newEventData.time, equals(DateTime(2023, 1, 1)));
      expect(newEventData.expires, equals(DateTime(2023, 1, 2)));
      expect(newEventData.event, equals(EventTypes.keepAlive));
      expect(newEventData.topic, equals('New Topic'));
      expect(newEventData.title, equals('New Title'));
      expect(newEventData.message, equals('New Message'));
      expect(newEventData.priority, equals(PriorityType.low));
      expect(newEventData.tags, equals(['tag3', 'tag4']));
      expect(newEventData.click, equals('https://example2.com'));
      expect(newEventData.attachment,
          equals(Attachment(name: 'file2.txt', url: '2048')));
    });

    test('copyWith with null values', () {
      var eventData = EventData(
        id: '123',
        time: DateTime(2022, 1, 1),
        expires: DateTime(2022, 1, 2),
        event: EventTypes.none,
        topic: 'Topic',
        title: 'Title',
        message: 'Message',
        priority: PriorityType.high,
        tags: ['tag1', 'tag2'],
        click: 'https://example.com',
        attachment: Attachment(name: 'file.txt', url: '1024'),
      );
      var newEventData = eventData.copyWith();
      expect(newEventData.id, equals('123'));
      expect(newEventData.time, equals(DateTime(2022, 1, 1)));
      expect(newEventData.expires, equals(DateTime(2022, 1, 2)));
      expect(newEventData.event, equals(EventTypes.none));
      expect(newEventData.topic, equals('Topic'));
      expect(newEventData.title, equals('Title'));
      expect(newEventData.message, equals('Message'));
      expect(newEventData.priority, equals(PriorityType.high));
      expect(newEventData.tags, equals(['tag1', 'tag2']));
      expect(newEventData.click, equals('https://example.com'));
      expect(newEventData.attachment,
          equals(Attachment(name: 'file.txt', url: '1024')));
    });

    test('props returns correct list of properties', () {
      var eventData = EventData(
        id: '123',
        time: DateTime(2022, 1, 1),
        expires: DateTime(2022, 1, 2),
        event: EventTypes.none,
        topic: 'Topic',
        title: 'Title',
        message: 'Message',
        priority: PriorityType.high,
        tags: ['tag1', 'tag2'],
        click: 'https://example.com',
        attachment: Attachment(name: 'file.txt', url: '1024'),
      );
      expect(
        eventData.props,
        equals([
          '123',
          DateTime(2022, 1, 1),
          DateTime(2022, 1, 2),
          EventTypes.none,
          'Topic',
          'Title',
          'Message',
          PriorityType.high,
          ['tag1', 'tag2'],
          'https://example.com',
          Attachment(name: 'file.txt', url: '1024'),
        ]),
      );
    });

    test('stringify returns true', () {
      var eventData = EventData();
      expect(eventData.stringify, equals(true));
    });
  });
}
