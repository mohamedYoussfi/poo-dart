import 'dart:math';

import 'package:dart_app/model/point.model.dart';
import 'package:dart_app/model/shape.model.dart';

class Circle extends Shape {

  Circle({required Point p1, required Point p2}) : super(p1: p1, p2: p2);

  double getRadius(){
    double radius=p1.distanceTo(p2);
    return radius;
  }

  @override
  double getArea() {
    double r=getRadius();
    return pi*r*r;
  }


  @override
  double getPerimeter() {
    return 2*pi*getRadius();
  }

  @override
  Map<String, dynamic> toJson() {
   return {
     'type' : 'Circle',
     'center':p1.toJson(),
     'radius':getRadius().toStringAsFixed(2)
   };
  }

}