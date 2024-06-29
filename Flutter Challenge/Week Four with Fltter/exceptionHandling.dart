void main(){
  //Throwing exception
 try {
  checkAge(-7);
 
 } catch (e) {
  print("Catch an exception: $e");
   
 }  

 //Catching Exception
  
}
void checkAge(int age){
  if (age <0){
    throw ArgumentError("Age cannot be negative: $age");
  }else{
    print("$age");
  }
}