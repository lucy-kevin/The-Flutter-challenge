
void main(List<String> args) async {
  // final length = await calculateLength(await getfullLength());
  // print(length);
 final length =await getfullLength().then(
    (value) => calculateLength(value,)
  );
  print(length);
  
}
Future<String> getfullLength() =>Future.delayed(
  const Duration(seconds: 1),
  ()=>"John Doe");
Future<int> calculateLength(String value)=> Future.delayed(
  const Duration(seconds: 1),
  ()=>value.length,
  );
