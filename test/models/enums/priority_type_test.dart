import 'package:ntfluttery/src/models/enums/priority_type.dart';
import 'package:test/test.dart';

void main() {
  group('PriorityType Tests', () {
    test('Enum values should match numeric priority levels', () {
      expect(PriorityType.min.type, equals(1));
      expect(PriorityType.low.type, equals(2));
      expect(PriorityType.none.type, equals(3));
      expect(PriorityType.high.type, equals(4));
      expect(PriorityType.max.type, equals(5));
    });

    test('fromValue should return correct enum for valid input', () {
      expect(PriorityType.fromValue(1), equals(PriorityType.min));
      expect(PriorityType.fromValue(2), equals(PriorityType.low));
      expect(PriorityType.fromValue(3), equals(PriorityType.none));
      expect(PriorityType.fromValue(4), equals(PriorityType.high));
      expect(PriorityType.fromValue(5), equals(PriorityType.max));
    });

    test('fromValue should return none for invalid input', () {
      expect(PriorityType.fromValue(0), equals(PriorityType.none));
      expect(PriorityType.fromValue(6), equals(PriorityType.none));
    });

    test('fromString should return correct enum for valid input', () {
      expect(PriorityType.fromString('PriorityType.min'),
          equals(PriorityType.min));
      expect(PriorityType.fromString('PriorityType.low'),
          equals(PriorityType.low));
      expect(PriorityType.fromString('PriorityType.none'),
          equals(PriorityType.none));
      expect(PriorityType.fromString('PriorityType.high'),
          equals(PriorityType.high));
      expect(PriorityType.fromString('PriorityType.max'),
          equals(PriorityType.max));
    });

    test('fromString should return none for invalid input', () {
      expect(PriorityType.fromString('invalid'), equals(PriorityType.none));
    });
  });
}
