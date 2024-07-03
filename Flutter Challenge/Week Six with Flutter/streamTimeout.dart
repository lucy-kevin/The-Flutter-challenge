import 'dart:async';


void main(List<String> args) async {
  try{
  await for (final name in getName().withTimeoutBetweenEvents(
    const Duration(
      seconds: 3,
    ),
  )){
    print(name);
  }
  } on TimeoutBetweenEventsException catch(e, stackTrace){
    print('TimeoutBetweenEventException: $e');
    print('Stack trace: $stackTrace');
  }
  
}
Stream<String> getName() async*{
  yield 'John';
  await Future.delayed(Duration(seconds: 2));
  yield 'Jane';
  await Future.delayed(Duration(seconds: 3));
  yield 'Jack';
  await Future.delayed(Duration(seconds: 7));
  yield 'Jill';
  
}

extension WithTimeoutBetweenEvents<T> on Stream<T>{
  Stream<T> withTimeoutBetweenEvents(Duration duration) => transform(
    TimeoutBetweenEvents(duration: duration),
  );
}


class TimeoutBetweenEvents<E> extends StreamTransformerBase<E, E>{
 
 final Duration duration;
 const TimeoutBetweenEvents({required this.duration,});
 @override
  Stream<E> bind(Stream<E> stream) {
  
    StreamController<E>? controller;
    StreamSubscription<E>? subscription;
    Timer? timer;

    controller = StreamController(
      onListen: (){
        subscription = stream.listen((data) {
          timer?.cancel();
          timer = Timer.periodic(
            duration, 
            (timer) {
              controller?.addError(
                TimeoutBetweenEventsException(
                  'timeout $duration',
                )
              );
            },
            );
            controller?.add(data);
        },
        onError: controller?.addError,
        onDone: controller?.close,
        
        );
      },
      onCancel: (){
        // ignore: dead_code
        subscription?.cancel();
        // ignore: dead_code
        timer?.cancel();
      },
    );
    return controller.stream;
  } 
}
class TimeoutBetweenEventsException implements Exception{
  final String message;
  TimeoutBetweenEventsException(this.message);
}