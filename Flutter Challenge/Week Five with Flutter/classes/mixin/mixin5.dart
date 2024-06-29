void main(List<String> args) {
const cat1 = Cat(12, "KJI" );
print(cat1);

  
}
enum PetType { cat, dog}

mixin Pet{
  String get name;
  int get age;
  PetType get type;

  @override
  String toString() =>"Pet ($type), name = $name, age = $age";
@override
// TODO: implement hashCode
  int get hashCode => Object.hash(
    name,
    age,
    type,
    );

  @override
  bool operator == (Object other) => other.hashCode == hashCode;
  
}
class Cat with Pet{
  @override
  // TODO: implement age
  final int age;

  @override
  // TODO: implement name
  final String name;

  @override
  // TODO: implement type
  final PetType type;
  const Cat(
    this.age,
    this.name,
    
  ): type = PetType.cat;
  
}