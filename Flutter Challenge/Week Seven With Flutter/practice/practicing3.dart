void main(List<String> args) {
 //Something small on conditional expresions
int a = 5;
int b =7;
int max = (a<b)? b:a;
print(max);

String?name;
String defaultName = "Guest";

String displayname = name?? defaultName;//if name id null let this be defaultname
print(displayname);

int? age;
bool adult = (age ?? 0) >= 18 ? true: false;
print(adult);

 List<int> numbers = [1,2,3,4,5,6,7];
 Iterable<int> iterableNumbers = numbers;

//using forEach to print all the ints in the interable
 iterableNumbers.forEach((number) { print(number);});
 iterableNumbers.forEach((element)=> print(element));

//using map() to square all the numbers in an iterable
 Iterable<int> squareNumbers = iterableNumbers.map((number) => number * number);
  print(squareNumbers);

//using where() to filter elements

  Iterable<int> oddNumbers = iterableNumbers.where((number) => (number % 2) == 1);
  print(oddNumbers);
  Iterable<int> oddNumbersAgain = iterableNumbers.where((number) => number.isOdd);
  print(oddNumbersAgain);
}


