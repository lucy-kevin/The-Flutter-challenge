void main(List<String> args){
const me = Person("Julie", 22);
const foo = Person.foo();
const bar = Person.bar(30);
const other = Person.other();




print(foo.age);
print(foo.name);
print("____________________________________");
print(me.name);
print(me.age);
print("____________________________________");
print(bar.age);
print(bar.name);
print("____________________________________");
print(other.name);
print(other.age);
print("____________________________________");

const john = Person.other(name: "John");
print(john.name);
print(john.age);

print("____________________________________");

const jill = Person.other(name: "Jill", age: 56);
print(jill.name);
print(jill.age);

}
class Person{
  final String name;
  final int age;

  const Person(
    
       this.name,
       this.age,
    
  );
  const Person.foo() 
  :name = "Foo",
  age = 20;
  const Person.bar(this.age) :name = "Bar";
  const Person.other({
    String? name,
    int? age,
  }): name =  name?? "Baz",age = age?? 36;
}