import 'package:equatable/equatable.dart';
import 'package:r34_21/core/error/faliures.dart';
import 'package:dartz/dartz.dart';
import 'package:r34_21/features/products/domain/repositories/product_repositories.dart';

class DeleteProduct {
  final ProductRepository repository;
  DeleteProduct(this.repository);
    Future<Either<Failure, bool>> call
    (DeleteProductparams params) async{
    return repository.deleteProduct(params.id);
  }
 
}


class DeleteProductparams extends Equatable {
  final String id;
  const DeleteProductparams({required this.id});
  @override
  List<Object?> get props => [id];
}