void main(List<String> args) async{
  final names3Times = getNames().asyncExpand(
    (name) => times3(name),
    );
  await for(final names in names3Times){
      print(names);
    }
  
}
Stream<String> getNames() async*{
  yield "Kevin";
  yield "Julie";
  yield "Suzan";
}
Stream<String> times3(String value)=> Stream
.fromIterable(
  Iterable.generate(3, (_) => value,),
);