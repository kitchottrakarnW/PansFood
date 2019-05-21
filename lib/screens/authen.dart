import 'package:flutter/material.dart';

class Authen extends StatefulWidget {
  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  Widget showSignUp() {
    return RaisedButton(
      child: Text('Sign Up'),
      onPressed: () {},
    );
  }

  Widget showSignIn() {
    return RaisedButton(
      child: Text('Sign In'),
      onPressed: () {},
    );
  }

  Widget showPassword() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: 'Password :', hintText: 'More than 6 charactor'),
          style: TextStyle(color: Colors.white),
    );
  }

  Widget showUser() {
    return TextFormField(
      decoration:
          InputDecoration(labelText: 'User :', hintText: 'your username...'),
          style: TextStyle(color: Colors.white),
    );
  }

  Widget showLogo() {
    return Image.asset('images/logo.png');
  }

  Widget showTitle() {
    return Text(
      'Pans Food',
      style: TextStyle(
          fontSize: 30.0, fontWeight: FontWeight.bold, color: Colors.white),
    );
  }

  @override
  Widget build(BuildContext context) {
    //แก้บั๊คเวลาเรากดแป้นพิมพ์ resizeToAvoidBottomPadding: false,
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.red[400], Colors.deepPurple[800]],
                  begin: Alignment(-1, -1))),
          padding: EdgeInsets.only(top: 70.0),
          alignment: Alignment(0, -1),
          child: Column(
            children: <Widget>[
              showLogo(),

              Container(
                margin: EdgeInsets.only(top: 10.0),
                child: showTitle(),
              ),


              Container(
                margin: EdgeInsets.only(left: 50.0, right: 50.0),
                child: showUser(),
              ),


              Container(
                margin: EdgeInsets.only(left: 50.0, right: 50.0),
                child: showPassword(),
              ),

              Container(
                margin: EdgeInsets.only(left: 50.0, right: 50.0, top: 15.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: showSignIn(),
                    ),


                    Expanded(
                      child: showSignUp(),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
