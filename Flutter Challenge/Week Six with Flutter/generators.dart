import 'dart:async';

void main(List<String> args) async{

  await for(final names in Names()){
    print(names);
  }
  
}

Stream<String> MaleNames() async*{
  yield "John";
  yield "Mark";
  yield "Jacob";
}
Stream<String> FemaleNames() async*{
  yield "Jane";
  yield "Martha";
  yield "Julie";
}

Stream<String> Names() async*{
  yield* MaleNames();
  yield* FemaleNames();

}