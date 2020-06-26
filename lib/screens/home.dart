import 'package:provider/provider.dart';
import 'package:ecommerce/providers/home-provider.dart';
import 'package:ecommerce/widgets/category.dart';
import 'package:ecommerce/widgets/components/custom-title.dart';
import 'package:flutter/material.dart';
import '../widgets/app-drawer.dart';
import '../widgets/carousel.dart';
import './product-list.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _isLoading = false;
  bool _isInit = true;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      Provider.of<HomeProvider>(context).fetchData().then((res) {
        // setState(() {
        _isLoading = false;
        // });

        print("SUCCS");
      }).catchError((err) {
        _isLoading = false;
      });
    }
    _isInit = false;

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.white,
        title: Text("Technature"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.of(context).pushNamed("/cart");
            },
            color: Theme.of(context).accentColor,
          )
        ],
      ),
      drawer: AppDrawer(),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView(
              children: <Widget>[
                Carousel(),
                Category(),
                CustomTitle(
                  title: "Recent Products",
                ),
                Container(
                    width: double.infinity,
                    height: 400,
                    decoration: BoxDecoration(color: Colors.grey[100]),
                    child: ProductList()),
              ],
            ),
    );
  }
}
