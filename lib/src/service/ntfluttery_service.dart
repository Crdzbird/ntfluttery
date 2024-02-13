import 'dart:async';

import 'package:dio/dio.dart';
import 'package:ntfluttery/src/models/credentials.dart';
import 'package:ntfluttery/src/models/error/failure.dart';
import 'package:ntfluttery/src/models/event_data.dart';
import 'package:ntfluttery/src/models/extensions/dio_extension.dart';
import 'package:ntfluttery/src/models/extensions/event_datalist_extension.dart';
import 'package:ntfluttery/src/models/extensions/exception_extension.dart';
import 'package:ntfluttery/src/service/nfluttery_abstract.dart';

class NtflutteryService implements NflutteryAbstract {
  NtflutteryService({Credentials? credentials, Dio? dio})
      : _credentials = credentials,
        _dio = dio ?? Dio(BaseOptions(receiveDataWhenStatusError: true))
          ..addWatcher(credentials);

  final Dio _dio;

  Credentials? _credentials;

  Credentials? get credentials => _credentials;

  void updateCredentials(Credentials? credentials) =>
      _credentials = credentials;

  @override
  void createConfig(bool showLog) {
    if (showLog) _dio.addInterceptors();
  }

  @override
  Future<Response<EventData>> post<EventData>(String path,
      {data, Map<String, dynamic>? queryParameters, Options? options}) {
    throw UnimplementedError();
  }

  @override
  Stream<Response<EventData>> getStream<EventData>(String path,
      {Map<String, dynamic>? queryParameters, Options? options}) {
    return _dio
        .get<EventData>(
          path,
          queryParameters: queryParameters,
          options: options?.copyWith(responseType: ResponseType.stream),
        )
        .asStream();
  }

  @override
  Future<EventData> getLatestMessage(String path,
      {Map<String, dynamic>? queryParameters, Options? options}) async {
    try {
      final data = await _dio.get(
        path,
        queryParameters: queryParameters,
        options: options,
      );
      return EventData.fromList(data.data).latestMessage;
    } on Exception catch (e) {
      throw ServerFailure(errorMessage: e.message);
    }
  }

  @override
  Future<
          (
            Stream<(List<EventData> messages, List<EventData> openMessages)>,
            Failure? failure
          )>
      get(String path,
          {Map<String, dynamic>? queryParameters, Options? options}) async {
    try {
      final response = _dio
          .get(
            path,
            queryParameters: queryParameters,
            options: options?.copyWith(responseType: ResponseType.stream),
          )
          .asStream();
      return (
        response.transform(StreamTransformer<Response<dynamic>,
            (List<EventData>, List<EventData>)>.fromHandlers(
          handleData: (data, sink) =>
              sink.add(EventData.fromList(data.data).splitEvent),
        )),
        null
      );
    } on Exception catch (e) {
      return (
        Stream<(List<EventData>, List<EventData>)>.empty(),
        ServerFailure(errorMessage: e.message)
      );
    }
  }

  @override
  Future<(List<EventData>, List<EventData>)> getTupledMessages(String path,
      {Map<String, dynamic>? queryParameters, Options? options}) async {
    try {
      final data = await _dio.get(
        path,
        queryParameters: queryParameters,
        options: options,
      );
      return EventData.fromList(data.data).splitEvent;
    } on Exception catch (e) {
      throw ServerFailure(errorMessage: e.message);
    }
  }

  @override
  Future<List<EventData>> getAllMessages(String path,
      {Map<String, dynamic>? queryParameters, Options? options}) async {
    try {
      final data = await _dio.get(
        path,
        queryParameters: queryParameters,
        options: options,
      );
      return EventData.fromList(data.data);
    } on Exception catch (e) {
      throw ServerFailure(errorMessage: e.message);
    }
  }

  @override
  Future<List<EventData>> getOpenMessages(String path,
      {Map<String, dynamic>? queryParameters, Options? options}) async {
    try {
      final data = await _dio.get(
        path,
        queryParameters: queryParameters,
        options: options,
      );
      return EventData.fromList(data.data).openMessages;
    } on Exception catch (e) {
      throw ServerFailure(errorMessage: e.message);
    }
  }

  @override
  Future<List<EventData>> getUnreadMessages(String path,
      {Map<String, dynamic>? queryParameters, Options? options}) async {
    try {
      final data = await _dio.get(
        path,
        queryParameters: queryParameters,
        options: options,
      );
      return EventData.fromList(data.data).messages;
    } on Exception catch (e) {
      throw ServerFailure(errorMessage: e.message);
    }
  }

  @override
  Future<(List<EventData>, List<EventData>)> getExpiredUnexpiredMessages(
      String path,
      {Map<String, dynamic>? queryParameters,
      Options? options}) async {
    try {
      final data = await _dio.get(
        path,
        queryParameters: queryParameters,
        options: options,
      );
      return EventData.fromList(data.data).splitExpiration;
    } on Exception catch (e) {
      throw ServerFailure(errorMessage: e.message);
    }
  }
}
