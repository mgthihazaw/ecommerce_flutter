import 'package:flutter/material.dart';
class CustomTitle extends StatelessWidget {

  final String title;
  CustomTitle({@required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
            children: <Widget>[
              Expanded(
                  child: Container(
                height: 3,
                decoration: BoxDecoration(color: Colors.grey),
              )),
              Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(title,
                      style: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey))),
              Expanded(
                  child: Container(
                height: 3,
                decoration: BoxDecoration(color: Colors.grey),
              )),
            ],
          );
  }
}