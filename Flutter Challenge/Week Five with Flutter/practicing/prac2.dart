
void main(List<String> args){
  Person me = Person.Lucy(23);
  const Kevin = Person.other(name: "Kevin");
print(me.age);
print(Kevin.age);
print(Kevin.name);

}
class Person{
  final String name;
  final int age;

  const Person(
    this.name,
    this.age,
  );
  const Person.other({
    String? name,
    int? age,
  }):name = name?? "Kevin", age = age?? 22;

  const Person.Lucy(this.age) : name = "Lucy"; 

}