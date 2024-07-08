
void main(List<String> args) {
  const momAnddad = {
    "mom" : Person(),
    "dad" : Person(),

  };
   const broAndsisAndFish = {
    "bro" : Person(),
    "sis" : Person(),
    'fishy': Fish(),

  };
  final allValues = [
    momAnddad,
    broAndsisAndFish,
  ];
  describe(allValues);
  
}
typedef BreathingThings<T extends CanBreathe> = Map<String, T>;
void describe(Iterable<BreathingThings> value){
  for( final map in value){
    for (final keyAndValue in map.entries){
      print('Will call breathe() on  ${keyAndValue.key}');
      keyAndValue.value.breathe();
    }
  }
}
mixin CanBreathe {
  void breathe();
}
class Person with CanBreathe{
  const Person();
  
  @override
  void breathe() {
    print("Person Can Breathe");
  }
}
class Fish with CanBreathe{
  const Fish();
  @override
  void breathe() {
   print("Fish can Breathe");
  }

}