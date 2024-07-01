void main(){
//  there many types of operators starting with
// Arithmetic Operators

// thse include +,-,/,%,* ~/, - expre

assert(1+2 == 3);
assert(5-1== 4);
assert(6/2 == 3);
assert(5~/2 == 2);//Returns an integer
assert(-2 == -2);//Unary minus(negative)
assert(5%2 == 1);


// under these oparators we have the prefix and postfix increments and decrements


int i = 6;
//prefix
print("answer: ${++i}");// with prefix a value is incremented/decremented first then printed
i = 6;
print("answer: ${--i}");

//postfix
i = 6;
print("answer: ${i++}");// with postfix a value is printed first and the it is incremented or decremented
print("answer: ${i--}");


//Relational Operators
// there include ==, !=, >, <, >=,<=;
int age = 20;
 if(age != 18 || age >= 20){
  print("Welcome");

 }else{
  print("OOOH boy");
 }

//Type test Operators 
// thse include "is", "is!","as"

//is operator is used to check the object if it is of a certain type
String name =  "Kevin";
if(name is String){
  print("It is a String $name");
}else{
  print("Not a  String");
}

// as operator is used for type casting, 
var food = "Matooke";

String stringFood = food as String;
print(stringFood);

//is! operator is a negator of is operator

double height = 6.1;
if(height is! int){
  print("Height is not an Int");

}else{
  print("Ooooh its an int hmm");
}


}