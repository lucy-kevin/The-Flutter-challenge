class Point {
  double x, y;

  // Unnamed constructor
  Point(this.x, this.y);

  // Named constructor
  Point.fromJson(Map<String, double> json)
      : x = json['x']!,
        y = json['y']!;
}
void main(){
  //constructor names can either be ClassName or ClassName.identifier
 var p1 = Point(2, 3);
  print('Point p1: (${p1.x}, ${p1.y})'); // Output: Point p1: (2.0, 3.0)

  // Creating an object using the named constructor
  var json = {'x': 5.0, 'y': 7.0};
  var p2 = Point.fromJson(json);
  print('Point p2: (${p2.x}, ${p2.y})'); // Output: Point p2: (5.0, 7.0)

}