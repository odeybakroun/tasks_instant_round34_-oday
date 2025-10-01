import 'package:r34_27/core/error/exceptions.dart';
import 'package:r34_27/features/products/data/models/product_model.dart';

abstract class ProductRemoteDatasource {
  List<ProductModel> getAllProducts();
  ProductModel getProduct(String id);
  ProductModel createProduct(ProductModel product);
  ProductModel updataProduct(ProductModel product);
  bool deleteProduct(String id);
}

class ProductRemoteDatasourceImpl implements ProductRemoteDatasource {
  final List<ProductModel> _products = [
    const ProductModel(
      id: '1',
      name: 'Product 1',
      description: 'Description 1',
      price: 10.0,
    ),
    const ProductModel(
      id: '2',
      name: 'Product 2',
      description: 'Description 2',
      price: 20.0,
    ),
  ];

  @override
  ProductModel createProduct(ProductModel product) {
    final newProduct = product.copyWith(
      id: DateTime.now().microsecondsSinceEpoch.toString(),
    );
    _products.add(newProduct);
    return newProduct;
  }

  @override
  bool deleteProduct(String id) {
    final initialLength = _products.length;
    _products.removeWhere((product) => product.id == id);
    return _products.length < initialLength;
  }

  @override
  List<ProductModel> getAllProducts() {
    return _products;
  }

  @override
  ProductModel getProduct(String id) {
    try {
      return _products.firstWhere((product) => product.id == id);
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  ProductModel updataProduct(ProductModel product) {
    final index = _products.indexWhere((p) => p.id == product.id);
    if (index != -1) {
      _products[index] = product;
      return product;
    } else {
      throw ServerException();
    }
  }
  
}
