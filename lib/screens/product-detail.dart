import 'package:flutter/material.dart';

class ProductDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context).settings.arguments as Map;

    return Scaffold(
        appBar: AppBar(
          // backgroundColor: Colors.white,
          title: Text(data["title"]),
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
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: <Widget>[
              Image.network(
                data['image'],
                width: double.infinity,
                height: 300,
                fit: BoxFit.fill,
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                  child: ListView(
                children: <Widget>[
                  ListTile(leading: Text("Name"),title: Text(data["title"]),),
                  ListTile(leading: Text("Category"),title: Text("Example"),),
                  ListTile(leading: Text("Brand"),title: Text("Technature"),),
                  ListTile(leading: Text("Price"),title: Text("${data["price"]}"),),
                  ListTile(leading: Text("Description"),title: Text("A product description is the marketing copy that explains what a product is and why it’s worth purchasing. The purpose of a product description is to supply customers with important information about the features and benefits of the product so they’re compelled to buy."),),
                 
                ],
              )),
              Row(
                
                children: <Widget>[
                  Expanded(
                      child: FlatButton(
                        
                    color: Theme.of(context).primaryColor,
                    child: Text(
                      "Buy Now",
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    onPressed: () {},
                  )),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.shopping_cart,
                        color: Theme.of(context).accentColor,
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.favorite_border,
                        color: Theme.of(context).accentColor,
                      ))
                ],
              )
            ],
          ),
        ));
  }
}
