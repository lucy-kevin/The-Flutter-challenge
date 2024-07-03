import 'dart:async';

void main(List<String> args) async {
  await for (final name in getNames().absorbErrorsUsingHandleError()){
    print(name);
  }
  await for (final name in getNames().absorbErrorsUsingHandlers()){
    print(name);
  }
  //  await for (final name in getNames().absorbErrorsUsingTransformers()){
  //   print(name);
  // }
}
extension AbsorbErros<T> on Stream<T> {
  Stream<T> absorbErrorsUsingHandleError() => handleError(
    (_, __){},

  );
  //or
  Stream<T> absorbErrorsUsingHandlers() => transform(
    StreamTransformer.fromHandlers(
      handleError: (_, __, sink) => sink.close(),
    )
  );
  // Stream<T> absorbErrorsUsingTransformers() => transform(
  //   StreamErrorAbsorber(),);

}
Stream<String> getNames() async*{
  yield "Kevin";
  yield "Lucy";
  throw "Wrong name";

}
// class StreamErrorAbsorber<T> extends StreamTransformerBase<T, T>{
//   @override
//   Stream<T> bind(Stream<T> stream){
//     final controller = StreamController<T>();
//     stream.listen(
//       controller.sink.add,
//       onError: (_){}, onDone: controller.close
//     );
//   }
// }

