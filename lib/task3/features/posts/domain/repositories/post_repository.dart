import 'package:dartz/dartz.dart';
import 'package:task3/core/error/failures.dart';
import 'package:task3/features/posts/domain/entities/post.dart';
abstract class PostRepository {
  Future<Either<Failure, List<Post>>> getAllPost();
  Future<Either<Failure, Post>> getPost(String id);
  Future<Either<Failure, Post>> createPost(Post post);
  Future<Either<Failure, Post>> updatePost(String id, Post post);
  Future<Either<Failure, Post>> deletePost(String id);

}