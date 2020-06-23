import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: double.infinity,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(color: Colors.grey[300]),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          CategoryItem(
            title: "Phone",
            image: "assets/images/phone.png",
          ),
          CategoryItem(
            title: "Laptop",
            image: "assets/images/laptop.png",
          ),
          CategoryItem(
            title: "Clock",
            image: "assets/images/clock.png",
          ),
          CategoryItem(
            title: "Tshirt",
            image: "assets/images/tshirt.jpg",
          ),
          CategoryItem(
            title: "glass",
            image: "assets/images/glass.png",
          )
        ],
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final String image;
  final String title;
  CategoryItem({@required this.image, @required this.title});
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 100,
        height: 70,
        // padding: EdgeInsets.all(5),
        child: Column(
          children: <Widget>[
            ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset(
                  image,
                  width: 40,
                  height: 40,
                  fit: BoxFit.cover,
                )),
                SizedBox(height:5),
            Text(
              title,
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                  fontWeight: FontWeight.w600),
            )
          ],
        ));
  }
}
