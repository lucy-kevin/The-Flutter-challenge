void main(List<String> args) {
  print(1.toPage(20));
  print(9.toPage(2, included: false));
  
}

extension on int{
  Iterable<String> toPage(int end, {bool included = true}) =>(
    end > this?[for( var i = this; i<end; i++) "Page: $i", if(included ) "$end"]:
    [for( var i = end; i<this; i++) "Page :$i", if(included ) "$end"]
  );

}
// extension DateRange on DateTime{
//   List<DateTime>generateDateRange
// }