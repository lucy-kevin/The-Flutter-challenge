void main(List<String> args){
  const car1 = Car();
  car1.accelerate();
}
abstract class VehiCle{
  const VehiCle(); 
  void accelerate();
}
class Car extends VehiCle{
  const Car();
  @override
  void accelerate() {
   print("$runtimeType is accelerating"); // TODO: implement accelerate
  }

} 
enum VehicleKind{
  car,
  truck,
  motorcycle,
  bicycle,
}