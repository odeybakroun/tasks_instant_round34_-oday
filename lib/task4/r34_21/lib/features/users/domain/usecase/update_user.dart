import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:r34_21/core/error/faliures.dart';
import 'package:r34_21/features/users/domain/entities/user.dart';
import 'package:r34_21/features/users/domain/repositories/user_repositories.dart';

class UpdateUser {
  final UserRepository repository;
  UpdateUser(this.repository);
    Future<Either<Failure, User>> call(UpdateUserparams params) {
    return repository.updateUser(  params.user);
  }
}

class UpdateUserparams extends Equatable{
 
  final User user;

  const UpdateUserparams({ required this.user});
  @override
  List<Object?> get props => [id, user]; 

}