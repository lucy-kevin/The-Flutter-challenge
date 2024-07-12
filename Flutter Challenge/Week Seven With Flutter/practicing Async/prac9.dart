void main(List<String> args) async{
  await for( final letters in names().asyncExpand((event) => getChar(event))){
    print(letters);
  }
  
}
Stream<String> getChar(String fromNames) async*{

  for(var i = 0; i< fromNames.length; i++ ){
    await Future.delayed(
      Duration(seconds: 2)
    );
    yield fromNames[i];
  }
}

Stream<String> names() async*{
  await Future.delayed(
    Duration(seconds: 2)
  );
  yield " Kevin";
  await Future.delayed(
    Duration(seconds: 2)
  );
  yield " Ziyada";


}