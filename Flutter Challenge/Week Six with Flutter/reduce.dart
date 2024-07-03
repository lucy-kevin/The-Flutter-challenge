void main(List<String> args) async {
  // int num = 0;
  // await for(final numbers in getSum()){
  //    num += numbers; 
       
  // };
  //  print(num); 

  final sum =await getSum().reduce(add);
  print("The sum is: $sum");
 
  
}
int add(int a, int b) => a+b;
Stream<int> getSum() async*{
  yield 10;
  yield 20;
  yield 30;
  yield 40;
  yield 50;
}