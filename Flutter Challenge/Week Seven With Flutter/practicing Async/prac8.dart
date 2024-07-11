import 'dart:async';

void main(List<String> args) {
  
}


class timeOutBtwn<E> extends StreamTransformerBase<E, E>{
  final Duration duration;
  const timeOutBtwn({
    required this.duration,
  });
  
  @override
  Stream<E> bind(Stream<E> stream) {
    StreamSubscription<E>? subscription;
    StreamController<E>? controller;
    Timer? timer;

    controller = StreamController(
      onListen: (){
        subscription = stream.listen((data) {
          timer?.cancel();
          timer = Timer.periodic(duration, (timer) {
            controller?.addError("error");
           });
           controller?.add(data);
          
        },
        onError: controller?.addError,
        onDone: controller?.close,
        );
      },
      onCancel: (){
        subscription?.cancel();
        timer?.cancel();
      }
    );
    return controller.stream;
  }
  

}

class TimeoutBetweenEventException implements Exception{
  final String message;
  const TimeoutBetweenEventException(this.message);
}
