import 'package:dartz/dartz.dart';
import 'package:r34_21/core/error/exception.dart';
import 'package:r34_21/core/error/faliures.dart';
import 'package:r34_21/features/users/data/datasurces/user_remote_datasourse.dart';
import 'package:r34_21/features/users/data/models/user_model.dart';
import 'package:r34_21/features/users/domain/entities/user.dart';
import 'package:r34_21/features/users/domain/repositories/user_repositories.dart';


class UserRepositoryImpl implements UserRepository {
  late final UserRemoteDatesources remoteDatasource;

  UserRepositoryImpl({required this.remoteDatasource});

  @override
  Future<Either<Failure, User>> createUser(User user) async {
    try {
      final Usermodel = UsersModel(
          id: user.id,
          name: user.name,
          email: user.email,
          password: user.password);
      final newproduct = remoteDatasource.createUser(Usermodel);
      return Right(newproduct);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> deleteUser(String id) async {
    try {
      final result = remoteDatasource.deleteUser(id);
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<User>>> getAllUser() async {
    try {
      final remoteuser = remoteDatasource.getAllUser();
      return Right(remoteuser);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, User>> getUser(String id) async {
    try {
      final remoteuser = remoteDatasource.getUser(id);
      return Right(remoteuser);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, User>> updateUser(User user) async {
    try {
      final usermodel = UsersModel(
          id: user.id,
          name: user.name,
          email: user.email,
          password: user.password);
      final updateproduct = remoteDatasource.updateUser(usermodel);
      return Right(updateproduct);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}