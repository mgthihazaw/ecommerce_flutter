import 'package:ecommerce/providers/product-provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryProduct extends StatefulWidget {
  @override
  _CategoryProductState createState() => _CategoryProductState();
}

class _CategoryProductState extends State<CategoryProduct> {
  ScrollController _scroll = ScrollController();
  bool _scrollLoading = false;
  var category;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<ProductProvider>(context, listen: false).clear();
    _scroll.addListener(() async{
      if (_scroll.position.pixels == _scroll.position.maxScrollExtent) {
        print("network call");
       await Provider.of<ProductProvider>(context, listen: false)
            .fetchProductsByCategory(category["id"]);
       
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scroll.dispose();
    
  }

  @override
  Widget build(BuildContext context) {
    category = ModalRoute.of(context).settings.arguments as Map;
    // Provider.of<ProductProvider>(context,listen:false).fetchProductsByCategory(category["id"]);
    return Scaffold(
      appBar: AppBar(
        title: Text(category["title"]),
      ),
      body: FutureBuilder(
        future: Provider.of<ProductProvider>(context, listen: false)
            .fetchProductsByCategory(category["id"]),
        builder: (ctx, snapShot) => snapShot.connectionState ==
                ConnectionState.waiting
            ? Center(child: CircularProgressIndicator())
            : Consumer<ProductProvider>(
                builder: (ctx, products, ch) => products
                            .categoryProducts.length ==
                        0
                    ? Center(child: Text("Products is not avaviable"))
                    : GridView.builder(
                        padding: EdgeInsets.all(10),
                        itemCount: products.categoryProducts.length,
                        controller: _scroll,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 4,
                            crossAxisSpacing: 4,
                            childAspectRatio: 7 / 8),
                        itemBuilder: (context, index) {
                          
                          return InkWell(
                            child: Card(
                              // color: Theme.of(context).primaryColor,
                              shadowColor: Theme.of(context)
                                  .accentColor
                                  .withOpacity(0.3),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              elevation: 5.0,
                              child: Column(
                                children: <Widget>[
                                  Expanded(
                                      child: ClipRRect(
                                    borderRadius: BorderRadius.circular(5),
                                    child: Image.network(
                                      products.categoryProducts[index].image,
                                      // width: 170,

                                      fit: BoxFit.fill,
                                    ),
                                  )),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 3),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Expanded(
                                          child: Text(
                                              products
                                                  .categoryProducts[index].name,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline1),
                                        ),
                                        Expanded(
                                          child: Text(
                                              "${products.categoryProducts[index].price}",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline2),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Expanded(
                                        child: FlatButton(
                                          color: Theme.of(context)
                                              .primaryColor
                                              .withOpacity(0.7),
                                          child: FittedBox(
                                              child: Text("Buy Now",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline3)),
                                          onPressed: () {},
                                        ),
                                      ),
                                      IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.shopping_cart,
                                            color:
                                                Theme.of(context).accentColor,
                                          ))
                                    ],
                                  )
                                ],
                              ),
                            ),
                            onTap: () {
                              Navigator.of(context).pushNamed("/product-detail",
                                  arguments: products.categoryProducts[index]);
                            },
                          );
                        }),
              ),
      ),
    );
  }
}
