import 'dart:convert';
import 'dart:io';

import 'package:dart_app/model/circle.model.dart';
import 'package:dart_app/model/point.model.dart';
import 'package:dart_app/model/rectangle.model.dart';
import 'package:dart_app/model/shape.model.dart';

class GeometricDesign {
  List<Shape> shapes=[];

  Shape add(Shape shape){
    shapes.add(shape);
    return shape;
  }
  void show(){
    for(Shape shape in shapes){
      if(shape is Circle){
        print("************** Circle ****************");
        print("Radius : ${shape.getRadius()}");
      } else if(shape is Rectangle){
        print("************** Rectangle ****************");
        print("Height : ${shape.getHeight()}");
        print("Width : ${shape.getWidth()}");
      }
      print(shape.toJson());
      print("Area : ${shape.getArea()}");
      print("Perimeter : ${shape.getPerimeter()}");
    }
  }
  String toJson(){
    JsonEncoder jsonEncoder=const JsonEncoder.withIndent("  ");
    return jsonEncoder.convert({'shapes':shapes});
  }
  void save(String fileName){
    File file =File(fileName);
    file.writeAsStringSync(toJson());
  }

  GeometricDesign(){}
  GeometricDesign.fromFile(String fileName){
    File file=File(fileName);
    String data=file.readAsStringSync();
    Map<String,dynamic> jsonData=json.decode(data);
    List<Shape> shapesList=(jsonData['shapes'] as List).map((item) {
      if(item['type']=='Circle'){
        double radius=double.parse(item['radius']);
        Point center=Point.fromJson(item['center']);
        return Circle(p1:center , p2: Point(x:center.x+radius, y: center.y));
      } else {
        double W=item['width'];
        double H=item['height'];
        Point p1=Point(x: item['x'], y: item['y']);
        Point p2=Point(x: p1.x+W, y: p1.y+H);
        return Rectangle(p1: p1, p2: p2);
      }
    }).toList();
    shapes=shapesList;
  }

}