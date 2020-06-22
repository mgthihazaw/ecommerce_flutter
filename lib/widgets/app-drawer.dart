import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          UserAccountsDrawerHeader(
              accountEmail: Text("thihazaw@gmail.com"),
              accountName: Text("Thihazaw",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
              currentAccountPicture: CircleAvatar(
                radius: 50.0,
                backgroundColor: const Color(0xFF778899),
                backgroundImage: NetworkImage(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSFhVOhLgtakrEOCWjjox80OrI0Yx5ieXzLorWuOrgPM7ue3XTv&usqp=CAU"),
              )),
          Expanded(
              child: ListView(
            children: <Widget>[
              ListTile(
                onTap: () {},
                leading: Icon(
                  Icons.home,
                  color: Theme.of(context).accentColor,
                ),
                title: Text("Home",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
              ),
              ListTile(
                onTap: () {},
                leading: Icon(
                  Icons.dashboard,
                  color: Theme.of(context).accentColor,
                ),
                title: Text("Dashboard",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
              ),
              ListTile(
                onTap: () {},
                leading: Icon(
                  Icons.person,
                  color: Theme.of(context).accentColor,
                ),
                title: Text("Profile",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
              ),
              ListTile(
                onTap: () {},
                leading: Icon(
                  Icons.shopping_cart,
                  color: Theme.of(context).accentColor,
                ),
                title: Text("Cart",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
              ),
              ListTile(
                onTap: () {},
                leading: Icon(
                  Icons.category,
                  color: Theme.of(context).accentColor,
                ),
                title: Text("Category",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
              ),
              ListTile(
                onTap: () {},
                leading: Icon(
                  Icons.settings,
                  color: Theme.of(context).accentColor,
                ),
                title: Text("Settings",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
