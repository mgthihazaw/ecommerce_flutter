import 'package:flutter/material.dart';

class Cart extends StatelessWidget {

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
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Cart"),
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: <Widget>[
              Expanded(
                  child: ListView.builder(
                      itemCount: productList.length,
                      itemBuilder: (ctx, index) => Card(
                            elevation: 2,
                            margin: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 4),
                              child: ListTile(
                                leading: Image.network(productList[index]["image"],fit: BoxFit.cover,width:50,),
                                
                                title: Text(productList[index]["title"]),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text("Color : yellow"),
                                    Text("Size : 26"),
                                    Text("Price : ${productList[index]["price"]}"),
                                    
                                  ],
                                ),
                                trailing: Container(
                                  width: 110,
                                  child: Row(children: <Widget>[
                                    IconButton(icon: Icon(Icons.arrow_drop_down),onPressed: (){},),
                                    Text("1"),
                                    IconButton(icon: Icon(Icons.arrow_drop_up),onPressed: (){},)
                                  ],),
                                )
                              ),
                            ),
                            shadowColor: Theme.of(context).primaryColor,
                            color: Colors.grey[200],
                          ))),
              Container(
                height: 50,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Expanded(
                      child: Center(
                          child: FittedBox(
                              child: Text(
                        "Total : MMK 100000",
                        style: Theme.of(context).textTheme.headline1,
                      ))),
                    ),
                    Expanded(
                        child: FlatButton(
                      color: Theme.of(context).primaryColor,
                      child: Text(
                        "Order Now",
                        style: Theme.of(context).textTheme.headline3,
                      ),
                      onPressed: () {},
                    )),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
