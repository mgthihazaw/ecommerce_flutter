import 'package:ecommerce/providers/product-provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductList extends StatefulWidget {
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  
  @override
  Widget build(BuildContext context) {
     List productList = Provider.of<ProductProvider>(context).products;
    //  print(productList);
  // return Text("Hello");
    return GridView.builder(
        padding: EdgeInsets.all(10),
        itemCount: productList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 4,
            crossAxisSpacing: 4,
            childAspectRatio: 7 / 8),
        itemBuilder: (context, index) {
          return InkWell(
            child: Card(
              // color: Theme.of(context).primaryColor,
              shadowColor: Theme.of(context).accentColor.withOpacity(0.3),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              elevation: 5.0,
              child: Column(
                children: <Widget>[
                  Expanded(
                      child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.network(
                      productList[index].image,
                      width: 180,

                      fit: BoxFit.fill,
                    ),
                  )),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                                                  child: Text(productList[index].name,
                                style: Theme.of(context).textTheme.headline1),
                        ),
                        Expanded(
                                                  child: Text("${productList[index].price}",
                                style: Theme.of(context).textTheme.headline2),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: FlatButton(
                          color: Theme.of(context).primaryColor.withOpacity(0.7),
                          child: FittedBox(
                              child: Text("Buy Now",
                                  style:
                                      Theme.of(context).textTheme.headline3)),
                          onPressed: () {},
                        ),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.shopping_cart,
                            color: Theme.of(context).accentColor,
                          ))
                    ],
                  )
                ],
              ),
            ),
            onTap: (){
              
              Navigator.of(context).pushNamed("/product-detail",arguments: productList[index]);
            },
          );
        });
  }
}
