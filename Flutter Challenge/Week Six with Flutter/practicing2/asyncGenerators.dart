void main(List<String> args) async{
  await for(final num in number()){
    print(num);
  }
  await for(final num in number(start: 3, end: 13, f: evenNumbersOnly)){
    print(num);
  }
  try {
    await for(final names in Names()){
      print(names);
    }
   
    
  } catch (e) {
    print(e);
  }
  
}
typedef isIncluded = bool Function(int value);

bool evenNumbersOnly(int value) =>value% 2 == 0;
bool oddNumbersOnly(int value) => value% 2 != 0;

Stream<int> number({
  int start = 0,
  int end = 6,
  isIncluded? f
})async* {
  for(int i = start; i < end; i ++){
    if(f == null || f(i)){
      yield i;
    }
  }

}
Stream<String> FemaleNames() async*{
  yield "Lucy";
  yield "Rachel";
  yield "Miriam";
  
}
Stream<String> MaleNames() async*{
  yield "Luke";
  yield "Richard";
  yield "Matthew";
}
Stream<String> Names() async*{
  yield* FemaleNames();
  yield* MaleNames();
  throw "The names are done";

}