import 'package:ecommerce/widgets/similar-product.dart';
import 'package:flutter/material.dart';

class ProductDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context).settings.arguments as Map;

    void selectAttribute(String title, String message) {
      showDialog(
          context: context,
          builder: (ctx) {
            return AlertDialog(
              title: Text(title),
              content: Text(message),
              actions: <Widget>[
                FlatButton(
                  child: Text("OK"),
                  onPressed: () {
                    Navigator.of(ctx).pop();
                  },
                )
              ],
            );
          });
    }

    return Scaffold(
        appBar: AppBar(
          // backgroundColor: Colors.white,
          title: Text(data["name"]),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.of(context).pushNamed("/cart");
              },
              color: Theme.of(context).accentColor,
            )
          ],
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Image.network(
                data['image'],
                width: double.infinity,
                height: 200,
                fit: BoxFit.fill,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  children: <Widget>[
                    Expanded(child: Text(data["title"])),
                    Expanded(
                        child: Text("MMK5000",
                            style: TextStyle(
                                decoration: TextDecoration.lineThrough,
                                color: Theme.of(context).accentColor))),
                    Expanded(
                        child: Text("MMK3500",
                            style: Theme.of(context).textTheme.headline2)),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: FlatButton(
                      onPressed: () {
                        selectAttribute("Size", "Choose the size of product");
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("Size"),
                          Icon(Icons.arrow_drop_down)
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: FlatButton(
                      onPressed: () {
                        selectAttribute("Color", "Choose the color of product");
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("Color"),
                          Icon(Icons.arrow_drop_down)
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: FlatButton(
                      onPressed: () {
                        selectAttribute(
                            "Quantity", "Select the quantity of product");
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("Quantity"),
                          Icon(Icons.arrow_drop_down)
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: ListView(
                  children: <Widget>[
                    Text(
                      "Product Detail",
                      style: TextStyle(
                          color: Theme.of(context).accentColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ProductInfo(
                      title: data["title"],
                      price: data["price"],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Similar Products",
                      style: TextStyle(
                          color: Theme.of(context).accentColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    SimilarProduct()
                  ],
                ),
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
                    onPressed: () {
                      selectAttribute("Buy", "Now,You are buying to this product.I will ship the product as soon as possible");
                    },
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

class ProductInfo extends StatelessWidget {
  final String title;
  final int price;

  ProductInfo({this.price, this.title});
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(width: 100, child: Text("Name")),
            Text(title)
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: <Widget>[
            Container(width: 100, child: Text("Category")),
            Text("Example")
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: <Widget>[
            Container(width: 100, child: Text("Brand")),
            Text("Technature")
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: <Widget>[
            Container(width: 100, child: Text("Price")),
            Text("$price")
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: <Widget>[
            Container(width: 100, child: Text("Description")),
            Expanded(
              child: Text(
                "A product description is the marketing copy that explains what a product is and why it’s worth purchasing. The purpose of a product description is to supply customers with important information about the features and benefits of the product so they’re compelled to buy.",
                softWrap: true,
                textAlign: TextAlign.left,
              ),
            ),
          ],
        ),
      ],
    ));
  }
}
