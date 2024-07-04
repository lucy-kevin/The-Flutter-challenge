//this is like chaining Streams
void main(List<String> args) async {
await for(final words in getWord().asyncExpand((event) => displayword(event))){
print(words);
} 
}
Stream<String> displayword(String wordDisplay) async*{
  for (int i =0; i < wordDisplay.length; i++){
    await Future.delayed(
    Duration(seconds: 2),
    );
  yield wordDisplay[i];
  }
  
}

Stream<String> getWord() async*{
   await Future.delayed(
    Duration(seconds: 2),
  );
  yield "Kevin";
  Future.delayed(
    Duration(seconds: 2),
  );
  yield "Aseru";
}