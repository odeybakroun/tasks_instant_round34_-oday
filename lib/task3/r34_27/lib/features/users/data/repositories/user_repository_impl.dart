import 'package:dartz/dartz.dart';
import 'package:r34_27/core/error/exceptions.dart';
import 'package:r34_27/core/error/failures.dart';
import 'package:r34_27/features/users/data/datasources/user_remote_datasource.dart';
import 'package:r34_27/features/users/data/models/user_model.dart';
import 'package:r34_27/features/users/domain/entities/user.dart';
import 'package:r34_27/features/users/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource userRemoteDataSource;

  UserRepositoryImpl({required this.userRemoteDataSource});

  @override
  Either<Failure, List<User>> getAllUsers() {
    try {
      return Right(userRemoteDataSource.getAllUsers());
    } on ServerException {
      return Left(ServerFailure());
    } catch (e) {
      return Left(UnexpectedFailure());
    }
  }

  @override
  Either<Failure, User> getUser(String id) {
    try {
      return Right(userRemoteDataSource.getUser(id));
    } on ServerException {
      return Left(ServerFailure());
    } catch (e) {
      return Left(UnexpectedFailure());
    }
  }

  @override
  Either<Failure, User> createUser(User user) {
    final userModel = UserModel(
      id: user.id,
      name: user.name,
      email: user.email,
    );

    try {
      return Right(userRemoteDataSource.createUser(userModel));
    } on ServerException {
      return Left(ServerFailure());
    } catch (e) {
      return Left(UnexpectedFailure());
    }
  }

  @override
  Either<Failure, User> updateUser(User user) {
    final userModel = UserModel(
      id: user.id,
      name: user.name,
      email: user.email,
    );
    try {
      return Right(userRemoteDataSource.updateUser(userModel));
    } on ServerException {
      return Left(ServerFailure());
    } catch (e) {
      return Left(UnexpectedFailure());
    }
  }

  @override
  Either<Failure, bool> deleteUser(String id) {
    try {
      return Right(userRemoteDataSource.deleteUser(id));
    } on ServerException {
      return Left(ServerFailure());
    } catch (e) {
      return Left(UnexpectedFailure());
    }
  }
}
