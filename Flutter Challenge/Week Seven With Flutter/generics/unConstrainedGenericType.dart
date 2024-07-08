void main(List<String> args) {
  const one = KeyValue(1,2);
  print(one);
  print(one.key);
  const two = KeyValue("height",23.3);
  print(two);
  print(two.key);
}
typedef KeyValue<K, V> = MapEntry<K,V>;
