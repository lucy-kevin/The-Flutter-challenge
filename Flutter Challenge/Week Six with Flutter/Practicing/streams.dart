void main(List<String> args) async {
  await for(final number in getNumbers()){
    print(number);
  }
  try {
    await for (final name in getName()){
      print(name);
    }
  } catch (e) {
    print(e);
  }
  
}
Stream<int> getNumbers() async*{
  for (int i = 0; i <10; i++){
    await Future.delayed(
      Duration(seconds: 1),
    );
    yield i;
  }
}
Stream<String> getName() async*{
  await Future.delayed(
    Duration(seconds: 2),
   
  );
  yield "Kevin";
  throw Exception("Something is wrong");
}