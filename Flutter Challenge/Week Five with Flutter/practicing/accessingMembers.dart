import 'dart:math';

void main(List<String> args){

  Point point1 = Point(0, 0);
  Point point2 = Point(10, 10);
  
  print("Distance: ${point1.distanceTo(point2)}");
  print("Mid-Point: ${point1.midPoint(point2)}");
}

class Point{
  double x, y;

  Point(
    this.x,
    this.y,
  );
  double distanceTo(Point other){
    var dx = x - other.x;
    var dy = y - other.y;
    return sqrt(dx * dx + dy * dy);
  }
  (double, double) midPoint(Point other){
    var ax =x + other.x;
    var ay = y + other.y;
    return (ax/2, ay/2);
  }
}
