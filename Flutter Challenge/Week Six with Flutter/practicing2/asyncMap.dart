import 'dart:async';

Future<String> fetchData(String input) async {
  // Simulate a network request or some asynchronous operation
  await Future.delayed(Duration(milliseconds: 2));
  return 'Data for $input';
}

Stream<String> getDataStream() async* {
  yield 'Request 1';
  yield 'Request 2';
  yield 'Request 3';
}

void main() async {
  // Create a stream and transform it using asyncMap()
  final resultStream = getDataStream().asyncMap(//asyncMap is a method that transforms each element of the stream asynchronously.
    (value) => fetchData(value));
  
  // Listen to the transformed stream and print the results
  await for (var data in resultStream) {
    print(data);
  }





  final results = await getDataStream().asyncMap(//asyncMap is a method that transforms each element of the stream asynchronously.
    (event) => extractChar(event),
  ).fold("",  (previous, element){//The fold method takes the initial value and combines it with each transformed element.
    final elements = element.join(' ');//combines all the elements separeted by a space 
    return "$previous $elements ";
  });
  print(results);
}











Future<List<String>> extractChar(String from) async{
  final chars = <String>[];
  for(final char in from.split('')){
    await Future.delayed(
      Duration(seconds: 2),
    );
    chars.add(char);
  }
  return chars;
}
