import 'package:ntfluttery/src/models/extensions/datetime_extension.dart';
import 'package:test/test.dart';

void main() {
  group('DateTimeExtension Tests', () {
    test('toUnix returns the correct Unix timestamp', () {
      var dateTime = DateTime.utc(2022, 1, 1, 0, 0, 0);
      expect(dateTime.toUnix, equals(1640995200));
    });
  });
}
