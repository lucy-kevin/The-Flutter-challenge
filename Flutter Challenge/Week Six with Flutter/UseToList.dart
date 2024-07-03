void main(List<String> args) async{
  final allNames = await names().toList();
   for(final name in allNames){
    print(name);

  }
  
  
}
Stream<String> names() async*{
  yield "Kevin";
  yield "Julie";
  yield "Suzan";
}