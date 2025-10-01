import 'package:task3/core/error/exceptions.dart';
import 'package:task3/features/product/data/models/product_model.dart';

abstract class ProductRemoteDatasource {
  List<ProductModel> getAllProducts();
  ProductModel getProduct(String id);
  ProductModel createProduct(ProductModel product);
  ProductModel updateProducts(ProductModel product);
  bool deleteProduct(String id);
}

class ProductRemoteDatasourceImpl implements ProductRemoteDatasource {
  final List<ProductModel> _products = [
    ProductModel(id: '1', name: 'Apple', description: 'iPhone 17 Pro Max', price: 1200),
    ProductModel(id: '2',name: 'Samsung',description: 'S 25 Ultra', price: 1300),
    ProductModel(id: '3', name: 'LG', description: 'TV 55 inch', price: 2700),
    ProductModel(id: '4', name: 'Watch', description: 'Apple Watch 11', price: 500),
    ProductModel(id: '5', name: 'Airpods', description: 'Airpods Pro 3', price: 225),
    ProductModel(id: '6', name: 'Laptop', description: 'MacBook Pro', price: 2250),
    ProductModel(id: '7', name: 'Computer', description: 'iMac', price: 1299)
  ];

  @override
  List<ProductModel> getAllProducts() {
    return _products;
  }

  @override
  ProductModel getProduct(String id) {
    try {
      return _products.firstWhere((p) => p.id == id);
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  ProductModel createProduct(ProductModel product) {
    final newProduct = product.copywith(
      id: DateTime.now().microsecondsSinceEpoch.toString(),
    );
    _products.add(newProduct);
    return newProduct;
  }

  @override
  ProductModel updateProducts(ProductModel product) {
    final index = _products.indexWhere((p) => p.id == product.id);
    if (index != -1) {
      _products[index] = product;
      return product;
    } else {
      throw ServerException();
    }
  }

  @override
  bool deleteProduct(String id) {
    final initialLength = _products.length;
    _products.removeWhere((Product) => Product.id == id);
    return _products.length < initialLength;
  }
}
