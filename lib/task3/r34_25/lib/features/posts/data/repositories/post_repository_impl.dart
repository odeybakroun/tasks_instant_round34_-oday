import 'package:dartz/dartz.dart';
import 'package:task3/core/error/exceptions.dart';
import 'package:task3/core/error/failures.dart';
import 'package:task3/features/posts/data/datasources/post_remote_datasource.dart';
import 'package:task3/features/posts/data/models/post_model.dart';
import 'package:task3/features/posts/domain/entities/posts.dart';
import 'package:task3/features/posts/domain/repositories/posts_repository.dart';

class PostRepoImplment implements PostRepository {
  final PostRemoteDatasource remoteDatasource;
  PostRepoImplment({required this.remoteDatasource});

  @override
  Either<Failure, List<Post>> getAllPosts() {
    try {
      final remotePosts = remoteDatasource.getAllPosts();
      return Right(remotePosts);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Either<Failure, Post> getPost(String id) {
    try {
      final remotePost = remoteDatasource.getPost(id);
      return Right(remotePost);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Either<Failure, Post> createPost(Post post) {
    try {
      final postModel = PostModel(
        id: post.id,
        title: post.title,
        content: post.content,
      );
      final newPost = remoteDatasource.createPost(postModel);
      return Right(newPost);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Either<Failure, Post> updatePost(Post post) {
    try {
      final postModel = PostModel(
        id: post.id,
        title: post.title,
        content: post.content,
      );
      final updatePost = remoteDatasource.updatePost(postModel);
      return Right(updatePost);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Either<Failure, bool> deletePost(String id) {
    try {
      final result = remoteDatasource.deletePost(id);
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
  

  }