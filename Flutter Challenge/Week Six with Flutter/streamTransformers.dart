import 'dart:async';

void main(List<String> args) async{
  //Takes one stream and changes it to another stream.
 await for(final capitalizedName in names.capitalized){
  print(capitalizedName);
 }
 print("____________________");
 await for(final capitalizedName in names.capitalizedUsingMao){
  print(capitalizedName);
 }
  
}
 Stream<String> names =Stream.fromIterable(
  [
    "Seth",
    "Kathy",
    "Lars",
  ]
 );
  extension on Stream<String>{
    Stream<String> get capitalized => transform(ToUpperCase());
    Stream<String> get capitalizedUsingMao => map((name) => name.toUpperCase(),);

  }

 class ToUpperCase extends StreamTransformerBase<String, String>{
  @override
  Stream<String> bind(Stream<String> stream){
    return stream.map((name) =>name.toUpperCase() ,
    );
  }
 }