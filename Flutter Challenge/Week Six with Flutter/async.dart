void main(List<String> args) async {
  
  print(await getUserName());
  print(await getUserNumber());
  print(await getUserAddress());
  print(await getCountry());
  print(await getZipCode());
  
  
  
}
Future<String> getUserName() async => "John Doe";
Future<String> getUserAddress() => Future.value("123 Main St");
Future<String> getUserNumber()=> Future.delayed(
  const Duration(seconds: 4),
  () => '555-555-5555',
  );

Future<String> getCountry() async { 
  await Future.delayed(const Duration(seconds: 5));
  return "Uganda";
  
}
Future<String> getCity() => Future.value("Kampala");
// async keyword doesn't really contribute with anything here
Future<String> getZipCode() async => Future.delayed(
  const Duration(seconds: 3),
  (() => '12333'),
  );

