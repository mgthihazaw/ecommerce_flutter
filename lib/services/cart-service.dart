import 'package:ecommerce/repositories/repository.dart';
import 'package:ecommerce/models/cart.dart';

class CartService {
  Repository _repository;

  CartService() {
    _repository = new Repository();
  }

  Future getData() async {
    return _repository.getLocal("carts");
  }

  Future addCart(Cart cart) async {
    List<Map> items =
        await _repository.getLocalByCondition("carts", "productId", cart.id);
    if (items.length > 0) {
      cart.quantity = items.first['productQuantity'] + 1;
      await _repository.updateLocal("carts", "productId", cart.toMap());
    } else {
      await _repository.saveLocal("carts", cart.toMap());
    }
  }

  count() async {
    return await _repository.countLocal("carts");
  }
  remove(id) async{
    return await _repository.removeLocalById("carts",id);
  }
  updateQuantity(id,value) async{
     List<Map> items = await _repository.getLocalByCondition("carts", "productId", id);
     var query = items.first;
    var cart = Cart(
      id: query['productId'],
      description:"",
      image: query['productPhoto'],
      price: query['productPrice'],
      quantity: query['productQuantity'],
      name:  query['productName'],
      discount:  query['productDiscount']
     );

    // 'productId' 
  //     'productName' 
  //     'productPhoto'
  //     'productPrice' 
  //     'productDiscount' 
  //     'productQuantity'

    
     cart.quantity= cart.quantity + value;
      await _repository.updateLocal("carts", "productId", cart.toMap());
  }
}
