void main(List<String>args){
  
  const car1 = Car("Disel", "Toyota");
  print(car1);
  print(car1.brand);
  const vehicle = Vehicle(3);
  print(vehicle);
  const car2 = ElectricCar("Tesla");
  print(car2);
  print("");
  

}

class Vehicle{
  final int wheelCount;
  

  const Vehicle(
    this.wheelCount,
   
  );

  @override
  String toString(){
    return ("$runtimeType has $wheelCount wheels");
  }
}
class Car extends Vehicle{
  final String brand;
  final String fuelType;
  const Car(
    this.fuelType,
    this.brand,
  ): super(4);
  @override
  String toString(){
    return ("$brand $runtimeType has $wheelCount whels and uses $fuelType");
  }
}
class Bicycle extends Vehicle{
  const Bicycle(): super(2);
}
class ElectricCar extends Car{
  final String brand;
const ElectricCar( this.brand):super('Electric', brand);
}