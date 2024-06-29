void main(){
  var fruits = ["Apples", "Oranges", "Mangoes","Jackfruit"];

  var fruitsUpperCase = fruits.map((items){
    return items.toUpperCase();

  }).toList();

  for (var items in fruitsUpperCase){
    print("$items ${items.length}");
  } 




}