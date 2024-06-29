void main(List<String>args){
  final person = Person();
  person.Walk(speed: 7.9);
  person.jump(speed: 2);
}
mixin HasSpped{
  abstract double speed;
}
mixin CanJump on HasSpped{
  void jump(
    {required double speed}
    ){
      print("$runtimeType is jumping at the speed of $speed");
      this.speed = speed;
    }
}
mixin CanWalk on HasSpped{
  void Walk(
    {required double speed}
    ){
      print("$runtimeType is walking at the speed of $speed");
      this.speed = speed;
    }
}
class Person with HasSpped, CanJump, CanWalk{// you can choose to use some of the functions
  @override
  double speed;
  Person(): speed = 0.0;
  
}