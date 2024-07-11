import 'dart:async';
void main(List<String> args) async {
  try {
    await for (final name in names().withTimeoutBtwnEvents(
      const Duration(seconds: 3),
    )){
      print(name);
    }
    
  } on TimeoutBetweenEventException catch (e, stackTrace) {

    print(e);
    print(stackTrace);
  }
  
}
Stream<String> names() async*{
  await Future.delayed(
    Duration(seconds: 2),
  );
  yield "Kevin";
  await Future.delayed(
    Duration(seconds: 2),
  );
  yield "Axcel";
  await Future.delayed(
    Duration(seconds: 4),
  );
  yield "Melady";

}
extension WithTimeoutBtnEvents<T> on Stream<T>{
  Stream<T> withTimeoutBtwnEvents(Duration duration) => transform(timeOutBtwn(duration: duration,));
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
            controller?.addError(
              TimeoutBetweenEventException("Timeout $duration")
            );
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
