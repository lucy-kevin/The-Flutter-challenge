import 'errorHandle.dart';

void main(List<String> args) async {
  final length = await getName().then((value) =>calculateLength(value));
  print(length);
  print(await getName());
  print(await getAge());
  
  try {
    print(
    await getFullName(firstName: "KEVIN", lastName: "Ziyada")
  );
   print(
    await getFullName(firstName: "", lastName: "Ziyada")
  );
  } on FirstOrLastNameMissingException {
   print("Missing First name or last");
  }
  
}
Future<String> getName() async => Future.delayed(
  const Duration(seconds: 3),
  () => "Aseru Kevin Ziyada",
);
Future<String> getFullName({
  required String firstName,
  required String lastName,
}){
  if (firstName.isEmpty || lastName.isEmpty){
    throw FirstOrLastNameMissingException();
  }else {
    return Future.value('$firstName $lastName');
  }
}


Future<int> calculateLength(String value)=> Future.delayed(
  Duration(seconds: 4),
  ()=> value.length,
);

Future<int> getAge() => Future.delayed( 
  Duration(seconds: 3),
  ()=> 22
);