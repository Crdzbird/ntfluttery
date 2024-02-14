import 'package:ntfluttery/src/models/attachment.dart';
import 'package:test/test.dart';

void main() {
  group('Attachment Tests', () {
    test('Default constructor assigns properties correctly', () {
      var attachment =
          Attachment(name: 'Attachment', url: 'https://example.com');
      expect(attachment.name, equals('Attachment'));
      expect(attachment.url, equals('https://example.com'));
    });

    test('JSON serialization', () {
      var attachment =
          Attachment(name: 'Attachment', url: 'https://example.com');
      var json = attachment.toMap;
      expect(json['name'], equals('Attachment'));
      expect(json['url'], equals('https://example.com'));
    });

    test('JSON deserialization', () {
      var json = {'name': 'Attachment', 'url': 'https://example.com'};
      var attachment = Attachment.fromMap(json);
      expect(attachment.name, equals('Attachment'));
      expect(attachment.url, equals('https://example.com'));
    });

    test('Equality and hashcode', () {
      var attachment1 =
          Attachment(name: 'Attachment', url: 'https://example.com');
      var attachment2 =
          Attachment(name: 'Attachment', url: 'https://example.com');
      expect(attachment1, equals(attachment2));
      expect(attachment1.hashCode, equals(attachment2.hashCode));
    });

    test('CopyWith', () {
      var attachment =
          Attachment(name: 'Attachment', url: 'https://example.com');
      var newAttachment = attachment.copyWith(name: 'New Attachment');
      expect(newAttachment.name, equals('New Attachment'));
      expect(newAttachment.url, equals('https://example.com'));
    });

    test('CopyWith null', () {
      var attachment =
          Attachment(name: 'Attachment', url: 'https://example.com');
      var newAttachment = attachment.copyWith();
      expect(newAttachment.name, equals('Attachment'));
      expect(newAttachment.url, equals('https://example.com'));
    });

    test('FromJson', () {
      var attachment = Attachment.fromJson(
          '{"name":"Attachment","url":"https://example.com"}');
      expect(attachment.name, equals('Attachment'));
      expect(attachment.url, equals('https://example.com'));
    });

    test('ToJson', () {
      var attachment =
          Attachment(name: 'Attachment', url: 'https://example.com');
      expect(attachment.toJson,
          equals('{"name":"Attachment","url":"https://example.com"}'));
    });

    test('Stringify', () {
      var attachment =
          Attachment(name: 'Attachment', url: 'https://example.com');
      expect(attachment.stringify, equals(true));
    });

    test('Props', () {
      var attachment =
          Attachment(name: 'Attachment', url: 'https://example.com');
      expect(attachment.props, equals(['Attachment', 'https://example.com']));
    });

    test('ToString', () {
      var attachment =
          Attachment(name: 'Attachment', url: 'https://example.com');
      expect(attachment.toString(),
          equals('Attachment(Attachment, https://example.com)'));
    });
  });
}
