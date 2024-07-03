void main(List<String> args) async{

  final Detail = await fetchUserID().then((value) =>fetchUserDetails(value));
  print(Detail);

  // ignore: unused_local_variable
  await for(final number in getLetters("Welcome")){
  print(number);}
  try{
  await for(final messages in message()){
    print(messages);
  }
  } catch(e){
    print(e);
  }
  
  
}
Future<String> fetchUserID() async => Future.delayed(
  Duration(microseconds: 10),
  ()=>"0213"
);
Future<Map<String, String>> fetchUserDetails(String id) async{
  return {"Id": id,"Name": "Aseru Kevin"};
}
Stream<String> getLetters(String wordCount) async*{
  for (int i = 0; i<wordCount.length; i++ ){
     await Future.delayed(
      Duration(seconds: 1),
      
    );
    yield wordCount[i];
  }
}

Stream<String> message() async*{
  await Future.delayed(Duration(seconds: 3));
  yield "Sentence Him";
  await Future.delayed(Duration(seconds: 3));
  throw "Wrong Message";
}