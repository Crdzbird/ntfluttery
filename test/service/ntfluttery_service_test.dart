import 'package:dio/dio.dart';
import 'package:mockito/mockito.dart';
import 'package:ntfluttery/ntfluttery.dart';
import 'package:test/test.dart';

import '../mocks/mocked_classes.dart';

void main() {
  group('NtflutteryService createConfig Tests', () {
    late NtflutteryService service;
    late Dio mockDio;
    final response =
        '[{"id": "X697rwef7blc","time": 1707820329,"expires": 1707863529,"event": "message","topic": "ravenPruebaTecnica","message": "testing"},{"id": "KGYH9e8PapKK","time": 1707820338,"expires": 1707863538,"event": "message","topic": "ravenPruebaTecnica","message": "second test"}';

    setUp(() {
      mockDio = MockDio();
      service = NtflutteryService(dio: mockDio);
    });

    test('should update Dio configuration based on provided boolean', () {
      bool sampleConfig = true; // Example config value
      service.addLogging(sampleConfig);

      var options = mockDio.options;
      expect(options.receiveDataWhenStatusError, true);
    });

    test('should correctly handle a GET request', () async {
      String testPath = 'test/path';
      final mockResponse = Response(
          requestOptions: RequestOptions(path: testPath), data: response);
      when(mockDio.get(testPath)).thenAnswer((_) => Future.value(mockResponse));
      service.get(testPath).asStream().listen((event) {
        expect(event.$1, isA<Stream<(List<EventData>, List<EventData>)>>());
        expect(event.$2, isNull);
      });

      verify(mockDio.get(testPath)).called(1);
    });
  });
}
