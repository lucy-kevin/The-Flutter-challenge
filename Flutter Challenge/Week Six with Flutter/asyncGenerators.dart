void main(List<String> args) async {
  await for(final value in numbers()){
  print(value);
  }
  print("-------------------------");

  await for(final value in numbers(end: 30, start: 10, f: evenNumberOnly)){
  print(value);
  }
}
typedef IsIncluded = bool Function(int value);
bool evenNumberOnly(int value) => value % 2 == 0;
bool oddNumberOnly(int value) => value % 2 != 0;
Stream<int> numbers({
  int start = 0,
  int end = 6,
  IsIncluded? f
}) async* {
  for(var i = start; i<end; i++){
    if (f ==null|| f(i)){
        yield i;
    }
  }
}
