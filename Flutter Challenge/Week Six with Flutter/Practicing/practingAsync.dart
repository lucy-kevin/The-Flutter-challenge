void main(List<String> args) async{
  print(await getAge());
  print(await getName());
  print(await getLocation());

  
}
Future<int> getAge() async => 22;
Future<String> getName() => Future.value("Aseru Kevin");
Future<String> getLocation() => Future.delayed(
  const Duration(seconds: 2),
()=> "Masaka");
