import 'package:ecommerce/models/cart.dart';
import 'package:ecommerce/services/cart-service.dart';
import 'package:flutter/foundation.dart';

class CartProvider with ChangeNotifier {
  List<Cart> _carts = [];
  int _count;
  int _total = 0;
  CartService _cartService;

  CartProvider() {
    _cartService = new CartService();
  }

  countCart() async {
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
    await _cartService.addCart(cart);
    await countCart();
    notifyListeners();
  }

  Future removeCart(id) async {
    print(id);
    try {
      await _cartService.remove(id);
      var index = _carts.indexWhere((element) => id == element.id);
      _carts.removeAt(index);
      await countCart();
      setTotal();
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  Future fetchData() async {
    var _cartItems = List<Cart>();
    var response = await _cartService.getData();
    print(response.runtimeType);
    response.forEach((data) {
      print(data['productPhoto']);
      _cartItems.add(Cart(
        id: data['productId'],
        name: data['productName'],
        image: data['productPhoto'],
        price: data['productPrice'],
        discount: data['productDiscount'],
        description: data['productDetail'] ?? 'No detail',
        quantity: data['productQuantity'],
      ));
    });
    setTotal();
    _carts = _cartItems;
    print(carts);
    notifyListeners();
  }

  changeQuantity(id, value) async {
    var data = _carts.where((element) => id == element.id).toList();
    var cartData = data.first;

    if (cartData.quantity <= 1 && value.isNegative) {
      print("Quantity is at least 1");
    } else {
      cartData.quantity += value;
      await _cartService.updateQuantity(id, value);
      setTotal();
      notifyListeners();
    }
  }
  setTotal(){
    _total =0;
    carts.forEach((element) {
      _total += (element.price * element.quantity);
    });
  }

  get count {
    return _count;
  }

  get carts {
    return [..._carts];
  }

  get total {
    
    return _total;
  }
}
