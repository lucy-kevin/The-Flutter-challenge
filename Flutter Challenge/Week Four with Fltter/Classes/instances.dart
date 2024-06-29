double height = 5.7;
class Point{

  double? x = height;
 // double? y = this.x; this brings an error
  late double? y = this.x;
  double z= 0; 

  Point(this.x, this.y);
}
void main(){
  Point point = new Point(6,5);
  point.x;

  print(point.x);
  print(point.y );
}