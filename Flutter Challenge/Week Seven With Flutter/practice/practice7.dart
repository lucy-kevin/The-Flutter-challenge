void main(List<String> args) {
  print(AnimalType.goldFish.nameContainUpperCase);
  
}
enum AnimalType{
  cat,
  dog,
  goldFish,
}
extension on Enum{
  bool get nameContainUpperCase => name.contains(
    RegExp(r'[a-z]')
  );
}