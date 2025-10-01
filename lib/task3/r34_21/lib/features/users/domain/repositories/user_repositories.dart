import 'package:dartz/dartz.dart';
import 'package:r34_21/core/error/faliures.dart';


import '../entities/user.dart';

abstract class UserRepository {
  Future<Either<Failure, List<User>>> getAllUser();
  Future<Either<Failure, User>> getUser(String id);
  Future<Either<Failure, User>> createUser(User user);
  Future<Either<Failure, User>> updateUser(  User user);
  Future<Either<Failure, bool>> deleteUser(String id);


}