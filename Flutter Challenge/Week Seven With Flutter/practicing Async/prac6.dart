void main(List<String> args) async {
 final sum = await numbers().reduce(add);
 print(sum);
  
}
int add(int a, int b) => a +b;

Stream<int> numbers() async* {
  yield 10;
  yield 20;
  yield 30;

}