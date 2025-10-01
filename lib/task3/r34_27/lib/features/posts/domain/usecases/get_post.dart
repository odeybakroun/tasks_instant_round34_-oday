import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:r34_27/core/error/failures.dart';
import 'package:r34_27/features/posts/domain/entities/post.dart';
import 'package:r34_27/features/posts/domain/repositories/post_repository.dart';

class GetPost {
  final PostRepository repository;

  GetPost(this.repository);

  Either<Failure, Post> call(GetPostParam params) {
    return repository.getPost(params.id);
  }
}

class GetPostParam extends Equatable {
  final String id;
  
  const GetPostParam({required this.id});

  @override
  List<Object?> get props => [id];
}
