void main(List<String> args) {
  const jack = Person(name: "Jack", age: 22);
  print(LongDiscription(jack).description);
  print(ShortDiscription(jack).description);
  
}
class Person{
  final String name;
  final int age;

  const Person({
    required this.name,
    required this.age,
  });
}
extension LongDiscription on Person{
  String get description => '$name is $age years old';
} 
extension ShortDiscription on Person{
  String get description => '$name ($age)';
}