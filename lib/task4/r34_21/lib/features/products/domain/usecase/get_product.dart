import 'package:equatable/equatable.dart';
import 'package:r34_21/core/error/faliures.dart';
import 'package:r34_21/features/products/domain/entities/product.dart';

import 'package:dartz/dartz.dart';
import 'package:r34_21/features/products/domain/repositories/product_repositories.dart';

class GetProduct {
  final ProductRepository repository;
  GetProduct(this.repository);
  Future<Either<Failure, Product>> call(Getproductparams params)async {
    return repository.getProduct(params.id);
  }
 
}


class Getproductparams extends Equatable {
  final String id;
  const Getproductparams({required this.id});
  @override
  List<Object?> get props => [id];
}