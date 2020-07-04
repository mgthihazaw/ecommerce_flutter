import 'package:ecommerce/models/product.dart';
import 'package:ecommerce/providers/cart-provider.dart';
import 'package:ecommerce/widgets/similar-product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetail extends StatefulWidget {
  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  bool _isInit = true;
  bool _isLoading = false;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  Future<void> addCart(BuildContext ctx, Product product) async {
    try {
      await Provider.of<CartProvider>(ctx, listen: false).addToCart(product);

      _scaffoldKey.currentState.showSnackBar(
          SnackBar(content: Text('You are successfully added to cart')));
    } catch (e) {
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text('Failed to ad to cart'),
        backgroundColor: Colors.red,
      ));
// Scaffold.of(ctx).showSnackBar(SnackBar(content: Text("Failed to ad to cart"),duration: Duration(seconds: 2),));
      print(e);
    }
  }

  @override
  void didChangeDependencies() async {
    if (_isInit) {
      _isLoading = true;
         print("DETAU");
      await Provider.of<CartProvider>(context, listen: false).countCart();
      setState(() {
        _isLoading = false;
      });
    }
    _isInit = false;

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
 
    final product = ModalRoute.of(context).settings.arguments as Product;

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

    return _isLoading
        ? Scaffold(body: Center(child: CircularProgressIndicator()))
        : Scaffold(
            key: _scaffoldKey,
            appBar: AppBar(
              // backgroundColor: Colors.white,
              title: Text(product.name),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {},
                ),
                Stack(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.shopping_cart),
                      onPressed: () {
                        Navigator.of(context).pushNamed("/cart");
                      },
                      color: Theme.of(context).accentColor,
                    ),
                    Positioned(
                      top: 2,
                      left: 2,
                      child: Container(
                        width: 15,
                        height: 15,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Theme.of(context).accentColor.withOpacity(0.8),
                        ),
                        child: Center(
                            child: FittedBox(
                                child: Consumer<CartProvider>(
                          builder: (ctx, cart, ch) => Text(
                            "${cart.count}",
                            style: TextStyle(fontSize: 12),
                          ),
                        ))),
                      ),
                    )
                  ],
                ),
              ],
            ),
            body: Container(
              width: double.infinity,
              height: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Image.network(
                    product.image,
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.fill,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(child: Text(product.name)),
                        Expanded(
                            child: Text("MMK${product.price}",
                                style: TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                    color: Theme.of(context).accentColor))),
                        Expanded(
                            child: Text("MMK${product.price}",
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
                            selectAttribute(
                                "Size", "Choose the size of product");
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
                            selectAttribute(
                                "Color", "Choose the color of product");
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
                          description: product.description,
                          title: product.name,
                          price: product.price,
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
                          selectAttribute("Buy",
                              "Now,You are buying to this product.I will ship the product as soon as possible");
                        },
                      )),
                      IconButton(
                          onPressed: () {
                            addCart(context, product);
                          },
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
  final String description;

  ProductInfo({this.price, this.title, this.description});
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
                description,
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
