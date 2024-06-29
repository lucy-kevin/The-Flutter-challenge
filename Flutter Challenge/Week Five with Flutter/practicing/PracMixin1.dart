void main(List<String>args){

  final kevinLucy = Name(firstName: "Kevin", secondName: "Lucy");
  print(kevinLucy.fullName);
    
}


mixin HasFirstName{
  String get firstName;
}
mixin HasSecondName{
  String get secondName;
}
mixin HasFullName on HasFirstName, HasSecondName{
  String get fullName => "$firstName $secondName";

}
class Name with HasFirstName, HasSecondName, HasFullName{
  @override
  // TODO: implement firstName
  late final String firstName;

  @override
  // TODO: implement secondName
  late final String secondName;

  Name({
    required this.firstName,
    required this.secondName,
  });

}