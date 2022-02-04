import 'dart:convert';
import 'dart:io';

Future<void> main(List<String> args) async {
  int number;

  int? number2;
  print(number2);

  final file = File('result.json');
  final json = await file.readAsString();

  final parsedJson = jsonDecode(json);
  final list = parsedJson['messages'];
  for (final message in list) {
    if (message is Map && (message['id'] ?? 0) == 21) {
      print(message['photo']);

      for (final element in message['text']) {
        if (element is Map && element['type'] == 'code') {
          print(element['text']);
        }
      }
    }
  }

  // print(parsedJson['messages']);
}

// void thenReady(String str) {
//   print(str);
// }
