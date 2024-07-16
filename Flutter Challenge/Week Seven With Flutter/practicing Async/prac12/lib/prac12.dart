import 'dart:isolate';

void main(
  List<String> args,
  SendPort sendPort,
) {
  sendPort.send("Hello from Isolate");
}