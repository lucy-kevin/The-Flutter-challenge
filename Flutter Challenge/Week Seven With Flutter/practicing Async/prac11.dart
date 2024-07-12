import 'dart:isolate';

void main(List<String> args) async {
  await for(final msg in getMsg().take(3)){
    print(msg);
  }
  

}

Stream<String> getMsg(){
  final rp = ReceivePort();
  return Isolate.spawn(_getMsg, rp.sendPort)
  .asStream()
  .asyncExpand((_) => rp)
  .takeWhile((element) => element is String)
  .cast();
}

void _getMsg(SendPort sp) async{
  await for (final now in Stream.periodic(
    Duration(seconds: 2),
    (_) => DateTime.now().toIso8601String(), 
  )){
    sp.send(now);
  }
}
