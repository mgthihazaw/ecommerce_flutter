import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:carousel_slider/carousel_options.dart';

class Carousel extends StatefulWidget {
  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  int _current;
  List _imageList = [
    "assets/carousels/image1.jpg",
    "assets/carousels/image2.jpg",
    "assets/carousels/image3.jpg",
    "assets/carousels/image4.jpg",
    "assets/carousels/image5.jpg",
  ];
  List<T> mapSlide<T>(List list, handler) {
    List<T> result = [];
    int i = 0;
    list.forEach((value) {
      result.add(handler(i, value));
      i++;
    });
    return result;
  }

  @override
  Widget build(BuildContext context) {
    // print(_current);
    return Column(
      children: <Widget>[
        CarouselSlider(
          options: CarouselOptions(
              height: 170,
              aspectRatio: 16 / 8,
              viewportFraction: 1,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 1500),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              scrollDirection: Axis.horizontal,
              onPageChanged: (index, _) {
                setState(() {
                  _current = index;
                });
              }),
          items: _imageList.map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration:
                        BoxDecoration(color: Theme.of(context).accentColor),
                    child: Image.asset(i, fit: BoxFit.cover));
              },
            );
          }).toList(),
        ),
        Container(
          decoration: BoxDecoration(color: Colors.grey[300]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: mapSlide<Widget>(_imageList, (index, url) {
              return Container(
                margin: EdgeInsets.all(7),
                width: _current == index ?10 :5,
                height: _current == index ?10 :5,
                decoration: BoxDecoration(
                    border: Border.all(color: Theme.of(context).primaryColor),
                    shape: BoxShape.circle,
                    color: _current == index
                        ? Theme.of(context).primaryColor
                        : null),
              );
            }),
          ),
        )
      ],
    );
  }
}
