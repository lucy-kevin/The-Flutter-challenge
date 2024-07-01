Future<void> main(List<String> args) async {
  try {
    print( 
    await getFullName(
      firstName: "Kevin",
      lastName: "Aseru")
  );
  print( 
    await getFullName(
      firstName: "",
      lastName: "Aseru")
  );
    
  }on FirstorLastNameMissingException {
    print("First or last name missing");
    
  }
  
  
}
Future<String> getFullName({
  required String firstName,
  required String lastName,
}){
  if (firstName.isEmpty || lastName.isEmpty){
    throw FirstorLastNameMissingException();
  }else{
    return Future.value('$firstName $lastName');
  }
}
class FirstorLastNameMissingException implements Exception{
  const FirstorLastNameMissingException();
}
