import 'package:ntfluttery/src/models/enums/event_types.dart';
import 'package:test/test.dart';

void main() {
  group('EventTypes Tests', () {
    test('Enum values should match string representation', () {
      expect(EventTypes.open.event, equals('open'));
      expect(EventTypes.keepAlive.event, equals('keepAlive'));
      expect(EventTypes.message.event, equals('message'));
      expect(EventTypes.pollRequest.event, equals('pollRequest'));
      expect(EventTypes.none.event, equals('none'));
    });

    test('fromValue should return correct enum for valid input', () {
      expect(EventTypes.fromValue('open'), equals(EventTypes.open));
      expect(EventTypes.fromValue('keepAlive'), equals(EventTypes.keepAlive));
      expect(EventTypes.fromValue('message'), equals(EventTypes.message));
      expect(
          EventTypes.fromValue('pollRequest'), equals(EventTypes.pollRequest));
    });

    test('fromValue should return none for invalid input', () {
      expect(EventTypes.fromValue('invalidInput'), equals(EventTypes.none));
    });
  });
}
