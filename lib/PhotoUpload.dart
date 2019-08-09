import 'dart:io';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';


class UploadPhotoPage extends StatefulWidget{
  State<StatefulWidget> createState(){
    return _UploadPhotoPageState();
  }
}

class _UploadPhotoPageState extends State<UploadPhotoPage>{
  File _sampleImage;
  String _myValue;
  final formKey =new GlobalKey<FormState>();



Future getImage() async{
   var tempImage = await ImagePicker.pickImage(source: ImageSource.gallery);
   setState(() {
    _sampleImage=tempImage; 
   });
}
bool validateAndSave(){
  final form=formKey.currentState;
  if(form.validate()){
    form.save();
    return true;
  }else{
    return false;
  }
}




  Widget build(BuildContext context){
      return new Scaffold(
        appBar: new AppBar(
          title: new Text("Upload Image"),
          centerTitle: true,
        ),

        body: new Center(
          child: _sampleImage == null? Text("Select an Image"): enableUpload(),
        ),
        floatingActionButton: new FloatingActionButton(
          
          tooltip: 'Add Image',
          child: new Icon(Icons.add_a_photo),
          onPressed: getImage,
        ),
      );
  }
  Widget enableUpload(){
      return Container(
        child: new  Form(
          key: formKey,
        child: Column(
          children: <Widget>[
            Image.file(_sampleImage, height: 330.0, width: 630.0),
            SizedBox(height: 15.0,),
            TextFormField(
              decoration: new InputDecoration(labelText: 'Description'),
              validator: (value){
                return value.isEmpty ? 'Blog Description is required' : null;
              },
              onSaved: (value){
               return _myValue=value;
              },
            ),
            SizedBox(height: 15.0,),
            RaisedButton(
                elevation: 10.0,
                child: Text("Add a New Post"),
                textColor: Colors.white,
                color: Colors.purple,

                onPressed: validateAndSave,
            )


          ],
        ),
        ),
      );
  }
}