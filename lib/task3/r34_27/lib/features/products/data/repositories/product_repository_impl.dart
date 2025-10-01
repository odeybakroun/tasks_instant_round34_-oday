import 'package:dartz/dartz.dart';
import 'package:r34_27/core/error/exceptions.dart';
import 'package:r34_27/core/error/failures.dart';
import 'package:r34_27/features/products/data/datasources/product_remote_datasource.dart';
import 'package:r34_27/features/products/data/models/product_model.dart';
import 'package:r34_27/features/products/domain/entities/product.dart';
import 'package:r34_27/features/products/domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDatasource remoteDatasource;

  ProductRepositoryImpl({required this.remoteDatasource });

  @override
  Either<Failure, Product> createProduct(Product product) {
    try {
      final productModel = ProductModel(
        id: product.id,
        name: product.name,
        description: product.description,
        price: product.price,
      );
      final newProduct = remoteDatasource.createProduct(productModel);
      return Right(newProduct);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Either<Failure, bool> deleteProduct(String id) {
    try {
      final result = remoteDatasource.deleteProduct(id);
      return Right(result);
    } on ServerException {
      return left(ServerFailure());
    }
  }

  @override
  Either<Failure, List<Product>> getAllProducts() {
    try {
      final remoteProducts = remoteDatasource.getAllProducts();
      return Right(remoteProducts);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Either<Failure, Product> getProduct(String id) {
    try {
      final remoteProduct = remoteDatasource.getProduct(id);
      return Right(remoteProduct);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Either<Failure, Product> updateProduct(Product product) {
    try {
      final productModel = ProductModel(
        id: product.id,
        name: product.name,
        description: product.description,
        price: product.price,
      );
      final updatedProduct = remoteDatasource.updataProduct(productModel);
      return Right(updatedProduct);
    } on ServerException {
      return left(ServerFailure());
    }
  }
}
