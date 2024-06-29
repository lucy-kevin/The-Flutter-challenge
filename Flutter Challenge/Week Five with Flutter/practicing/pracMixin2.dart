void main(List<String> args) {
  Bird yellow = Bird();
  yellow.Fly();
  
}
class HasWings{
  const HasWings();
}
mixin CanFly on HasWings{
  void Fly(){
    print("$runtimeType can fly");
  }

}
class Bird extends HasWings with CanFly{
  const Bird();
}