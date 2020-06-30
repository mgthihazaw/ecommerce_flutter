import 'package:http/http.dart' as http;
class Repository{
  final String baseUrl = "http://192.168.10.26:8000/api";

  Future get(String api) async{
    return http.get(baseUrl+api);
  }
}