

void main(List<String> args) {
  const person1 = Person(age: 23, name: "Kevin");
  print(longMessage(person1).line);

}
class Person{
  final String name;
  final int age;

  const Person({
    required this.age,
    required this.name,
  });
  
}
extension shortMessage on Person{
String get line => "Name: $name Age: $age";
}
extension longMessage on Person{
String get line => "My name is $name I am $age years old";


}

