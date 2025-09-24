
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:r34_21/core/error/faliures.dart';
import 'package:r34_21/features/users/domain/repositories/user_repositories.dart';

class DeleteUser {
  final UserRepository repository;
  DeleteUser(this.repository);
  Future<Either<Failure, bool>> call(DeleteUserparams params) {
    return repository.deleteUser(params.id);
  }
 
}


class DeleteUserparams extends Equatable {
  final String id;
  const DeleteUserparams({required this.id});
  @override
  List<Object?> get props => [id];
}