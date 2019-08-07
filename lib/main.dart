import 'package:flutter/material.dart';
import 'Mapping.dart';
import 'Authentication.dart';
void main(){
runApp(new BlogApp());

}
class BlogApp extends StatelessWidget{
@override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: "Our Blog",
      theme: new ThemeData(
        primarySwatch: Colors.purple,
      ),
      home:MappingPage(auth: Auth(),),
    );
  }

}