
import 'package:flutter/material.dart';
import '../widgets/app-drawer.dart';
import '../widgets/carousel.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.white,
        title: Text("Technature"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {},
            color: Theme.of(context).accentColor,
          )
        ],
      ),
      drawer: AppDrawer(),
      body: SingleChildScrollView(child: Column(children: <Widget>[
        Carousel()
      ],),)
      
    );
  }
}
