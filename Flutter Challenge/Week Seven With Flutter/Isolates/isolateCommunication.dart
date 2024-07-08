import 'dart:isolate';

void main(List<String> args) {
  
}

void _communicator(SendPort sp) async{
  final rp = ReceivePort();
  sp.send(rp);
}
const messagesAndResponses = {
  '': 'Ask me a question Like "How are you?"',
  'Hello': "Hi",
  'How are you?': 'Fine',
  "What are you doing?":"Learning Isolates in dart",
  'Are you having fun?': "Yeah sure"
};