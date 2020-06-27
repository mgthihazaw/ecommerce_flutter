import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/home-provider.dart';
import '../providers/category.dart' as pro;

class Category extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<pro.Category> categories =
        Provider.of<HomeProvider>(context).categories;
    return Container(
      height: 90,
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical:10),
      // decoration: BoxDecoration(color: Colors.grey[300]),
      child: ListView.builder(
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (ctx, index) => CategoryItem(
          id: categories[index].id,
          title: categories[index].title,
          image: categories[index].image,
        ),
        // children: <Widget>[
        //   CategoryItem(
        //     title: "Phone",
        //     image: "assets/images/phone.png",
        //   ),
        //   CategoryItem(
        //     title: "Laptop",
        //     image: "assets/images/laptop.png",
        //   ),
        //   CategoryItem(
        //     title: "Clock",
        //     image: "assets/images/clock.png",
        //   ),
        //   CategoryItem(
        //     title: "Tshirt",
        //     image: "assets/images/tshirt.jpg",
        //   ),
        //   CategoryItem(
        //     title: "glass",
        //     image: "assets/images/glass.png",
        //   ),

        // ],
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final int id;
  final String image;
  final String title;
  CategoryItem({@required this.id, @required this.image, @required this.title});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
          width: 100,
          height: 70,
          padding: EdgeInsets.all(5),
          // decoration: BoxDecoration(color: Colors.white, boxShadow: [
          //   BoxShadow(
          //       color: Colors.black54,
          //       blurRadius: 40,
          //       spreadRadius: 2,
          //       offset: Offset(1, 5))
          // ]),
          child: Column(
            children: <Widget>[
              Container(
                
                width: 35,
                height: 35,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context).accentColor.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 4,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.network(
                      image,
                      width: 35,
                      height: 35,
                      fit: BoxFit.cover,
                    )),
                ),
             
              ),
               SizedBox(height: 5),
              FittedBox(
                child: Text(
                  title,
                  
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                      
                      fontWeight: FontWeight.w600),
                ),
              )
            ],
          )),
      onTap: () {
        showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
                  elevation: 5,
                  title: Text("Message"),
                  content: Text("Products of category are unavaiable"),
                  actions: <Widget>[
                    FlatButton(
                      child: Text("OK"),
                      onPressed: () {
                        Navigator.of(ctx).pop();
                      },
                    )
                  ],
                ));
      },
    );
  }
}
