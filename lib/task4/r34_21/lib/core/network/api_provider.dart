

abstract class ApiProvider {
  Future<dynamic> get(String url);
  Future<dynamic> Post(String url,{Map<String,dynamic>?body});
  Future<dynamic> put(String url,{Map<String,dynamic>?body});
  Future<dynamic> delete(String url);
}
