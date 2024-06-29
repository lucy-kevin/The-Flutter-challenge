void main(List<String> args) {
  Man bla = Man();
  bla.run();
  
}
class Has2Feet{
  const Has2Feet();
}
class Man extends Has2Feet with CanRun{
  const Man();
 
}
mixin CanRun on Has2Feet{
  void run(){
    print("$runtimeType is running");
  }
}
class HasNoFeet{
  const HasNoFeet();
}
class Fish{
  const Fish();
}


