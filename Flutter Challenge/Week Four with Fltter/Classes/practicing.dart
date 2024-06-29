class Farmer{
  String name = "";
  String location = "";
  String company = "";

  void message(){
    print("Welcome to $company, Good morning $name from $location");
  }

}


void main(List<String> args){
  Farmer farmer1 = Farmer();
  farmer1.name = "Galiwango";
  farmer1.company = "ESCO";
  farmer1.location = "Kyabiri";

  farmer1.message();
 
}