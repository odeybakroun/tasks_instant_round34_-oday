import 'package:equatable/equatable.dart';
import 'package:task3/core/error/failures.dart';
import 'package:task3/features/posts/domain/entities/post.dart';
import 'package:dartz/dartz.dart';
import 'package:task3/features/posts/domain/repositories/post_repository.dart';

class GetPost {
  final PostRepository repository;
  GetPost(this.repository);
  Future<Either<Failure, Post>> call(getPostparams params) {
    return repository.deletePost(params.id);
  }
}

class getPostparams extends Equatable {
  final String id;
   const getPostparams({required this.id});
  List<Object?> get props => [id];
}
