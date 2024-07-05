void main(List<String> args) {
  final value = 20;
  final timesFour = value.timesFour;
  print(timesFour); 
  print(40.timesFour);
  
}
extension on int{
  int get timesFour => this * 4;
}