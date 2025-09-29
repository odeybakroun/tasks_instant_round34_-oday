import 'package:dartz/dartz.dart';
import 'package:r34_21/core/error/faliures.dart';
import 'package:r34_21/features/users/domain/entities/user.dart';
import 'package:r34_21/features/users/domain/repositories/user_repositories.dart';


class GetAllUser {
  final UserRepository repository;
  GetAllUser(this.repository);
    Future<Either<Failure, List<User>>> call() {
    return repository.getAllUser();
  }
}