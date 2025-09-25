import 'package:dartz/dartz.dart';
import 'package:r34_27/core/error/failures.dart';
import 'package:r34_27/features/products/domain/entities/product.dart';

abstract class ProductRepository {
  Either<Failure, List<Product>> getAllProducts();
  Either<Failure, Product> getProduct(String id);
  Either<Failure, Product> createProduct(Product product);
  Either<Failure, Product> updateProduct(Product product);
  Either<Failure, bool> deleteProduct(String id);
}
