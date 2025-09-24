import 'package:equatable/equatable.dart';
import 'package:r34_21/core/error/faliures.dart';
import 'package:r34_21/features/products/domain/entities/product.dart';
import 'package:r34_21/features/products/domain/repositories/product_repositories.dart';
import 'package:dartz/dartz.dart';


class CreateProduct {
  final ProductRepository repository;
  CreateProduct(this.repository);
  Future<Either<Failure, Product>> call(Createproductparams params) {
    return repository.createProduct(params.product);
  }
}

class Createproductparams extends Equatable {
  final Product product;
  const Createproductparams({required this.product});
  @override
  List<Object?> get props => [product];
}