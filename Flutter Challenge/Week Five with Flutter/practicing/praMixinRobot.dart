import 'pracMixin.dart';

void main(List<String> args) {

  Robot robot1 = Robot();
  robot1.Walk(speed: 30);
  robot1.List(weight: 798);
  
}
mixin HasSpeed{
  abstract double? speed;
  abstract double? weight;
}
mixin CanWalk on HasSpeed{
  void Walk(
    {required double speed}
    ){
      print("$runtimeType is walking at the speed of $speed");
    }

}
mixin CanLift on HasSpeed{
  void List(
    {required double weight}
    ){
      print("$runtimeType is lifting with weight of $weight");
    }

}

class Robot with HasSpeed, CanWalk, CanLift{
  @override
  double? speed;

  @override
  double? weight;
 
  Robot() :speed = 0.0, weight = 0.0;
  


}