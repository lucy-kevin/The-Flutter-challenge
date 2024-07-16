import 'dart:isolate';
import 'dart:io';
import 'dart:convert';

void main(List<String> args)async{
      final responder = await Responder.create();
  do{


    stdout.write("Say something(or type exit):");
    final line = stdin.readLineSync(encoding: utf8);

    switch(line?.trim().toLowerCase()){
      case null:
        continue;
      case "exit":
        exit(0);
      default:
      final msg = await responder.getMessages(line!);
      print("bot: $msg");

    }
  }while(true);

}
class Responder{
  final ReceivePort rp;
  final Stream<dynamic> broadcastRp;
  final SendPort communicatorSendPort;

  const Responder({
    required this.rp,
    required this.broadcastRp,
    required this.communicatorSendPort,
  });
  //properties
  static Future<Responder> create() async{
    final rp =ReceivePort();
    Isolate.spawn(_communicator,rp.sendPort);

    final broadcostRp = rp.asBroadcastStream();
    final SendPort communicatorSendPort =await broadcostRp.first;

    return Responder(
      broadcastRp: broadcostRp,
      rp: rp, 
      communicatorSendPort: communicatorSendPort
    );
  }
  Future<String> getMessages(String forGreeting) async{
 
  communicatorSendPort.send(forGreeting);


  return broadcastRp
                    .takeWhile((test) => test is String)
                    .cast<String>()
                    .take(1)
                    .first;
}

}

void _communicator(SendPort sp) async{
  final rp = ReceivePort();
  sp.send(rp.sendPort);

  final messages = rp
                    .takeWhile((test)=> test is String)
                    .cast<String>();
    await for (final message in messages){
      for(final entry in messagesAndResponses.entries){
        if(entry.key.trim().toLowerCase() == message.trim().toLowerCase()){
          sp.send(entry.value);
          continue;
        }
      }
     
    }
                   
}
const messagesAndResponses = {
  "": "Ask me anything",
  "Hello":"hi",
  'how are you?': 'Fine',
  "what are you doing?": "Learning Isolates in Dart",
  'are you having fun?': "Yeah sure"
};