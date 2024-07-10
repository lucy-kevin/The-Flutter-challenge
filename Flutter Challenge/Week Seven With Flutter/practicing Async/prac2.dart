void main(List<String> args) async{
  int numbers = await giveName("Kevin").then((value) => calname(value));
  print(numbers);
  
}

Future<String> giveName(String name) async{
  await Future.delayed(
    Duration(seconds: 2)
  );
  return name;
}
Future<int> calname(String value) async{
  return value.length;

}