import 'dart:ffi';
import 'dart:math';

class Point {
  final double x;
  final double y;

  const Point({required this.x,required this.y});

  Point.fromArray(List<double> data) :
      x=data[0], y=data[1];

  Point.fromJson(Map<String, dynamic> data) :
      x=(data['x'] as num).toDouble() , y=(data['y'] as num).toDouble();

  double distanceTo(Point p){
    double W=x-p.x;
    double H=y-p.y;
    return sqrt(W*W+H*H);
  }

  Map<String, dynamic> toJson(){
    return {'x':x,'y':y};
  }


  @override
  String toString() {
    return 'Point{x: $x, y: $y}';
  }

}