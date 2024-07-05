import 'dart:async';

void main(List<String> args) async{
  // A stream controller is a read and write, a stream is a read only. and sink is a for write
  final controller = StreamController<String>();
  controller.sink.add('Hello');
  controller.sink.add("World");

  await for(final value in controller.stream){
    print(value);
  }
  controller.close();
}