const json ={
  "name" : "Kevin",
  "age" : 30,
};
void main(List<String> args) {
  final String? name = json.find<String>("name", (String name) => name.toString());
  print(name);
  
  
}
extension Find<K, V, R> on Map<K,V>{
R? find<T>(
  K key,
  R? Function(T value)cast,
){
  final value = this[key];
  if(value != null && value is T){
    return cast(value as T);
  }else{
    return null;
  }
}

}
// extension Finds<K, V, R> on Map<K, V>{
//   R? find<T>(
//     K key,
//     R? Function(T value) cast,
//   ){
//     final value = this[key];
//     if(value != null && value is T){
//         return cast(value as T);
//     }else{
//     return null;
//     }
//   }
// }

extension Finds<K,V,R> on Map<K,V>{
  R? finds<T>(
    K key,
    R? Function(T value) cast,
  ){
    final value = this[key];
    if(value != null && value is T){
      return cast(value as T);
    }else{
      return null;
    }

  }
}