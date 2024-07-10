void main(List<String> args)async {
  try{
  await for(final name in name() ){
    print(name);

  }
  //to list
  final allNames =await firstName().toList();
  print(allNames);
  await for(final number in numbers()){
    print(number);
  } 
  } catch (e){
    print(e);
  }
}
Stream<String> firstName() async*{
  await Future.delayed(
    const Duration(seconds: 3),
  );
  yield "Kevin";
  yield "Julie";
  yield "Suzan";
}
Stream<String> lastName() async*{
  await Future.delayed(
    const Duration(seconds: 3),
  );
  yield "Aseru";
  yield "Kayikayi";
  yield "Ayikoru";
}
Stream<int> numbers() async* {
  for(var i = 0; i<10;i++){
    await Future.delayed(
      Duration(seconds: 2)
    );
    yield i;
  }
  throw "ERROR: DONE";
}
Stream<String> name() async*{
  yield* firstName();
  yield* lastName();

}  