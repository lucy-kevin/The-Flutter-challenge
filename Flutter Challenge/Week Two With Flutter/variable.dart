//var
late String description;
const int marks = 90;
final int mark = 98;
void main(){
var name = "Kevin";
print(name);

dynamic something = 14;
print(something);
something = "Lucy";
print(something);


// Null Safety: this feature is designed to make sure that non-nullable types can not be null and nullable types can be null
// a non nullable dereference error occurs when you try to access a nullable property or method on a nullable object

// int? age;
// print(age.length);

int age = 40;//variables must be assigned before use
print(age);


// Null Supporting Methods
// there only two exceptions for the variables and methods on null objects which are toString() and hashcode
String? food;
print(food.hashCode);
print(food.toString());

int height = 11;
//height = null; this would bring up an error


//Late Variables
// the late modifier has two use cases
//1. Non nullable variables must be declared and initialised later in the code.
// i have declared it up out of this function

description = "This is fun";
print(description);

//2. Lazy Initialization
//This means thats the initialization of a variable is postponed until the first time it is accessed
// 

//when using final and const there is no actually need for datatypes

//Final- this variables can not be modified once initialized, and the can only be initialized inline or within a constructor
//such code would cause an error
final String name1;
name1 = "Kevin";
final name2 = "Kevin";
print(mark);
print(name1);

//Const - is a compile time constant. Its Value must be known at compile-time, it can not be reassigned after initialization.
print(marks);
const double PI = 3.14;
const bar = 100000;
print(bar);
print(PI);
}