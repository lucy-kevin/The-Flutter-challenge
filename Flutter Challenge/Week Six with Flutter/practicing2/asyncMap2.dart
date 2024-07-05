void main(List<String> args) async{
  final names3Times = names().asyncExpand((event) => times3(event));
  await for (final names in names3Times){
    print(names);
  }
  
}
Stream<String> names() async*{
  yield "Kevin";
  yield "julie";
}
Stream<String> times3(String value) => 
Stream.fromIterable(
  Iterable.generate(3, (_) => value,), 
);
