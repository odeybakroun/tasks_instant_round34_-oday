import 'package:equatable/equatable.dart';
import 'package:r34_21/core/error/faliures.dart';
import 'package:r34_21/features/products/domain/entities/product.dart';
import 'package:dartz/dartz.dart';
import 'package:r34_21/features/products/domain/repositories/product_repositories.dart';


class UpdateProduct {
  final ProductRepository repository;
  UpdateProduct(this.repository); 
  Future<Either<Failure, Product>> call(UpdateProductparams params)async {
    return repository.updateProducts( params.product);
  }
}

class UpdateProductparams extends Equatable {
   final Product product;

  const UpdateProductparams({ required this.product});
  @override
  List<Object?> get props => [ product];
}