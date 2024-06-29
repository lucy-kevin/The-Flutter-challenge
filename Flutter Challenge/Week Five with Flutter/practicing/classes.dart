
class Farmer{
    String name ="";
    String location = "";
    int amount;
    
    Farmer(
      {
      required this.name,
      required this.location,
      required this.amount,
      }
    );

    void payment(){
      int perKg = 12000;
      
      if (amount< 0){
        throw 'You made a mistake that cant be right';
      }else{
        int totalPay = amount * perKg;
      
      print("Name: $name");
      print("Location: $location");
      print("Amount of Vanilla: $amount KG");
      print("Total Pay: $totalPay"); 
    }
    }

}

void main(List <String> args){
  Farmer farmer1 = Farmer(name: "Galiwango", location: "Kyabiri", amount: -40);

  
  try {
    farmer1.payment();
  } catch (e) {
    print(e);
  }
}
