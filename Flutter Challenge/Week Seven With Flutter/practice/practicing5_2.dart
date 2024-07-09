void main(List<String> args) {
  final marks = [1,2,2,23,4,2];
  print(marks.counting(2));
  print(marks.nonDups());
  print(marks.max);
  print(marks.min);
  print(marks.chuck(2));
  
}

extension countWords<T> on List<T>{
  int counting(T element){
    int count = 0;
    for(final elements in this){
      elements == element? count++:0;
    }

    return count;
  }
}

extension removeDups<T> on List<T>{
  List<T> nonDups() {
    return this.toSet().toList();
  } 
}
extension maxOrMin<T extends num> on List<T>{
  T get max => reduce((a, b) => (a <b)?b:a);
  T get min => reduce((a, b) => (a <b)?a:b);
}
extension chucks<T> on List<T>{
  List<List<T>> chuck(int size){
    List<List<T>> chucks =[];

    for(var i = 0; i< this.length; i+=size){
      int end = (i + size < this.length)? i+size: this.length;
      chucks.add(this.sublist(i, end));


      
    }
    return chucks;
  }
}