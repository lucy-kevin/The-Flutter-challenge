void main(List<String> args) {
 //helps you create similar objects in one structure
  final woof =  Animal(name: "Woof", type: AnimalType.dog);

 
  switch(woof.type){
    
    case AnimalType.rabbit:
     print("Woof is a rabbit");
    case AnimalType.dog:
    print("Woof is a dog");
      
    case AnimalType.cat:
    print("Woof is a cat");
     
    case AnimalType.goat:
      // TODO: Handle this case.
  }
}
enum AnimalType{ rabbit, dog, cat, goat}

class Animal{

  final String name;
  final AnimalType type;

  const Animal({
    required this.name,
    required this.type,
  });
}