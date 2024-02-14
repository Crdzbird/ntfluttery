import 'package:ntfluttery/src/models/extensions/string_extension.dart';
import 'package:test/test.dart';

void main() {
  group('StringExtension Tests', () {
    test('Separate and parse JSON objects', () {
      var jsonString = '{"name":"John"}{"age":30}';
      var jsonObjects = jsonString.separateAndParseJson;
      expect(jsonObjects.length, equals(2));
      expect(jsonObjects[0], equals({'name': 'John'}));
      expect(jsonObjects[1], equals({'age': 30}));
    });

    test('Separate and parse empty string', () {
      var jsonString = '';
      var jsonObjects = jsonString.separateAndParseJson;
      expect(jsonObjects.length, equals(0));
    });

    test('Separate and parse invalid JSON', () {
      var jsonString = '{"name":"John"}{"age":30';
      var jsonObjects = jsonString.separateAndParseJson;
      expect(jsonObjects.length, equals(1));
      expect(jsonObjects[0], equals({'name': 'John'}));
    });

    test('Json wrong format', () {
      var jsonString = '{"name":"John"}{"age":{na:30}';
      var jsonObjects = jsonString.separateAndParseJson;
      expect(jsonObjects.length, equals(1));
    });
  });
}
