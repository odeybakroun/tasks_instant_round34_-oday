import 'package:dartz/dartz.dart';
import 'package:r34_21/core/error/exception.dart';
import 'package:r34_21/core/error/faliures.dart';
import 'package:r34_21/features/posts/data/datasurces/post_remote_datasourse.dart';
import 'package:r34_21/features/posts/data/models/post_model.dart';
import 'package:r34_21/features/posts/domain/entities/post.dart';
import 'package:r34_21/features/posts/domain/repositories/post_repository.dart';

class PostRepositoryImpl implements PostRepository {
  final PostRemoteDatasource remoteDatasource;

  PostRepositoryImpl({required this.remoteDatasource});

  @override
  Future<Either<Failure, List<Post>>> getAllPost() async {
    try {
      final models = await remoteDatasource.getAllPost();
      // لو الـ datasource بيرجع List<PostModel> → حولها لـ List<Post>
      final posts = models.map((m) => (m as PostModel).toEntity()).toList();
      return Right(posts);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Post>> getPost(String id) async {
    try {
      final model = await remoteDatasource.getPost(id);
      return Right(model.toEntity());
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Post>> createPost(Post post) async {
    try {
      final model = PostModel.fromEntity(post);
      final createdModel = await remoteDatasource.createPost(model);
      return Right(createdModel.toEntity());
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Post>> updatePost(Post post) async {
    try {
      final model = PostModel.fromEntity(post);
      final updatedModel = await remoteDatasource.updatePost(model);
      return Right(updatedModel.toEntity());
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> deletePost(String id) async {
    try {
      final result = await remoteDatasource.deletePost(id);
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}