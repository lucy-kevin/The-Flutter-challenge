void main(List<String> args) {
  final double  doubleValue = eitherIntOrDouble();
  print(doubleValue);
  final int intValue = eitherIntOrDouble();
  print(intValue);

  
}
enum WhatToReturn{int, double}

T eitherIntOrDouble<T extends num> (){
  switch(T){
    case int:
      return 1 as T;
    case double:
     return 1.0 as T;
    default:
      throw Exception("Not Supported");
  }
}
