import 'package:flutter/material.dart';
import 'HomePage.dart';
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
      home:HomePage(),
    );
  }

}