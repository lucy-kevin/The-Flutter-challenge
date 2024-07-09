void main(List<String> args) {
 final sumOfNumbers = [1,2,3,4,5].Sum;
 print(sumOfNumbers);

  
}
extension sumOfIterable<T extends num> on Iterable<T>{
  T get Sum => reduce((a, b) => a + b  as T);
}
