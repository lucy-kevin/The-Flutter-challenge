
//abstract class
abstract class Person{//class
  late String name;//properties
  late int age;

  void sayHello(){//methods
    print("Hello my name is $name and I am $age years old");
  }
  void debating();
  void coding();
}
class Student extends Person{
  late String school;

  void Study(){
    print("I study from $school");
  }
  @override
  void debating(){
    print("Yes");
  }
  @override
  void coding(){
    print("no");
  }
}
//interface in flutter
abstract class Calculator{
  int add(int a, int b);
  int subtract(int a, int b);
}

class BasicCalculator implements Calculator{
  int add(int a, int b){
    return a+b;
  }
  int subtract(int a, int b){
    return a - b;
  }
} 
void main(){

  BasicCalculator add = new BasicCalculator();
  add.add(45, 89);
  Student kevin = new Student();
  Student julie = new Student();
  kevin.name = "Kevin";
  kevin.school = "Ndejje";
  //accessing the properties
  kevin.age = 22;
  julie.name = "Julie";
  julie.school = "Ndejje";
  julie.age = 22;
  
  kevin.sayHello();//calling the method
  kevin.Study();
  julie.sayHello();
  julie.Study();
  julie.coding();

}

