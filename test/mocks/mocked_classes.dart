import 'package:dio/dio.dart';
import 'package:mockito/mockito.dart';
import 'package:ntfluttery/ntfluttery.dart';

class MockNtflutteryService extends Mock implements NtflutteryService {}

class MockDio extends Mock implements Dio {
  final Interceptors _mockInterceptors = MockInterceptors();

  final BaseOptions _mockBaseAdapter = MockBaseAdapter();

  @override
  Interceptors get interceptors => _mockInterceptors;

  @override
  BaseOptions get options => _mockBaseAdapter;

  @override
  Future<Response<T>> get<T>(String path,
      {Object? data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onReceiveProgress}) {
    return super.noSuchMethod(
        Invocation.method(#get, [
          path
        ], {
          #data: data,
          #queryParameters: queryParameters,
          #options: options,
          #cancelToken: cancelToken,
          #onReceiveProgress: onReceiveProgress
        }),
        returnValue: Future.value(
            Response<T>(requestOptions: RequestOptions(path: path))),
        returnValueForMissingStub: Future.value(
            Response<T>(requestOptions: RequestOptions(path: path))));
  }
}

class MockInterceptors extends Mock implements Interceptors {}

class MockBaseAdapter extends Mock implements BaseOptions {
  @override
  bool receiveDataWhenStatusError = true;
}

class MockDioInterceptor extends Mock implements DioInterceptor {}
