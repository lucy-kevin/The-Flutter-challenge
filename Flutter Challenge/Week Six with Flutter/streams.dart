
void main(List<String> args) async {
  await for (final numbers in getNumbers()){
    print(numbers);
    }

  try {
     await for (final names in getNames()){
    print(names);
  } 
  } catch (e) {
    print(e);
    
  }
}
Stream<int> getNumbers() async*{
  for (var i = 0; i < 10; i ++){
    await Future.delayed(
      const Duration(seconds: 1),
      );
    yield i;
  }

}
Stream<String> getNames() async*{
  await Future.delayed(
    Duration(seconds: 1)
  );
  yield 'John';
  throw Exception('Something is wrong');
}
