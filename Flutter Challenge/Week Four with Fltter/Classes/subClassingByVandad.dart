void main(List<String> args){
  const v = Vehicle(4);
  print(v);
  print(Car());
  print(Bicycle());
}
class Vehicle{
   final int wheelCount;

  const Vehicle(
    this.wheelCount
  );
  @override
  String toString(){
    return "$runtimeType has $wheelCount wheels";
  }
}
class Car extends Vehicle{
  const Car() : super(4);
}
class Bicycle extends Vehicle{
  const Bicycle() : super(2);
}