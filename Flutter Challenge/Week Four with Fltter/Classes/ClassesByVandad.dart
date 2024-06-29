void main(List<String> arg){
  const person1 = Person(name: "Kevin", age: 22);
  print(person1.name);
   print(person1.age);
}
class Person{
  final String name;
  final int age;
  const Person({
     required this.name,
     required this.age,
});
    }