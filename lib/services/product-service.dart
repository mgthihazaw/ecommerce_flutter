import '../repositories/repository.dart';
class ProductService{
  Repository _repository;
  ProductService(){
    this._repository = new Repository();
  }

  Future getProducts() async{
    return  _repository.get("/products");
  }

  Future getProductByCategory(id,page){
    return  _repository.get("/category/$id/products?page=$page");
  }
}