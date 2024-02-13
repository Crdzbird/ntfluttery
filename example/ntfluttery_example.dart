import 'package:ntfluttery/ntfluttery.dart';

Future<void> main() async {
  final String topic = 'topic';
  final cliente = NtflutteryService(
      credentials: Credentials(username: 'credentials', password: 'password'))
    ..addLogging(true);
  final result = await cliente.get('');
  result.$1.listen((event) {
    print(event.$1);
    print('\n\n\n secondRecord \n\n\n');
    print(event.$2);
  });

  final latest = await cliente.getLatestMessage('');
  print('latest: $latest');
}
