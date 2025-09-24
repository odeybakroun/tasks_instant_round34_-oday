import 'package:equatable/equatable.dart';
import 'package:r34_21/core/error/faliures.dart';
import 'package:r34_21/features/posts/domain/repositories/post_repository.dart';
import 'package:dartz/dartz.dart';

class DeletePost {
  final PostRepository repository;
  DeletePost(this.repository);
  Future<Either<Failure, bool>> call(DeletePostparams params) {
    return repository.deletePost(params.id);
  }
}

class DeletePostparams extends Equatable{
  final String id;
    const DeletePostparams({required this.id});
  @override
  List<Object?> get props => [id];
}