
# ntfluttery

This plugin is focused on help with the integration of ntfy.sh it has multiple ways to access the list of messages such as a Streaming of data or even using custom credentials.

Also it provides various ways to handle the messages list.

## Features

- **Ready to use NTFY**:
- **Tuples of messages**: Thanks to Dart 3, you can fetch customisable tuples based on the type of message.
- **Error Handling and Data Processing**
- **Growing test percentage**: The test percentage is being continously growing, to ensure a fully tested library.

## Getting Started

### Installation

To use this plugin, add `ntfluttery` as a dependency in your `pubspec.yaml` file.

```yaml
dependencies:
  ntfluttery: ^latest_version
```

### Usage

```dart
import 'package:ntfluttery/ntfluttery.dart';

void main() {
    // initialize the client
  final client = NtflutteryService(
      credentials:
          Credentials(username: 'ntfyUser', password: 'ntfyPassword'));

    // Inject a logger into each request.
    client.addLogging(true);

    // Fetch from the NTFY API as a STREAM
  final result = await cliente
      .get('https:/notification/$topic/json?poll=1');

    // Received the data as a touple ready to be used.
  result.$1.listen((event) {
    print(event.$1);
    print(event.$2);
  });
}
```


```dart
import 'package:ntfluttery/ntfluttery.dart';

void main() {
    // initialize the client
  final client = NtflutteryService(
      credentials:
          Credentials(username: 'ntfyUser', password: 'ntfyPassword'));

    // Or fetch the messages and instead of use a Streaming just use it as a simple Future value.
    final latest = await cliente.getLatestMessage(
      'https://notification/$topic/json?poll=1');
  print('latest: $latest');
}
```


## Additional Information

- **Platform Support**: iOS, Android, Web, Desktop
- **Dependencies**: Dio, Flutter, PrettyDioLogger

## Contributing

Contributions are welcome!

## License

This project is licensed under the MIT License.

## Special thanks
Thanks to [Philipp C. Heckel](https://heckel.io/) for create this great tool.

## Support and Contact

If you have any questions or issues, please file them on issue tracker.

For further inquiries, contact me at luisalfonsocb83@gmail.com.
