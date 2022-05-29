import 'package:dart_app/model/circle.model.dart';
import 'package:dart_app/model/geometric.design.model.dart';
import 'package:dart_app/model/point.model.dart';
import 'package:dart_app/model/rectangle.model.dart';

void main(){
  GeometricDesign geometricDesign=GeometricDesign();
  geometricDesign.add(Circle(p1: const Point(x: 10,y: 10,), p2: const Point(x: 60,y: 60,),));
  geometricDesign.add(Circle(p1: const Point(x: 50,y: 60,), p2: const Point(x: 160,y: 90,),));
  geometricDesign.add(Rectangle(p1: const Point(x: 33,y: 44,), p2: const Point(x: 23,y: 89,),));
  geometricDesign.show();
  print("************************");
  print(geometricDesign.toJson());
  geometricDesign.save("design1.json");
}