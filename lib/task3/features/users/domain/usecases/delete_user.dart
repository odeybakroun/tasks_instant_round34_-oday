
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:task3/core/error/failures.dart';
import 'package:task3/features/users/domain/entities/user.dart';
import 'package:task3/features/users/domain/repositories/user_repository.dart';
class DeleteUser {
  final UserRepository repository;
  DeleteUser(this.repository);
  Future<Either<Failure, User>> call(DeleteUserparams params) {
    return repository.deleteUser(params.id);
  }
 
}


class DeleteUserparams extends Equatable {
  final String id;
  const DeleteUserparams({required this.id});
  List<Object?> get props => [id];
}
