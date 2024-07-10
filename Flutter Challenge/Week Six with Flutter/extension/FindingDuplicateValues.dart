void main(List<String> args) {
  print([1,2,3,4,5,4].containDuplicated);
  print([1,2,3,4,5].containDuplicated);
  print(["Kevin", "Julie", "Kevin"].containDuplicated);
  print([1,1,2,3,2,3].converting());
}
extension on Iterable{
  bool get containDuplicated => toSet().length != length;
}
extension duplicate<T> on Iterable<T>{
  Iterable<T> converting(){
    return this.toSet();
  }
  
}