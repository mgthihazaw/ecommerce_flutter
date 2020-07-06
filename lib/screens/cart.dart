import 'package:ecommerce/providers/cart-provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/cart.dart' as m;

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  bool _isLoading = true;
  

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      loadCarts();
    });
  }

  loadCarts() async {
    await Provider.of<CartProvider>(context, listen: false).fetchData();
  }

  @override
  Widget build(BuildContext context) {
    print("List od Cart");
    return Scaffold(
        appBar: AppBar(
          title: Text("Cart"),
        ),
        body: FutureBuilder(
            future:
                Provider.of<CartProvider>(context, listen: false).fetchData(),
            builder: (ctx, snapShot) => snapShot.connectionState ==
                    ConnectionState.waiting
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Consumer<CartProvider>(
                  
                    builder: (ctx, cart, ch)  {
                      print("Load Com");
                     return  Container(
                      
                          height: double.infinity,
                          width: double.infinity,
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                  child: ListView.builder(
                                      itemCount: cart.carts.length,
                                      itemBuilder: (ctx, index) => CartItem(data: cart.carts[index]))),
                              Container(
                                height: 50,
                                child: Row(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: <Widget>[
                                    Expanded(
                                      child: Center(
                                          child: FittedBox(
                                              child: Text(
                                        "Total : MMK ${cart.total}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline1,
                                      ))),
                                    ),
                                    Expanded(
                                        child: FlatButton(
                                      color: Theme.of(context).primaryColor,
                                      child: Text(
                                        "Order Now",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline3,
                                      ),
                                      onPressed: () {},
                                    )),
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                    })));
  }
}

class CartItem extends StatelessWidget {
 final m.Cart data;
  const CartItem({
    Key key,
    this.data
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
     print("Cart");
    return Dismissible(
      key: ValueKey(data.id),
      direction: DismissDirection.startToEnd,
      confirmDismiss: (dir) {
        return showDialog(
            context: context,
            builder: (ctx) {
              return AlertDialog(
                title: Text("Are you sure to delete?"),
                content: Text("Do you want to remove item from the cart?"),
                actions: <Widget>[
                  FlatButton(
                    child: Text("No"),
                    onPressed: () { Navigator.of(context).pop(false);},
                  ),
                  FlatButton(
                    child: Text("Yes"),
                    onPressed: ()  {Navigator.of(context).pop(true);},
                  )
                ],
              );
            });
      },
      onDismissed: (dir){
        Provider.of<CartProvider>(context,listen: false).removeCart(data.id);
      },
      background: Container(
        alignment: Alignment.centerLeft,
        color: Colors.red[200],
        child:Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Icon(Icons.delete,color: Colors.red,size: 30,),
        )
      ),
          child: Card(
            elevation: 2,
            margin: EdgeInsets.symmetric(
                vertical: 5, horizontal: 10),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: 5, horizontal: 4),
              child: ListTile(
                  leading: Image.network(
                    data.image,
                    fit: BoxFit.cover,
                    width: 50,
                  ),
                  title: Text(data.name),
                  subtitle: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment
                            .start,
                    children: <Widget>[
                      Text("Color : yellow"),
                      Text("Size : 26"),
                      Text(
                          "Price : ${data.price}"),
                    ],
                  ),
                  trailing: Container(
                    width: 120,
                    child: Row(
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons
                              .arrow_drop_down),
                          onPressed: () {
                            Provider.of<CartProvider>(context,listen: false).changeQuantity(data.id,-1);
                          },
                        ),
                        FittedBox(child: Text("${data.quantity}")),
                        IconButton(
                          icon: Icon(Icons
                              .arrow_drop_up),
                          onPressed: () {
                            Provider.of<CartProvider>(context,listen:false).changeQuantity(data.id,1);
                          },
                        )
                      ],
                    ),
                  )),
            ),
            shadowColor:
                Theme.of(context).primaryColor,
            color: Colors.grey[200],
          ),
    );
  }
}
