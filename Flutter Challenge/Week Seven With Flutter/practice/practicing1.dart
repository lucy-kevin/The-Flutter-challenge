void main(List<String> args) {
  final value = 20;
  final times4 = value.times4;
  print(times4);
  print(30.times4);
  
}
extension on int{
  int get times4 => this * 4;
}