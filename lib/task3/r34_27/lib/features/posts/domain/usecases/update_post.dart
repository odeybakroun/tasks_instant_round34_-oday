import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:r34_27/core/error/failures.dart';
import 'package:r34_27/features/posts/domain/entities/post.dart';
import 'package:r34_27/features/posts/domain/repositories/post_repository.dart';

class UpdatePost {
  final PostRepository repository;

  UpdatePost(this.repository);

  Either<Failure, Post> call(UpdatePostParam params) {
    return repository.updatePost(params.post);
  }
}

class UpdatePostParam extends Equatable {
  final Post post;
  
  const UpdatePostParam({required this.post});

  @override
  List<Object?> get props => [post];
}
