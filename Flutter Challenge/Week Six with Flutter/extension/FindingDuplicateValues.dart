void main(List<String> args) {
  print([1,2,3,4,5,4].containDuplicated);
  print([1,2,3,4,5].containDuplicated);
  print(["Kevin", "Julie", "Kevin"].containDuplicated);
  
}
extension on Iterable{
  bool get containDuplicated => toSet().length != length;
}