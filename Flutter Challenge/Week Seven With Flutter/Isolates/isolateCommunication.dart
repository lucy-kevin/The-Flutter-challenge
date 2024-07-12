import 'dart:isolate';
import 'dart:io';
import 'dart:convert';

void main(List<String> args) async {
  do {
    stdout.write('Say something:..\n');
    final line = stdin.readLineSync(encoding: utf8);
    if (line == null) {
      continue; // Handle null input gracefully
    }
    switch (line.trim().toLowerCase()) {
      case 'exit':
        exit(0);
      default:
        final msg = await getMessages(line);
        print(msg);
    }
  } while (true);
}

Future<String> getMessages(String forGreeting) async {
  final rp = ReceivePort();
  await Isolate.spawn(_communicator, rp.sendPort);
  final broadcastRp = rp.asBroadcastStream();
  final SendPort communicatorSendPort = await broadcastRp.first as SendPort;
  communicatorSendPort.send(forGreeting);

  return broadcastRp
      .skip(1) // Skip the first message (which is the SendPort)
      .takeWhile((element) => element is String)
      .cast<String>()
      .first;
}

void _communicator(SendPort sp) async {
  final rp = ReceivePort();
  sp.send(rp.sendPort);

  await for (final message in rp) {
    if (message is String) {
      final response = messagesAndResponses[message.trim().toLowerCase()] ??
          "I have no response to that!";
      sp.send(response);
    }
  }
}

const messagesAndResponses = {
  '': 'Ask me a question like "How are you?"',
  'hello': "Hi",
  'how are you?': 'Fine',
  "what are you doing?": "Learning Isolates in Dart",
  'are you having fun?': "Yeah sure"
};
