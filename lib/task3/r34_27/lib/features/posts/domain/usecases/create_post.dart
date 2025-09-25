import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:r34_27/core/error/failures.dart';
import 'package:r34_27/features/posts/domain/entities/post.dart';
import 'package:r34_27/features/posts/domain/repositories/post_repository.dart';

class CreatePost {
  final PostRepository repository;

  CreatePost(this.repository);

  Either<Failure, Post> call(CreatePostParam params) {
    return repository.createPost(params.post);
  }
}

class CreatePostParam extends Equatable {
  final Post post;
  const CreatePostParam({required this.post});

  @override
  List<Object?> get props => [post];
}
