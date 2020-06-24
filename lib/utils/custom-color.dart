import 'package:flutter/material.dart';
class CustomColor{
   static Map<int, Color> primaryCodes = {
      50: Color.fromRGBO(8,101,160, .1),
      100: Color.fromRGBO(8,101,160, .2),
      200: Color.fromRGBO(8,101,160, .3),
      300: Color.fromRGBO(8,101,160, .4),
      400: Color.fromRGBO(8,101,160, .5),
      500: Color.fromRGBO(8,101,160, .6),
      600: Color.fromRGBO(8,101,160, .7),
      700: Color.fromRGBO(8,101,160, .8),
      800: Color.fromRGBO(8,101,160, .9),
      900: Color.fromRGBO(8,101,160, 1),
    };
    static Map<int, Color> secondaryCodes = {
      50: Color.fromRGBO(100,26,26, .1),
      100: Color.fromRGBO(100,26,26, .2),
      200: Color.fromRGBO(100,26,26, .3),
      300: Color.fromRGBO(100,26,26, .4),
      400: Color.fromRGBO(100,26,26, .5),
      500: Color.fromRGBO(100,26,26, .6),
      600: Color.fromRGBO(100,26,26, .7),
      700: Color.fromRGBO(100,26,26, .8),
      800: Color.fromRGBO(100,26,26, .9),
      900: Color.fromRGBO(100,26,26, 1),
    };

   static  MaterialColor primaryColor = new MaterialColor(0xFF0865A0, CustomColor.primaryCodes);
   static  MaterialColor secondaryColor = new MaterialColor(0xFF701A1A, CustomColor.secondaryCodes);

}