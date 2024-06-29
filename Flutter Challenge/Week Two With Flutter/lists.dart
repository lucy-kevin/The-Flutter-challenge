void main(){

  var numbers = [1,2,1,3];
  print(numbers);
  numbers.sort();
  print(numbers);

  var foods = ["matooke","apple","dodo"];
  final names = const["Kevin","Julie"];
  print(names);
  //this brings runtime error: names.add("Suzan");
  
  foods.sort((a, b) => a.compareTo(b));
  print(foods);

  


}