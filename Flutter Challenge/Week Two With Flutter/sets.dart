void main(){

var firstSet = {
  "name",
  1,
  "age",
};

var numbers = {1,4,2,3};
// they are unordered so they can not be retrieved by index 
// they have unique items
var numbers1 = {1,9,6,5, ...numbers};
var numbers2 = {30,20,10};
numbers1.add(10);


print(numbers);
print(numbers1);
print(firstSet);
print(firstSet.runtimeType);

//making a set const

final constSet = const{
  "house",
  "name",
  "set",
  "work",

};
print(constSet);


var tools = <String>{};
tools.addAll(["fork","spoon","Plate"]);
print(tools);
tools.remove("fork");

print(tools);
print(tools.contains("spoon"));


var marks = Set.from([12,23,32]);
print(marks);



final transport = const<String>{"cars", "bicycle", "bus"};


//transport.add("Kevin");
print(transport);


var num = Set<int>();
num.addAll([1,2,3,4,5,6]);

num.add(1);
print(num);



}