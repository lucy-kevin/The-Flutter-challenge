import 'dart:async';

void main(List<String> args) async {
  final controller = StreamController<String>();
  controller.sink.add("Aseru");
  controller.sink.add("Kevin");
  await for (final names in controller.stream){
    print(names);

  }
  

  controller.close();
  
}
