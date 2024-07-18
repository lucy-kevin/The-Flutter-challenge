
import 'dart:convert';
import 'dart:io';
import 'dart:isolate';

void main(List<String> args) async {
  do{
    stdout.write("Say something:");
    final line = stdin.readLineSync(encoding: utf8);

    switch(line?.trim().toLowerCase()){
      case null:
        continue;
      case "exit":
        exit(0);
      default:
        final msg = await getMessage(line!);
        print("bot: $msg");
    }
  }while(true);
  
}
Future<String> getMessage(String forGreeting) async{
  final rp = ReceivePort();
  Isolate.spawn(_communicator,rp.sendPort);
  final broadcast = rp.asBroadcastStream();
  final SendPort communicatorSendPort =await broadcast.first;
  communicatorSendPort.send(forGreeting);

  return broadcast
                  .takeWhile((test) => test is String)
                  .cast<String>()
                  .take(1)
                  .first;
}

void _communicator(SendPort sp) async{
  final rp = ReceivePort();
  sp.send(rp.sendPort);

  final messages = rp.
                    takeWhile((test) => test is String)
                    .cast<String>();
  
  await for(final message in messages){
    for(final entry in messagesAndResponses.entries){
      if(entry.key.trim().toLowerCase() == message.trim().toLowerCase()){
        sp.send(entry.value);
        continue;
      }

    }
    sp.send("I dont have the response to that");
  }

}










// void _communicator(SendPort sp) async{
//   final rp = ReceivePort();
//   sp.send(rp.sendPort);

//   final messages = rp
//                     .takeWhile((test) =>test is String )
//                     .cast<String>();
//   await for (final message in messages)
// {
//   for(final entry in messagesAndResponses.entries){
//     if(entry.key.trim().toLowerCase() == message.trim().toLowerCase()){
//       sp.send(entry.value);
//       continue;
//     }
    
//   }
//   sp.send("I have no response for that");
// }  


// }
const messagesAndResponses = {
  "": "Hey you say anything",
  "Hello":"hi",
  'how are you?': 'Fine',
  "what are you doing?": "Learning Isolates in Dart",
  'are you having fun?': "Yeah sure"
};