//you can access the members of a class using a dot

class Point{
  double x, y;

  Point(this.x, this.y);
  double distanceTo(Point other){
    var dx = x-other.x;
    var dy = y- other.y;
    return (dx * dx + dy * dy);
  }
}
void main() {
  var p1 = Point(2, 2);
  var p2 = Point(4, 4);

  // Invoke distanceTo() on p1.
  double distance = p1.distanceTo(p2);
  print(distance); // Output: 2.8284271247461903
}





