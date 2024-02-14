import 'package:ntfluttery/src/models/extensions/int_extension.dart';
import 'package:test/test.dart';

void main() {
  group('IntExtension Tests', () {
    test('toDateTimeFromUnix', () {
      var unixTimestamp = 1633072800;
      var dateTime = unixTimestamp.toDateTimeFromUnix;
      expect(dateTime,
          equals(DateTime.fromMillisecondsSinceEpoch(unixTimestamp * 1000)));
    });
  });
}
