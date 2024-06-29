
void main(List<String> args){
//they can create instances of the class and its subclass
  print(Vehicle.car());
  print(Vehicle.truck());
}

class Vehicle{
  const Vehicle();

  factory Vehicle.car() => Car();
  factory Vehicle.truck() => Truck();


  @override
  String toString(){
    return " this is $runtimeType";
  }
}
class Car extends Vehicle{

}
class Truck extends Vehicle{

}
