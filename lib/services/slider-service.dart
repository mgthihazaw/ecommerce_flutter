import '../repositories/repository.dart';

class SliderService{
  Repository _repository;
  SliderService(){
    _repository = Repository();
  }

  Future getSlider() async{
    return  _repository.get("/sliders");
  }
}