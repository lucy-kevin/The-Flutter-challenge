void main(List<String> args) async {
  String names = await fetchUserId().then((name) => fetchUserDetails(name: "Kevin", location: "Masaka"));
  print( names);

  int length = await fetchUserDetails(name: "Kevin", location: "Masaka").then((value) => getNumbers(value)); 
  print(length);
}
Future<String> fetchUserId() async => Future.delayed(
  Duration(seconds: 2),
  ()=>"U231"
);
Future<String> fetchUserDetails({required String name, required String location}){
  return Future.value("$name $location");
}
Future<int> getNumbers(String names) async =>
  
    Future.delayed(Duration(seconds: 2),
    ()=> names.length
    );
    
  
