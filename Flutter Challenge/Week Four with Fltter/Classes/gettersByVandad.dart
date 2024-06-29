void main(List<String> args){

  const kevin = Person(firstName: "kevin", secondName: "Lucy",);

  print(kevin.fullName);
}
class Person{
  final String firstName;
  final String secondName;
  //final String fullName;
  String get fullName => '$firstName $secondName';
  const Person(
    {
      required this.firstName,
      required this.secondName,
    }
  );

}
// class Person{
//   final String firstName;
//   final String secondName;

//   final String fullName;
//   const Person(
//     {
//       required this.firstName,
//       required this.secondName,
//     }
//   ): fullName = '$firstName $secondName';

// }