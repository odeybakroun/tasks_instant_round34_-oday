import 'package:equatable/equatable.dart';
import 'package:r34_21/core/error/faliures.dart';
import 'package:r34_21/features/posts/domain/entities/post.dart';
import 'package:r34_21/features/posts/domain/repositories/post_repository.dart';
import 'package:dartz/dartz.dart';


class GetPost {
  final PostRepository repository;
  GetPost(this.repository);
  Future<Either<Failure, Post>> call(Getpostparams params) {
    return repository.getPost(params.id);
  }
}

class Getpostparams extends Equatable {
  final String id;
   const Getpostparams({required this.id});
  @override
  List<Object?> get props => [id];
}