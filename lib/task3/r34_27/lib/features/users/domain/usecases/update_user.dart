import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:r34_27/core/error/failures.dart';
import 'package:r34_27/features/users/domain/entities/user.dart';
import 'package:r34_27/features/users/domain/repositories/user_repository.dart';

class UpdateUser {
  final UserRepository repository;

  UpdateUser(this.repository);

  Either<Failure, User> call(UpdateUserParam params) {
    return repository.updateUser(params.user);
  }
}

class UpdateUserParam extends Equatable {
  final User user;
  
  const UpdateUserParam({required this.user});

  @override
  List<Object?> get props => [user];
}
