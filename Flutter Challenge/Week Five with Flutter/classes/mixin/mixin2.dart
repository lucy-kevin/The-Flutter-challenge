void main(List<String>args){

  final kevinLucy = Person(FirstName: "Kevin", lastname: "Lucy");
  print(kevinLucy.FullName);
  print(getfullname(kevinLucy));
}

String getfullname(HasFullName obj) =>obj.FullName;

mixin HasFirstName{
  String get FirstName;
}
mixin HasLastName{
  String get lastname;
}
mixin HasFullName on HasFirstName, HasLastName{
  String get FullName => "$FirstName $lastname";
}
class Person with HasFirstName, HasLastName, HasFullName{
  @override
  // TODO: implement FirstName
  final String  FirstName;

  @override
  
  final String lastname;

  Person({
    required this.FirstName,
    required this.lastname,
  });

}