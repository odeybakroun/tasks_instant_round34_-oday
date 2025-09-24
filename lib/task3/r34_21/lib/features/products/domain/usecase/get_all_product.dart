import 'package:r34_21/core/error/faliures.dart';
import 'package:r34_21/features/products/domain/entities/product.dart';


import 'package:dartz/dartz.dart';
import 'package:r34_21/features/products/domain/repositories/product_repositories.dart';
  class GetAllProducts {
  final ProductRepository repository;
  GetAllProducts(this.repository);
  Future<Either<Failure, List<Product>>> call()async {
    return repository.getAllProducts();
  }
}
 