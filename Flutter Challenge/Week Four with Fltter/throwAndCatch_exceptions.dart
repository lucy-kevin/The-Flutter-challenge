

void main(){

  try{
    packMoreCocoa();
  } on OutOfCocoa{
    buyMoreCocoa();

  }
  try{
    priceOfCocoa(-20);
  } catch (e){
    print(e);
  }

  try{
    getAge(-9);
  } catch (e){
    print(e);
  }
}
void packMoreCocoa(){
  throw OutOfCocoa();
}
void buyMoreCocoa(){
  print("Buy more from the farmers");
}
void getAge(int age){
  if (age<0){
    throw ArgumentError("Age can't be a negative $age");
  }else{
    print("$age");
  }
}
void priceOfCocoa(double weight){
  if (weight < 0.0){
    throw "Cocoa weight cant be $weight";
  }else{
    double price = 30000;
    double totalPrice = price * weight;
    print("Total Price UGX $totalPrice");
  }
}


class OutOfCocoa implements Exception{}