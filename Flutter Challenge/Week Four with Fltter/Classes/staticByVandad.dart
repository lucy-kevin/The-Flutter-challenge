void main(List<String> args){
  //changes made replace the previous content

  Person name = Person();
  Person.name = "kEVIN";
  Person.name = "Lucy";
  print(Person.name);
}
class Person{
  static String name = "";
}
