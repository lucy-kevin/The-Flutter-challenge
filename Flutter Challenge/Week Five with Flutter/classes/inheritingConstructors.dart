void main(List<String>args){
  final mom1 = Mom();
  print(mom1.role);

}
enum Role { mom, dad, son, daughter, grandpa, grandma}
class Person{
  final Role role;

  const Person({
    required this.role
  });


}


class Mom extends Person{
  const Mom() : super(role: Role.mom);
  
}
class Dad extends Person{
  const Dad() : super(role: Role.dad);
  
}