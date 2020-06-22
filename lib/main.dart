import 'package:flutter/material.dart';
import './screens/home.dart';
import './utils/custom-color.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

//  static Map<int, Color> colorCodes = {
//       50: Color.fromRGBO(8,101,160, .1),
//       100: Color.fromRGBO(8,101,160, .2),
//       200: Color.fromRGBO(8,101,160, .3),
//       300: Color.fromRGBO(8,101,160, .4),
//       400: Color.fromRGBO(8,101,160, .5),
//       500: Color.fromRGBO(8,101,160, .6),
//       600: Color.fromRGBO(8,101,160, .7),
//       700: Color.fromRGBO(8,101,160, .8),
//       800: Color.fromRGBO(8,101,160, .9),
//       900: Color.fromRGBO(8,101,160, 1),
//     };

//     MaterialColor color = new MaterialColor(0xFF0865A0, MyApp.colorCodes);

 
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch:CustomColor.primaryColor,
        accentColor: CustomColor.secondaryColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Home(),
    );
  }
}

