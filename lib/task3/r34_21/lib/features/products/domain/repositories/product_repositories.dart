import 'package:dartz/dartz.dart';
import 'package:r34_21/core/error/faliures.dart';
import 'package:r34_21/features/products/domain/entities/product.dart';


abstract class ProductRepository {
  Future<Either<Failure, List<Product>>> getAllProducts();
  Future<Either<Failure, Product>> getProduct(String id);
  Future<Either<Failure, Product>> createProduct(Product product);
  Future<Either<Failure, Product>> updateProducts( Product product);
  Future<Either<Failure, bool>> deleteProduct(String id);
}