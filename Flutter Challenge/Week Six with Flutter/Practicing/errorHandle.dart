void main(List<String> args) async {
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
  } on FirstOrLastNameMissingException {
    print("Missing First or Last name ");
  }
}
Future<String> getFullName({
  required String firstName,
  required String lastName,
}){
  if(firstName.isEmpty || lastName.isEmpty){
    throw FirstOrLastNameMissingException();
  }else{
    return Future.value('$firstName $lastName');
  }
}
class FirstOrLastNameMissingException implements Exception{
  const FirstOrLastNameMissingException();
}
