import '../Week Five with Flutter/classes/mixin/mixin2.dart';

void main(List<String> args) async {
  final length = await calculateLength(await getfullLength());
  print(length);
  
}
Future<String> getfullLength() =>Future.delayed(
  const Duration(seconds: 1),
  ()=>"John Doe");
Future<int> calculateLength(String value)=> Future.delayed(
  const Duration(seconds: 1),
  ()=>value.length,
  );
