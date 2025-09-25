import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:r34_27/core/error/failures.dart';
import 'package:r34_27/features/users/domain/repositories/user_repository.dart';

class DeleteUser {
  final UserRepository repository;

  DeleteUser(this.repository);

  Either<Failure, bool> call(DeleteUserParam params) {
    return repository.deleteUser(params.id);
  }
}

class DeleteUserParam extends Equatable {
  final String id;
  
  const DeleteUserParam({required this.id});

  @override
  List<Object?> get props => [id];
}
