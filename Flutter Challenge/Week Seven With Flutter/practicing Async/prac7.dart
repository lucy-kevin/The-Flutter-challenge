import 'dart:async';

void main(List<String> args) async {
  
  await for (final name in names.capitalize){
    print(name);
  }
  print("****************************");
  await for (final name in names.smallLetters){
    print(name);
  }
}
Stream<String> names = Stream.fromIterable([
  "Kevin",
  "Julie",
  "Suzan",
]);

extension on Stream<String>{

  Stream<String> get capitalize => transform(ToUpperCase());
  Stream<String> get smallLetters =>  transform(ToLowerCase());


}
class ToUpperCase extends StreamTransformerBase<String, String>{
  @override
  Stream<String> bind(Stream<String> stream) {
   return stream.map((name) => name.toUpperCase());
  }
  
}
class ToLowerCase extends StreamTransformerBase<String, String>{
  @override
  Stream<String> bind(Stream<String> stream) {
    return stream.map((number) => number.toLowerCase());
  }

}