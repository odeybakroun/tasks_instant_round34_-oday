import 'package:equatable/equatable.dart';
import 'package:r34_21/core/error/faliures.dart';
import 'package:r34_21/features/posts/domain/entities/post.dart';
import 'package:r34_21/features/posts/domain/repositories/post_repository.dart';
import 'package:dartz/dartz.dart';


class UpdatePost {
  final PostRepository repository;
  UpdatePost(this.repository);
  Future<Either<Failure, Post>> call(UpdatePostparams params) {
    return repository.updatePost(  params.post);
  }
}

class UpdatePostparams extends Equatable {
   final Post post;

  const UpdatePostparams({ required this.post});
  @override
  List<Object?> get props => [id, post];
}