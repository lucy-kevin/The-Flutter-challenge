void main(List<String> args) {
  final numIteratable = [1,2,3,4,5,6];
  print(numIteratable.sum);
  final sumofDouble = [1.4,2.5,2].sum;
  print(sumofDouble);
  
}
extension SumOfIteratable<T extends num> on Iterable<T>{
  T get sum => reduce((a, b) => a + b as T);
}
