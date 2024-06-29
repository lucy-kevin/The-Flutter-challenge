//Genetics benefits
//You can use generics to reduce code duplication
//Improve code maintainability and readability
//type safety
//With generics you are able to write a general piece of code and then reuse it with different types without rewriting the code

//You can go a Step further and add constraints 




class Container<T>{
 List<T> items = [];

 void adding(T item){
  items.add(item);
 }


}


class Box<T>{
  T x;
  T y;
  Box(this.x, this.y);

}
class Tripple<T>{
  T a;
  T b;
  T c;
  Tripple(this.a, this.b, this.c);

  T first(){
    return a;
  }
  T second(){
    return b;
  }
  T third(){
    return c;
  }

}
T findMax<T extends Comparable<T>>(T a, T b){
  
  return a.compareTo(b) > 0 ? a : b;


}



void main(){

  var printItem = Box("Kevin", "Julie");
  print(printItem.x); 

  print(Tripple(2, 4, 5).first());

   var printNum = Box(100, 300);
 print(printNum.x + printNum.y);
}