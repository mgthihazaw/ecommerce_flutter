import 'package:flutter/material.dart';

class CustomTitle extends StatelessWidget {
  final String title;
  CustomTitle({@required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                height: 2,
                decoration: BoxDecoration(color: Colors.grey),
              ),
              SizedBox(
                height: 3,
              ),
              Container(
                height: 2,
                decoration: BoxDecoration(color: Colors.grey),
              ),
            ],
          ),
        ),
        Padding(
            padding: EdgeInsets.all(5),
            child: Text(title,
                style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey))),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                height: 2,
                decoration: BoxDecoration(color: Colors.grey),
              ),
              SizedBox(
                height: 3,
              ),
              Container(
                height: 2,
                decoration: BoxDecoration(color: Colors.grey),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
