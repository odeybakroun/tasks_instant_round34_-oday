import 'package:equatable/equatable.dart';
import 'package:task3/core/error/failures.dart';
import 'package:task3/features/posts/domain/entities/post.dart';
import 'package:dartz/dartz.dart';
import 'package:task3/features/posts/domain/repositories/post_repository.dart';

class CreatePost {
  final PostRepository repository;
  CreatePost(this.repository);
    Future<Either<Failure, Post>> call(createPostparams params) {
    return repository.createPost(params.post);
  }
}

class createPostparams extends Equatable{
  final Post post;
  const createPostparams({required this.post});
  List<Object?> get props => [post];
}
