import 'package:ecommerce/models/cart.dart';
import 'package:ecommerce/services/cart-service.dart';
import 'package:flutter/foundation.dart';

class CartProvider with ChangeNotifier {
  List<Cart> carts = [];
  int _count;
  CartService _cartService;

  CartProvider() {
    _cartService = new CartService();
  }

  countCart() async{
    print("Hello");
  _count = await _cartService.count();
  print(_count);
  }

  Future addToCart(product) async {
    Cart cart = Cart(
        id: product.id,
        name: product.name,
        image: product.image,
        price: product.price,
        discount: 0,
        quantity: 0);

    cart.quantity = 1;
    _cartService.addCart(cart);
    notifyListeners();
  }

  get count{
    return _count;
  }
}
