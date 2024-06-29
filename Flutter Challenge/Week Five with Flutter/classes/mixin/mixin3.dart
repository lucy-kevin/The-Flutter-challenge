void main(List<String> args) {
  final whiskers = Cat(age: 4);
  whiskers.incrementAge();
  print(whiskers.age); 
}
mixin hasAge{
  abstract int age;
  void incrementAge() => age++;
}
class Cat with hasAge{
  @override
  int age = 0;
  Cat({required this.age});
  
}