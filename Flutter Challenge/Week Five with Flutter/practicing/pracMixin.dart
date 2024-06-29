void main(List<String> args) {
  Person person1 = Person();
  person1.Jump(speed: 40);
  //print(person1.speed);
  person1.Fly(speed: 504);
  
}
mixin HasSpeed{
  abstract double speed;

}
mixin CanFly on HasSpeed{
  void Fly({
    required double speed,
  }){
    print("$runtimeType is flying at the speed of $speed");
    this.speed = speed;
  }
}
mixin CanJump on HasSpeed{
  void Jump({
    required double speed,
  }){
    print("$runtimeType is walking at the speed of $speed");
    this.speed = speed;
  }
}
class Person with HasSpeed, CanJump, CanFly{
  @override
  double speed;
  Person():speed = 0.0;

}
