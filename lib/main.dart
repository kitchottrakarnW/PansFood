import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pans_food/screens/authen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
      //กำหนดให้เป็นพอทเทรต 
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return MaterialApp(home: Authen());
  }
}
