import 'dart:async';
void main(List<String> args) async{
  final controller = StreamController<String>();
  controller.sink.add("Kevin");
  controller.sink.add("Julie");

  await for(final names in controller.stream ){
    print(names);
  } 
}