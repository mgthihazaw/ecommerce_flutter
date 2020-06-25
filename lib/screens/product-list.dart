import 'package:flutter/material.dart';

class ProductList extends StatefulWidget {
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final List<Map> productList = [
    {
      "title": "Tshirt",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSgtgAl2H4lbF3fWF7PMhplv4imCnZh0Lqlcw&usqp=CAU",
      "price": 5000,
    },
    {
      "title": "Shoe",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSAndsf_sCgMaGU0ZywjEdky3qINFeLfyAT4g&usqp=CAU",
      "price": 10000,
    },
    {
      "title": "Bag",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSLlD-SZQosSNabOqO-ElglZQlNMwCTQf3QxQ&usqp=CAU",
      "price": 5000,
    },
    {
      "title": "Tucker Bag",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQkjzD6f8l77i4K1axA2D29EC7OwAVKQw314w&usqp=CAU",
      "price": 5000,
    },
    {
      "title": "Kid Cycle",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQxJgCM8QYbtKKjHmjwTWWTcS8Ou_BxnmS1fQ&usqp=CAU",
      "price": 5000,
    },
    {
      "title": "Eye Glass",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQt1bbxxI7tHNrFh96cOa_QtVVjVZ003G_zCg&usqp=CAU",
      "price": 30000,
    },
    {
      "title": "Tshirt",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSgtgAl2H4lbF3fWF7PMhplv4imCnZh0Lqlcw&usqp=CAU",
      "price": 5000,
    },
    {
      "title": "Shoe",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSAndsf_sCgMaGU0ZywjEdky3qINFeLfyAT4g&usqp=CAU",
      "price": 10000,
    },
    {
      "title": "Bag",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSLlD-SZQosSNabOqO-ElglZQlNMwCTQf3QxQ&usqp=CAU",
      "price": 5000,
    },
    {
      "title": "Tucker Bag",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQkjzD6f8l77i4K1axA2D29EC7OwAVKQw314w&usqp=CAU",
      "price": 5000,
    },
    {
      "title": "Kid Cycle",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQxJgCM8QYbtKKjHmjwTWWTcS8Ou_BxnmS1fQ&usqp=CAU",
      "price": 5000,
    },
    {
      "title": "Eye Glass",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQt1bbxxI7tHNrFh96cOa_QtVVjVZ003G_zCg&usqp=CAU",
      "price": 30000,
    }
  ];
  @override
  Widget build(BuildContext context) {
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
              shadowColor: Theme.of(context).primaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              elevation: 5.0,
              child: Column(
                children: <Widget>[
                  Expanded(
                      child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.network(
                      productList[index]["image"],
                      // width: 170,

                      fit: BoxFit.fill,
                    ),
                  )),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(productList[index]["title"],
                            style: Theme.of(context).textTheme.headline1),
                        Text("MMK${productList[index]["price"]}",
                            style: Theme.of(context).textTheme.headline2),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: FlatButton(
                          color: Theme.of(context).primaryColor,
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
