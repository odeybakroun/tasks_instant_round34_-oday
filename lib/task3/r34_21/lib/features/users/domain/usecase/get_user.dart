import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:r34_21/core/error/faliures.dart';
import 'package:r34_21/features/users/domain/entities/user.dart';
import 'package:r34_21/features/users/domain/repositories/user_repositories.dart';


class GetUser {
  final UserRepository repository;
  GetUser(this.repository);
    Future<Either<Failure, User>> call(Getuserparams params) {
    return repository.getUser(params.id);
  }
}

class Getuserparams extends Equatable {
  final String id;
  const Getuserparams({required this.id});
  @override
  List<Object?> get props => [id];
}