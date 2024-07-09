

void main(List<String> args) {
 final marksMax = [34,67,76,34].max;
 final marksMin = [34,67,76,67,34].elements(67);
 final marksCount = [34,67,76,67,34].counting(67);
 print("Number COunt: $marksCount");
 print(marksMax);
 print(marksMin);
 String name = "Kevin".reverse();
 print(name);
}

extension maxNum<T extends num> on Iterable<T>{
  T get max =>reduce((a, b) => a<b?b:a);
  T get min =>reduce((a, b) => a<b?a:b);
}

extension elementThere<T> on List<T>{
  String elements( T number) {
    for(int i = 0; i<this.length;i++){
      if (this[i] == number){
      return "There";
      }
}
return "Not there";
}
}
extension on String{
  String reverse() => this.split('').reversed.join("");
}
extension count<T> on List<T>{
  int counting(T element){
    int count = 0;
    for(var i = 0; i<this.length; i ++){
    if(this[i] == element ){
      count++;
      
    }
    
  }
  return count;
  }
  
}