void main(List<String> args){
  Circle circle1 = Circle(7.9);
  print("Area: ${circle1.calcArea()}");
  print("Circumference: ${circle1.calcCircumference()}");

}

class Circle{
  final double radius;
  final double pi; 

  const Circle(this.radius): pi = 3.14;

  double calcArea(){
    double area = pi * (radius * radius);
    return area;
  }
  double calcCircumference(){
    double circumference = 2 *pi *radius;
    return circumference;
  }
}