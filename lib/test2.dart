import 'package:dart_app/model/point.model.dart';

void main(){
  Point p1=const Point(x: 10, y: 20);
  Point p2=const Point(x: 14, y: 20);

  print(p1.toString());
  print(p2.toString());

  print(identical(p1, p2));
}