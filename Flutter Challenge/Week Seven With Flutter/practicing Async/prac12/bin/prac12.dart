import "dart:isolate";

void main(List<String> args) async {
  final url = Uri.parse("package:prac12/prac12.dart");
  final rp = ReceivePort();
  Isolate.spawnUri(url, [], rp.sendPort);
  final message = await rp.first;
  print(message);
}