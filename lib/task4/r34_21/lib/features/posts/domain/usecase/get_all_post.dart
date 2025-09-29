import 'package:r34_21/core/error/faliures.dart';
import 'package:r34_21/features/posts/domain/entities/post.dart';
import 'package:r34_21/features/posts/domain/repositories/post_repository.dart';
import 'package:dartz/dartz.dart';

class GetAllPost {
  final PostRepository repository;
  GetAllPost(this.repository);
     Future<Either<Failure, List<Post>>> call() {
    return repository.getAllPost();
  }
}