import 'package:ntfluttery/src/models/credentials.dart';
import 'package:test/test.dart';

void main() {
  group('Credentials Tests', () {
    test('Default constructor assigns properties correctly', () {
      var credentials = Credentials(username: 'test', password: 'password');
      expect(credentials.username, equals('test'));
      expect(credentials.password, equals('password'));
    });

    test('JSON serialization', () {
      var credentials = Credentials(username: 'test', password: 'password');
      var json = credentials.toMap;
      expect(json['username'], equals('test'));
      expect(json['password'], equals('password'));
    });

    test('Credentials fromJson', () {
      var json = '{"username": "test", "password": "password"}';
      var credentials = Credentials.fromJson(json);
      expect(credentials.username, equals('test'));
    });

    test('Credentials toJson', () {
      var credentials = Credentials(username: 'test', password: 'password');
      var json = credentials.toJson;
      expect(json, equals('{"username":"test","password":"password"}'));
    });

    test('Credentials basicAuth', () {
      var credentials = Credentials(username: 'test', password: 'password');
      var basicAuth = credentials.basicAuth;
      expect(basicAuth, equals('Basic dGVzdDpwYXNzd29yZA=='));
    });

    test('JSON deserialization', () {
      var json = {'username': 'test', 'password': 'password'};
      var credentials = Credentials.fromMap(json);
      expect(credentials.username, equals('test'));
      expect(credentials.password, equals('password'));
    });

    test('Equality and hashcode', () {
      var credentials1 = Credentials(username: 'test', password: 'password');
      var credentials2 = Credentials(username: 'test', password: 'password');
      expect(credentials1, equals(credentials2));
      expect(credentials1.hashCode, equals(credentials2.hashCode));
    });

    test('CopyWith', () {
      var credentials = Credentials(username: 'test', password: 'password');
      var newCredentials =
          credentials.copyWith(username: 'new', password: 'new');
      expect(newCredentials.username, equals('new'));
      expect(newCredentials.password, equals('new'));
    });

    test('CopyWith null', () {
      var credentials = Credentials(username: 'test', password: 'password');
      var newCredentials = credentials.copyWith();
      expect(newCredentials.username, equals('test'));
      expect(newCredentials.password, equals('password'));
    });

    test('ToString', () {
      var credentials = Credentials(username: 'test', password: 'password');
      expect(credentials.toString(), equals('Credentials(test, password)'));
    });

    test('Props', () {
      var credentials = Credentials(username: 'test', password: 'password');
      expect(credentials.props, equals(['test', 'password']));
    });
  });
}
