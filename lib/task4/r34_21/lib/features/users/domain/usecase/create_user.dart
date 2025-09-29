
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:r34_21/core/error/faliures.dart';
import 'package:r34_21/features/users/domain/entities/user.dart';
import 'package:r34_21/features/users/domain/repositories/user_repositories.dart';


class CreateUser {
  final UserRepository repository;
  CreateUser(this.repository);
  Future<Either<Failure, User>> call(Createuserparams params) {
    return repository.createUser(params.user);
  }
}

class Createuserparams extends Equatable {
  final User user;
  const Createuserparams({required this.user });
  @override
  List<Object?> get props => [user];
}