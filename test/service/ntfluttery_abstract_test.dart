import 'package:dio/dio.dart';
import 'package:ntfluttery/src/models/error/failure.dart';
import 'package:ntfluttery/src/models/event_data.dart';
import 'package:ntfluttery/src/service/nfluttery_abstract.dart';
import 'package:test/test.dart';

class MockNflutteryAbstract extends NflutteryAbstract {
  @override
  void addLogging(bool showLog) {}

  @override
  Future<
      (
        Stream<(List<EventData> messages, List<EventData> openMessages)>,
        Failure?,
      )> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    return (Stream<(List<EventData>, List<EventData>)>.empty(), null);
  }

  @override
  Future<Response<T>> post<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    return Response(data: null, requestOptions: RequestOptions(path: path));
  }

  @override
  Stream<Response<T>> getStream<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) {
    return Stream.empty();
  }

  @override
  Future<EventData> getLatestMessage(String path,
      {Map<String, dynamic>? queryParameters, Options? options}) {
    // TODO: implement getLatestMessage
    throw UnimplementedError();
  }

  @override
  Future<(List<EventData>, List<EventData>)> getTupledMessages(String path,
      {Map<String, dynamic>? queryParameters, Options? options}) {
    // TODO: implement getTupledMessages
    throw UnimplementedError();
  }

  @override
  Future<List<EventData>> getAllMessages(String path,
      {Map<String, dynamic>? queryParameters, Options? options}) {
    // TODO: implement getMessages
    throw UnimplementedError();
  }

  @override
  Future<List<EventData>> getOpenMessages(String path,
      {Map<String, dynamic>? queryParameters, Options? options}) {
    // TODO: implement getOpenMessages
    throw UnimplementedError();
  }

  @override
  Future<List<EventData>> getUnreadMessages(String path,
      {Map<String, dynamic>? queryParameters, Options? options}) {
    // TODO: implement getUnreadMessages
    throw UnimplementedError();
  }

  @override
  Future<(List<EventData>, List<EventData>)> getExpiredUnexpiredMessages(
      String path,
      {Map<String, dynamic>? queryParameters,
      Options? options}) {
    // TODO: implement getExpiredUnexpiredMessages
    throw UnimplementedError();
  }
}

void main() {
  group('NflutteryAbstract Tests', () {
    late NflutteryAbstract nflutteryAbstract;

    setUp(() {
      nflutteryAbstract = MockNflutteryAbstract();
    });

    test('createConfig should set showLog correctly', () {
      nflutteryAbstract.addLogging(true);
      expect(nflutteryAbstract, isA<NflutteryAbstract>());
    });

    test('get should return stream and failure', () async {
      final result = await nflutteryAbstract.get('path');
      expect(result.$1, isA<Stream>());
      expect(result.$2, isNull);
    });

    test('post should return response', () async {
      final result = await nflutteryAbstract.post('path');
      expect(result, isA<Response>());
    });

    test('getStream should return stream', () {
      final result = nflutteryAbstract.getStream('path');
      expect(result, isA<Stream>());
    });
  });
}
