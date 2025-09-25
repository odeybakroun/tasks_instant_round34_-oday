import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:r34_27/core/error/failures.dart';
import 'package:r34_27/features/users/domain/entities/user.dart';
import 'package:r34_27/features/users/domain/repositories/user_repository.dart';

class CreateUser {
  final UserRepository repository;

  CreateUser(this.repository);

  Either<Failure, User> call(CreateUserParam params) {
    return repository.createUser(params.user);
  }
}

class CreateUserParam extends Equatable {
  final User user;
  
  const CreateUserParam({required this.user});

  @override
  List<Object?> get props => [user];
}
