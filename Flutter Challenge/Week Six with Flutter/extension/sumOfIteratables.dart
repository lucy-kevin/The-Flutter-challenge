void main(List<String> args) {
  [1,2,4].sum;
  final sumOfDoubles =[2.3,4.4].sum;
  final sumOfIntegers =[1,2,4,3].sum;
  print(sumOfIntegers);
  print(sumOfDoubles);
 
}
extension SumOfIterable<T extends num> on Iterable<T>{
  T get sum => reduce((a, b) => a + b as T);
}