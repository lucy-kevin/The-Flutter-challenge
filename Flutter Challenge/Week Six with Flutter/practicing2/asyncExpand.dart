void main(List<String> args) async{
  await for(final words in getWord().asyncExpand((event) => Displayletter(event))){
    print(words);
  }

  
}
Stream<String> Displayletter(String word) async*{
  for(int i = 0; i < word.length; i++){
    await Future.delayed(
      Duration(seconds: 2),
    );
    yield word[i];
  }

}

Stream<String> getWord() async*{
  Future.delayed(
    Duration(seconds: 2),
  );
  yield "Kevin";
  Future.delayed(
    Duration(seconds: 2),
  );
  yield "Aseru";

}