import 'package:dartz/dartz.dart';
import 'package:r34_21/core/error/faliures.dart';
import 'package:r34_21/features/posts/domain/entities/post.dart';

abstract class PostRepository {
  Future<Either<Failure, List<Post>>> getAllPost();
  Future<Either<Failure, Post>> getPost(String id);
  Future<Either<Failure, Post>> createPost(Post post);
  Future<Either<Failure, Post>> updatePost(  Post post);
  Future<Either<Failure, bool>> deletePost(String id);

}