void main(){

  var record = (22, 22,);
  var record1 = ( "Jack", "Jack");


  //This only happens in Named Fields
  ({int a, int b}) recordAB = (a: 1, b: 2);
  ({int x, int y}) recordXY = (x: 3, y: 4);
  //named field = a,b,x,y
  //You can not assign recordAB to recordXY
  //recordXY = recordAB; leads to an error
  // where as in positioned fields this is posible and okay

  (int, int) record3 = (1,2);
  (int, int) record4 = (3,4);
  //assigning is posible here
  print(record4 = record3);

//Accessing record fields
//since records are immutable, fields do not have setters, they only have getters
//Named fields expose getters of the same name
//Positioned fields expose getters of the name $<position>

var record10 = ("Kevin", age: 12, height:5.7,);
print(record10.$1);
print(record10.age);

//Record equality
//two fields are equal if both fields have the same shapes
({int a, int b, int c}) recorded1 = (a:1,b:2,c:3);
({int d, int e, int f}) recorded2 = (d:4,e:5,f:6);
print(recorded2==recorded1);

(int , int, int) recorded3 = (1,2,3);
(int, int, int) recorded4 = (1,2,3);
print(recorded4==recorded3);

}