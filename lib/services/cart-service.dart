
import 'package:ecommerce/repositories/repository.dart';
import 'package:ecommerce/models/cart.dart';

class CartService{
  Repository _repository;

  CartService(){
    _repository = new Repository();
  }

  Future addCart(Cart cart) async{
    List<Map> items = await _repository.getLocalByCondition("carts", "productId", cart.id);
    if(items.length>0){
      cart.quantity = items.first['productQuantity']+1;
      await _repository.updateLocal("carts","productId", cart.toMap());
    }
    await _repository.saveLocal("carts", cart.toMap());
  }

  count() async{
   return await  _repository.countLocal("carts");
  }
}