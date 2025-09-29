import 'dart:convert';

import 'package:r34_21/core/constant/url_constant.dart';
import 'package:r34_21/core/error/exception.dart';
import 'package:r34_21/core/network/api_provider.dart';
import 'package:r34_21/features/products/data/models/product_model.dart';

abstract class ProductRemoteDatasource {
  Future<List<ProductModel>> getAllProducts();
  Future<ProductModel> getProduct(String id);
  Future<ProductModel> createProduct(ProductModel product);
  Future<ProductModel> updateProducts(ProductModel product);
  Future<bool> deleteProduct(String id);
}

class ProductRemoteDatasourceImpl implements ProductRemoteDatasource {
  final ApiProvider apiProvider;
  static const _baseUrl = UrlConstant.baseURL + UrlConstant.productsEndPoint;
  ProductRemoteDatasourceImpl({required this.apiProvider});

  @override
  Future<ProductModel> createProduct(ProductModel product) async {
  try {
 
    final body = product.toJsonForCreate();

   
    final response = await apiProvider.Post(
      '${_baseUrl}/add',
      body: body,
    );

   
    final Map<String, dynamic> data =
        response is String ? jsonDecode(response) : response;
    
  
    return ProductModel.fromJson(data);

  } catch (e) {
    
    print("Create Product Error: $e");
    
    
    throw ServerException();
  }
}

  @override
 Future<bool> deleteProduct(String id) async {
  try {
   
    await apiProvider.delete('${_baseUrl}/$id');


    return true;
  } catch (e) {
 
    throw ServerException();
  }
}

  @override
  Future<List<ProductModel>> getAllProducts() async {
  try {
   
    final finalResponse = await apiProvider.get('${_baseUrl}?limit=100');
    final Map<String, dynamic> data =
        finalResponse is String ? jsonDecode(finalResponse) : finalResponse;

   
    final List listProductsJson = data['products'] as List;


    final List<ProductModel> products = listProductsJson
        .map((p) => ProductModel.fromJson(p as Map<String, dynamic>))
        .toList();

    return products;
  } catch (e) {
 
    print('Error in getAllProducts: $e');
    
    throw ServerException();
  }
}

  @override
  Future<ProductModel> getProduct(String id) async {
  try {
  
    final response = await apiProvider.get('${_baseUrl}/$id');


    final Map<String, dynamic> data =
        response is String ? jsonDecode(response) : response;
    
   
    return ProductModel.fromJson(data);
  } catch (e) {
    
    print('Error in getProduct: $e'); 
    
    throw ServerException();
  }
}

  @override
  Future <ProductModel>updateProducts(ProductModel product) async{
  try {
   
    final body = product.toJson();

    
    final response = await apiProvider.put(
      '${_baseUrl}/${product.id}',
      body: body,
    );
    final Map<String, dynamic> data =
        response is String ? jsonDecode(response) : response;
    
    
    return ProductModel.fromJson(data);
  } catch (e) {
    
    print("Update Product Error: $e");
    
  
    throw ServerException();
  }
}
    }
  

