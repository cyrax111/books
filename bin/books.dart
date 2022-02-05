import 'dart:convert';
import 'dart:io';

Future<void> main(List<String> args) async {
  final fileDescriptions = File('BookDescriptions.json');
  final json = await fileDescriptions.readAsString();

  final parsedJson = jsonDecode(json);
  final list = parsedJson['messages'];
  for (final message in list) {
    if (message is Map && (message['id'] ?? 0) >= 21) {
      print('\n\n-----');
      print(message['id']);
      for (final element in message['text']) {
        if (element is Map) {
          switch (element['type']) {
            case 'hashtag':
              print(element['text'].toString().trim());
              break;
            case 'pre':
              print(element['text'].toString().trim());
              break;
            case 'code':
              print(element['text'].toString().trim());
              break;
            case 'text_link':
              print(element['href'].toString().trim());
          }
        }
      }
    }
  }
}
