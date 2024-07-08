void main(List<String> args) {
  print(4.times4);
  
}

extension on int{
  int get times4 => this *4;
}