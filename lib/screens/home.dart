import 'dart:convert';
import 'package:ecommerce/providers/cart-provider.dart';
import 'package:ecommerce/providers/product-provider.dart';
import 'package:ecommerce/services/slider-service.dart';
import 'package:provider/provider.dart';
// import 'package:ecommerce/providers/home-provider.dart';
import 'package:ecommerce/widgets/category.dart';
import 'package:ecommerce/widgets/components/custom-title.dart';
import 'package:flutter/material.dart';
import '../widgets/app-drawer.dart';
import '../widgets/carousel.dart';
import './product-list.dart';
import '../providers/category-provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _isLoading = false;
  bool _isInit = true;
  SliderService _sliderService = new SliderService();
  var _sliders;

  @override
  void didChangeDependencies() async {
    if (_isInit) {
      _isLoading = true;
      await Provider.of<CategoryProvider>(context, listen: false).fetchData();
      await Provider.of<ProductProvider>(context, listen: false).getProducts();
      await Provider.of<CartProvider>(context, listen: false).countCart();
      await getSliders();
      setState(() {
        _isLoading = false;
      });
    }
    _isInit = false;

    super.didChangeDependencies();
  }

  Future<void> getSliders() async {
    var response = await _sliderService.getSlider();
    var data = json.decode(response.body);
    _sliders = data["data"];
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
          Stack(
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.of(context).pushNamed("/cart");
                },
                color: Theme.of(context).accentColor,
              ),
              Positioned(
                top: 2,
                left: 2,
                child: Container(
                  width: 15,
                  height: 15,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Theme.of(context).accentColor.withOpacity(0.8),
                  ),
                  child: Center(
                      child: FittedBox(
                          child: Consumer<CartProvider>(
                    builder: (ctx, cart, ch) => Text(
                      _isLoading ? "0" : "${cart.count}",
                      style: TextStyle(fontSize: 12),
                    ),
                  ))),
                ),
              )
            ],
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView(
              children: <Widget>[
                Carousel(_sliders),
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
