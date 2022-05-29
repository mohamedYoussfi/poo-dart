import 'package:dart_app/model/point.model.dart';
import 'package:dart_app/model/shape.model.dart';

class Rectangle extends Shape {
  Rectangle({required Point p1, required Point p2}) : super(p1: p1, p2: p2);

  double getWidth(){
    return (p2.x-p1.x).abs();
  }
  double getHeight(){
    return (p2.y-p1.y).abs();
  }
  @override
  double getArea() {
   return getWidth()*getHeight();
  }

  @override
  double getPerimeter() {
   return 2*(getHeight()+getWidth());
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "type":"Rectangle",
      "x" : p1.x, "y":p1.y, "width":getWidth(), "height":getHeight()
    };
  }

}