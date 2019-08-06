import 'package:flutter/material.dart';
class LoginRegisterPage extends StatefulWidget{
  State<StatefulWidget> createState(){
    return _LoginRegisterState();
  }
}

enum FormType{
  login,
  register
}

class _LoginRegisterState extends  State<LoginRegisterPage>{
final formKey = new GlobalKey<FormState>();
FormType _formType=FormType.login;
String _email="";
String _password="";

bool validateAndSave(){
  final form = formKey.currentState;
  if(form.validate()){
    form.save();
    return true;
  }else{
    return false;
  }
}

void moveToRegister(){
  formKey.currentState.reset();
  setState(() {
   _formType=FormType.register; 
  });
}
void moveToLogin(){
  formKey.currentState.reset();
  setState(() {
   _formType=FormType.login; 
  });
}

Widget build(BuildContext context){
  return new Scaffold(
    appBar: new AppBar(
    title: new Text("Blog App"),
    ),
    body: new Container(
      margin: EdgeInsets.all(15.0),
      child: new Form(
        key: formKey,

        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
      children: createInputs() + createButtons() ,

        ),
      ),
    ),
  );
}


List<Widget> createInputs(){
  return[
    SizedBox(height: 10.0,),
    logo(),
    SizedBox(height: 20.0,),

    new TextFormField(
      decoration: new InputDecoration(labelText: 'Email'),
      validator: (vale){
        return vale.isEmpty ? 'Email is required.' : null;
      },
      onSaved: (value){
        return _email=value;
      },
    ),
    SizedBox(height: 10.0,),
    new TextFormField(
      decoration: new InputDecoration(labelText: 'Password'),
      obscureText: true,
      validator: (vale){
        return vale.isEmpty ? 'Password is required.' : null;
      },
      onSaved: (value){
        return _password=value;
      },
    ),
SizedBox(height: 20.0,)
  ];

}
Widget logo(){
  return new Hero(
    tag: 'hero',
    child: new CircleAvatar(
      backgroundColor: Colors.transparent,
      radius: 110.0,
      child:Image.asset('images/heart.png'),
    ),
    );
}

List<Widget> createButtons(){
 if(FormType == FormType.register){
    return[
    new RaisedButton(
child: new Text("Login", style: new TextStyle(fontSize: 20.0)),
color: Colors.purple,
textColor: Colors.white,

onPressed: validateAndSave,
    ),
     new FlatButton(
child: new Text("Not have an Account? Create Account?", style: new TextStyle(fontSize: 20.0)),

textColor: Colors.red,
onPressed: moveToRegister,
    ),
  ];
 }
else{
   return[
    new RaisedButton(
child: new Text("Create Account", style: new TextStyle(fontSize: 20.0)),
color: Colors.purple,
textColor: Colors.white,

onPressed: validateAndSave,
    ),
     new FlatButton(
child: new Text("Already have an Account? Login", style: new TextStyle(fontSize: 20.0)),

textColor: Colors.red,
onPressed: moveToLogin,
    ),
  ];
}
}
}