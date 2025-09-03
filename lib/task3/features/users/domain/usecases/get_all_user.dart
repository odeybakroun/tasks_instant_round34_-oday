import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:task3/core/error/failures.dart';
import 'package:task3/features/users/domain/entities/user.dart';
import 'package:task3/features/users/domain/repositories/user_repository.dart';

class GetAllUser {
  final UserRepository repository;
  GetAllUser(this.repository);
    Future<Either<Failure, List<User>>> call() {
    return repository.getAllUser();
  }
}
