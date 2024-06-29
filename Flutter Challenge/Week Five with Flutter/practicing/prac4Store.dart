void main(List <String>args){
  const mango =Product("Mangos", 20000, 2);
  const eggs = Product("Eggs", 10000, 10);
  const vanilla = Product.fixDiscount("Vanila", 12000);
  mango.calc();
  print("____________________________");
  eggs.calc();
  print("_____________________________");
  vanilla.calc();
  print("____________________________");

}

class Product{
  final String name;
  final int price;
  final int discount;

  const Product(
   
    this.name,
    this.price,
    this.discount,
  );

  const Product.fixDiscount(
    
      this.name,
      this.price,
      
    
  ):discount = 20;

  void calc(){
    double finalPrice = (price * (100 - discount)/100) ;
  print("Product Name: $name");
  print("Product Price: $price");
  print("Product Discount: $discount");
  print("Total Price: $finalPrice");
  }

} 