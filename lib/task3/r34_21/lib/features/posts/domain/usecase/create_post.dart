import 'package:equatable/equatable.dart';

import 'package:dartz/dartz.dart';
import 'package:r34_21/core/error/faliures.dart';
import 'package:r34_21/features/posts/domain/entities/post.dart';
import 'package:r34_21/features/posts/domain/repositories/post_repository.dart';

class CreatePost {
  final PostRepository repository;
  CreatePost(this.repository);
    Future<Either<Failure, Post>> call(Createpostparams params) {
    return repository.createPost(params.post);
  }
}


class Createpostparams extends Equatable{
  final Post post;
  const Createpostparams({required this.post});
  @override
  List<Object?> get props => [post];
}