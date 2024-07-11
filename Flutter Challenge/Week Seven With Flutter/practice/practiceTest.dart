
import 'dart:math';

const json = {
  "name": "Kevin",
  "age": 22,
};
void main(List<String> args) {
  final name = json.find<String>("name", (String name) => name.toString());
  print(name);
  print([12,34,2,3,4].max());
  print([12,34,2,3,4].min());
  print([12,34,2,2,3,4].counting(2));
  print([12,34,2,2,3,4].checking(256));

  print(add.callRandomVal.call());
  
}
extension Find<K, V, R> on Map<K, V>{
  R? find<T>(
    K key,
    R? Function(T value) cast
  ){
    final value = this[key];
    if(
      value != null && value is T
    ){
      return cast(value as T);
    }else{
      return null;
    }
  }
}

extension maxAndMin<T extends num> on Iterable<T>{
  num max() => reduce((a, b) => a>b?a:b);
  num min() => reduce((a, b) => a>b?b:a);
}
extension count<T> on List<T>{
  

  int counting(T number){
    int count = 0;
    for(var i = 0; i < this.length; i++){
      if(number == this[i]){
        count++;
      }
    }
    return count;
  }


}
extension exist<T> on List<T>{
  
  String checking(T number1){
    
    for(var i = 0; i<this.length; i++){
      if(this[i] == number1){
       return "It exists";
      }
      
      

    }
    
    return "not there ";

  }
}

int add(int a, int b) => a+b;
int subtract(int a, int b ) => a- b;

typedef IntFunction = Function(int, int);

extension on IntFunction{
  int callRandomVal() {
    int rnd1 = Random().nextInt(100);
    int rnd2 = Random().nextInt(100);
    print("$rnd1 $rnd2");
    return call(rnd2, rnd1);

  }

}