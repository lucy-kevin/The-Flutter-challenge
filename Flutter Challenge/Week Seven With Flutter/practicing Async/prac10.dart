import 'dart:async';

void main(List<String> args) async {
  await BroadcastingNames();
  
}
Future<void> BroadcastingNames() async{
  final StreamController<String> controller;

  controller = StreamController<String>.broadcast();
  final sub1 = controller.stream.listen((name) {
    print("sub1: $name");
  });
  final sub2 = controller.stream.listen((name) {
    print("sub2: $name");
  });
  controller.sink.add("Kevin");
  controller.sink.add("Julie");
  controller.close();

  controller.onCancel =() {
    
    print("onCancel");
    sub2.cancel();
    sub2.cancel();
    sub1.cancel();
    sub1.cancel();
  };
}
