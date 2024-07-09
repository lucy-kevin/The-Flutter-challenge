void main(List<String> args) {
  print(4.toPage(8, included: false));
  
}

extension on int{
  Iterable<String> toPage(int end, {bool included= true}) => end > this?
  [for(var i =this; i<end; i++) "Page $i" ,if(included) "$end"]:
  [for(var i =end; i<this; i++) "Page $i" ,if(included) "$end" ];
}
// extension DateRange on DateTime{
//   List<DateTime>generateDateRange
// }