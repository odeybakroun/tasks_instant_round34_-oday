import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:r34_21/core/error/exception.dart';
import 'package:r34_21/core/network/api_provider.dart';


class HttpProvider implements ApiProvider {
  final http.Client client;
  final Duration timeout;

  HttpProvider({
    http.Client? client,
    this.timeout=const Duration(seconds: 40), 
  }):client=client ?? http.Client();


  @override

  Future<dynamic>get(String url,{Map<String,String>?headers}) async{
    final Response =await client
    .get(Uri.parse(url),headers: _mergeJsonHeaders(headers))
    .timeout(timeout);
    
    return _processResponse(Response);
  }
  

   @override

  Future<dynamic> Post(String url, {Map<String,String>? headers,Object? body}) async{
    final Response =await client
    .post(Uri.parse(url),headers: _mergeJsonHeaders(headers),body: _encodeBody(body))
    .timeout(timeout);
    return _processResponse(Response);
  }


     @override

  Future<dynamic> put(String url , {Map<String,String>? headers,Object? body}) async{
    final Response =await client
    .put(Uri.parse(url),headers: _mergeJsonHeaders(headers),body: _encodeBody(body))
    .timeout(timeout);
    return _processResponse(Response);
  }

   @override

  Future<dynamic>delete(String url,{Map<String,String>?headers}) async{
    final Response =await client
    .delete(Uri.parse(url),headers: _mergeJsonHeaders(headers))
    .timeout(timeout);
    
    return _processResponse(Response);
  }




  Map<String,String>_mergeJsonHeaders(Map<String,String>? headers){
    return {
      'content-type': 'application/Json',
      'accept': 'application/Json',
      
      ...?headers,
    };
  }

  String _encodeBody (Object? body){
    if (body == null) return json.encode({});
    if (body is String) return body;
    return json.encode(body);
  }
  

  dynamic _processResponse(http.Response response) {

    final statusCode =response.statusCode;
    if (statusCode >=200 && statusCode <300){
      if(response.body.isEmpty) return null;
      try{
        return json.decode(response.body);
      }catch(e){
        return response.body;
      }
    }else{
      if (statusCode == 400) throw BadRequestException();
      if(statusCode == 401 || statusCode == 403 ) throw UnAuthorizedException();
      if(statusCode == 404 ) throw NotFoundException();
      throw ServerException();
    }
  }
}
