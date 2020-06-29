import '../repositories/repository.dart';

class CategoryService{
  Repository _repository;
  CategoryService(){
    _repository = Repository();
  }

  Future getCategory() async{
    return  _repository.get("/category");
  }
}