void main(List<String> args) async{
  try{
  String name = await getName(firstName: "Kevin", secondName: "Aseru");
  print(name);
  String name2 = await getName(firstName: "", secondName: "Julie");
  print(name2);
  } on exceptionempty{
    print("Missing Name");
  }
  
}
Future<String> getName({
  required String firstName,
  required String secondName,
}){
  Future.delayed(
    Duration(seconds: 2)
  );
  if(firstName == "" || secondName == ""){
    throw exceptionempty();
  }else{
    return Future.value("$secondName $firstName");
  }
  
}

class exceptionempty implements Exception{
  const exceptionempty();
}