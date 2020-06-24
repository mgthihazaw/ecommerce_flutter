
import 'package:ecommerce/widgets/category.dart';
import 'package:ecommerce/widgets/components/custom-title.dart';
import 'package:flutter/material.dart';
import '../widgets/app-drawer.dart';
import '../widgets/carousel.dart';
import './product-list.dart';


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
      body: ListView(children: <Widget>[
        Carousel(),
        Category(),
        CustomTitle(title: "Recent Products",),
        Container(
          width: double.infinity,
          height: 400,
          decoration: BoxDecoration(color: Colors.grey[100]),
          child: ProductList()),
         
       

      ],),

      
      
    );
  }
}
