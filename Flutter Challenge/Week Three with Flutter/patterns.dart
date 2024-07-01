void main(){
  //is a way to match and extract values from data structures
  
  
  //Patterns in variables
//Declaration
  var (a,[b, c]) = ('Str', [1,2]);
  print("$a, $b,$c");
//assignment
  var (x, y) = ('Left', 'Right');
  (y, x) = (x,y);
  print("x = $x y = $y");

//
  
const first = 10; // Example value for the start of the range
const last = 70;
print("$first $last");
  // Example value for the end of the range
var obj = (6,7);
switch(obj){
case 1:
  print("one");
  print("in range");
case (var a , var b):
  print("a = $a b = $b");

  


 }
}