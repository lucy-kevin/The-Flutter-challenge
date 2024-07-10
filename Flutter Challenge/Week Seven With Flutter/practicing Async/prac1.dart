void main(List<String> args) async{
  print(await name());
  print(await sentences());
  print(await location());
  print(await locationSentence());
  
}

Future<String> name() async => Future.value("Kevin");
Future<String> sentences() async{
  await Future.delayed(
    const Duration(seconds: 6));
  return "My name is Kevin Aseru";
}
Future<String> location() async=>(
  await Future.delayed(
    Duration(seconds: 5),
  ()=> "Masaka",
  ));

Future<String> locationSentence() async =>(
  await Future.delayed(
    Duration(seconds: 5),
    ()=> "I am from Masaka",
  )
);
