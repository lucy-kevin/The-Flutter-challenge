import 'dart:convert';
import 'dart:io';
import 'dart:isolate';

void main(List<String> args) async{
  do {
    stdout.write("Hey, say something:");
    final line = stdin.readLineSync(encoding: utf8);

    switch(line?.trim().toLowerCase()){
      case "exit":
        exit(0);
      case null:
        continue;
      default:
        final msg = await getMessage(line!);
        print("bot: $msg");
    }
    
  } while (true);
  
}

Future<String> getMessage(String forMessage) async{
  final rp = ReceivePort();
  Isolate.spawn(_communicator,rp.sendPort);
  final broadcast = rp.asBroadcastStream();
  final SendPort communatorSendPort = await broadcast.first;
  communatorSendPort.send(forMessage);
  return broadcast
                  .takeWhile((element) => element is String)
                  .cast<String>()
                  .take(1)
                  .first;
}

void _communicator(SendPort sp) async{
  final rp = ReceivePort();
  sp.send(rp.sendPort);

  final messages = rp
                    .takeWhile((element) => element is String)
                    .cast<String>();
  await for(final message in messages){
    for(final entry in communateMessages.entries){
      if(entry.key.trim().toLowerCase() == message.trim().toLowerCase()){
        sp.send(entry.value);
      }
    }
    sp.send("I have no idea on what you are saying");
  }
}

const communateMessages={
  "": "Hey, Say something",
  "Hello": "Hi",
  "Hi" : "Hello",
  "Sup": "Nothing",
  "How are you":"I am fine" ,
};