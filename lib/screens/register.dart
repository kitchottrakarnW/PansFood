import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'dart:convert';


class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final formkey = GlobalKey<FormState>();

  String name, user, password;

  Widget registerButton() {
    return IconButton(
      icon: Icon(Icons.cloud_upload),
      onPressed: () {
        print('You Click Register');
        if (formkey.currentState.validate()) {
          formkey.currentState.save();
          print('name = $name, user = $user, password = $password');
uploadValueToServer(context);
        }
      },
    );
  }


  void uploadValueToServer(BuildContext context) async{
    String urlPHP = 'https://www.androidthai.in.th/tid/addUserUng.php?isAdd=true&Name=$name&User=$user&Password=$password';

    var response = await get(urlPHP);
    var resultString = json.decode(response.body);
    print('resultString ==> $resultString');

    if (resultString.toString() == 'true') {
      // Create pop
      Navigator.of(context).pop();
    }
  }

  Widget nameTextFromField() {
    return TextFormField(
      decoration:
          InputDecoration(labelText: 'Name :', hintText: 'Type your name'),
      validator: (String value) {
        if (value.length == 0) {
          return 'Please Fill Name in Blank';
        }
      },
      onSaved: (String value) {
        name = value;
      },
    );
  }

  Widget userTextFromField() {
    return TextFormField(
      decoration:
          InputDecoration(labelText: 'User :', hintText: 'Type ypur user'),
      validator: (String value) {
        if (value.length == 0) {
          return 'กรุณากรอก user';
        }
      },
      onSaved: (String value) {
        user = value;
      },
    );
  }

  Widget passwordTextFromField() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: 'Password :', helperText: 'More than 6 charactors'),
      validator: (String value) {
        if (value.length <= 5) {
          return 'กรุณากรอก password มากกว่า 6 ตัวอักษร';
        }
      },
      onSaved: (String value) {
        password = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
        actions: <Widget>[registerButton()],
      ),
      body: Form(
        key: formkey,
        child: Container(
          padding: EdgeInsets.all(50.0),
          child: Column(
            children: <Widget>[
              nameTextFromField(),
              userTextFromField(),
              passwordTextFromField()
            ],
          ),
        ),
      ),
    );
  }
}
