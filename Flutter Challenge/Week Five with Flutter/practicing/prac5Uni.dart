void main(List<String> args){

  Student student1 = Student("Kevin", 22, "IT");
  Student student2 = Student.international("Ben", 19, "SE", "Congo", "Student");
  student2.printDetails();

  student1.printDetails();

}
class Student{
  final String name;
  final int age;
  final String major;
  final String? country;
  final String? visaStatus;

  const Student(
    this.name,
    this.age,
    this.major,
  ): country = null, visaStatus = null;
  const Student.international(
    this.name,
    this.age,
    this.major,
    this.country,
    this.visaStatus,
  );
  void printDetails(){
    if (country == null && visaStatus == null){
      print("Name: $name");
      print("Age: $age");
      print("Major: $major");
    }else{
      print("Name: $name");
      print("Age: $age");
      print("Major: $major");
      print("Country: $country");
      print("Visa Status: $visaStatus");
    }
     print("___________________________");
  }
  

}