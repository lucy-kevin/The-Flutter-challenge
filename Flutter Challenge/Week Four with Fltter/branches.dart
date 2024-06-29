enum Transportation{
  cars,
  motocycles,
  buses,
  trains,
  planes

}
void main(){




 int number = 0;
//if statements
 if(number > 0){
  print("this number is positive");
 }else if(number < 0){
  print("this number is a negative");
 }else{
  print("this is a zero");
 }
 //if case
 var pair = [1,2,3,"Four"];

 if (pair case[int w,int x, int y, String z]){
  print("Match: Points($w, $x, $y, $z)");
 }else{
  print('no match');
 }

 //switch

 var value = 14;
switch(value){
  case >30:
  print(value);
  case >20:
  print(value);
  case >10:
  print(value);
  default:
  print(value);

}




 var shape = ["circle", 7];

 switch(shape){
  case ["circle", int radius]:
    print("the radius is $radius");

  case ["rectangle", int height]:
     print("the height is $height");
   default:
   print("Wrong");
 }
var day = 'Wednesday';

switch (day) {
  case 'Monday':
    print('Start of the week');
    break;
  case 'Tuesday':
    print('Second day of the week');
    break;
  case 'Wednesday':
    print('Midweek');
    continue weekendLabel;
  weekendLabel:
  case 'Saturday':
  case 'Sunday':
    print('Weekend');
    break;
  default:
    print('Weekday');
}

var grade = "B";

switch(grade){
  case "A":
  print("Very Good");
  case "B":
  print("Good");
  continue NewGrade;
  NewGrade:
  case "C":
  case "D":
  print("Do more");
}

 var month = 'February';
  var year = 2024; // Leap year

  var days = switch (month) {
     'January' => 31,
     'February' => (year % 4 == 0 && year % 100 != 0) || year % 400 == 0 ? 29 : 28,
     'March' => 31,
     'April' => 30,
     'May' => 31,
     'June' => 30,
     'July' => 31,
     'August' => 31,
     'September' => 30,
     'October' => 31,
     'November' => 30,
     'December' => 31,
    _ => throw 'Invalid month',
  };
  switch(days){
    case 29:
    print("leap year");
    case 28:
    print("odd year");

  }
  print('The number of days in $month is $days.');
 String membership = "Gold";
 double purchaseAmount = 2000.0;

 var discount = switch(membership){
  "Platinum" => 0.20,
  "Gold" => 0.15,
  "Silver" => 0.10,
  "Bronze" => 0.5,
  _ => 0.0

 };

 print("Cost: $purchaseAmount");
 print("Membership: $membership");
 print("Discount: ${discount*100}%");
 print("Real cost: ${purchaseAmount - (discount * purchaseAmount)}");

//Exhaustiveness Checking

Transportation transport = Transportation.buses;

double fees = switch (transport) {
  Transportation.buses => 45.0,
  Transportation.cars => 60.0,
  Transportation.motocycles => 35.0,
  Transportation.planes => 100.0,
  Transportation.trains => 25.0,
};

print("Your travel will cost $fees");

}