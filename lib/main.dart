import 'package:ecommerce/providers/category-provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/cart.dart';
import './screens/home.dart';
import './screens/product-detail.dart';


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
    
    
    return MultiProvider(providers: [
          ChangeNotifierProvider.value(value: CategoryProvider())
    ],
    child: MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch:CustomColor.primaryColor,
        accentColor: CustomColor.secondaryColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: ThemeData.light().textTheme.copyWith(
          headline1: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w500),
          headline2: TextStyle(color: CustomColor.secondaryColor,fontSize: 16,fontWeight: FontWeight.w500),
           headline3: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w500)
        )
      ),
      routes: {
        "/product-detail" : (ctx) => ProductDetail(),
        "/cart" : (ctx) => Cart()
      },
      home: Home(),
    ),
    );
  }
}


