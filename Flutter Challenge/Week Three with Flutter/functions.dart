
  void raiseFlag({bool? black, bool? read}){
    print("$black  $read");
  }
  void details({bool bold = true, bool? name}){
    print("$bold $name");
  }
  void listing({String? food, required int price}){
    print("$food, $price");


  }
  //optional positional parameters


   String say(String from,String msg, [String? device] ){
    var result = "$from said $msg";

    if(device != null){
      result = "$result sent with $device";
    }
      return result;
    
  }
  // to make the optional positional parameters default we use =

  shopping(String shop, int cost, [String? by = "Kevin"] ){
    var sentence = "$by went to $shop and used $cost";
    return sentence;

  } 

void main(){

raiseFlag(black: true);
//we can define default arguments by using = 
details(bold: true, name: true);
//when we want to show that the named parameter is mandatory

listing(price: 400000, food: "Matooke");



//it can also be nullable



print(say("Kevin", "Hello", "pixel"));
print(say("Kevin", "Hello"));
print(shopping("maria shop", 400000));

}