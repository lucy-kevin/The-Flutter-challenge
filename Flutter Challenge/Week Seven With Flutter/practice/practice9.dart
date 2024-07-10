import 'dart:math';

void main(List<String> args) {
  print(sumOf.callWithRanValues());
  print(subtract.callWithRanValues());
  
}
int sumOf(int a, int b) => a +b;
int subtract(int a, int b) => a - b;

typedef IntFunction = int Function(int, int);
extension on IntFunction{
  int callWithRanValues(){
    final rnd1 = Random().nextInt(100);
    final rnd2 = Random().nextInt(100);
    print("$rnd1, $rnd2");
    return call(rnd1, rnd2);
  }
}