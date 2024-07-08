void main(List<String> args){
  print(1.toNumber(10));
  print(1.toNumber(20, inclusive: true));
  print(1.toNumber(6, inclusive: false));
    
}
extension on int{
  Iterable<int> toNumber (int end, {bool inclusive = true})=> end > this
  ? [for (var i = this; i< end; i++) i, if(inclusive) end]
  : [for (var i = this; i< end; i++) i, if(inclusive) end];
}
