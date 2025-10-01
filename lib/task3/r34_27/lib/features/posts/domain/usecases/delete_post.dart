import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:r34_27/core/error/failures.dart';
import 'package:r34_27/features/posts/domain/repositories/post_repository.dart';

class DeletePost {
  final PostRepository repository;

  DeletePost(this.repository);

  Either<Failure, bool> call(DeletePostParam params) {
    return repository.deletePost(params.id);
  }
}

class DeletePostParam extends Equatable {
  final String id;
  
  const DeletePostParam({required this.id});

  @override
  List<Object?> get props => [id];
}
