void main(List<String> args) {
  print("Hello".reversed);
  
}
extension on String{
  String get reversed =>split('').reversed.join();
}