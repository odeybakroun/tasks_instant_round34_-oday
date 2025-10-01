import 'package:task3/core/error/messages.dart';
import 'package:task3/features/posts/domain/entities/posts.dart';
import 'package:task3/features/posts/domain/usecase/create_posts.dart';
import 'package:task3/features/posts/domain/usecase/delete_posts.dart';
import 'package:task3/features/posts/domain/usecase/get_all_posts.dart';
import 'package:task3/features/posts/domain/usecase/get_posts.dart';
import 'package:task3/features/posts/domain/usecase/update_posts.dart';

class PostConsoleService with MapFailureMessages {
  final GetAllPosts getAllPostsUseCase;
  final GetPost getPostUseCase;
  final CreatePost createPostUseCase;
  final UpdatePost updatePostUseCase;
  final DeletePost deletePostUseCase;

  PostConsoleService({
    required this.getAllPostsUseCase,
    required this.getPostUseCase,
    required this.createPostUseCase,
    required this.updatePostUseCase,
    required this.deletePostUseCase,
  });

  void displayAllPosts() {
    final result = getAllPostsUseCase();
    result.fold(
      (failure) => print('Error: ${mapFailureMessages(failure)}'),
      (posts) {
        if (posts.isEmpty) {
          print('No posts found.');
        } else {
          print('\n== All Posts ==');
          for (final post in posts) {
            print('ID: ${post.id}');
            print('Title: ${post.title}');
            print('Content: ${post.content}');
            print('--');
          }
        }
      },
    );
  }

  void displayPost(String id) {
    final result = getPostUseCase(GetPostParams(id: id));
    result.fold(
      (failure) => print('Error: ${mapFailureMessages(failure)}'),
      (post) {
        print('\n== Post Details ==');
        print('ID: ${post.id}');
        print('Title: ${post.title}');
        print('Content: ${post.content}');
      },
    );
  }

  void createPost(String title, String content) {
    final post = Post(
      id: '',
      title: title,
      content: content,
    );

    final result = createPostUseCase(CreatePostParams(post: post));
    result.fold(
      (failure) => print('Error: ${mapFailureMessages(failure)}'),
      (newPost) => print('✅ Post created successfully with ID: ${newPost.id}'),
    );
  }

  void updatePost(String id, String title, String content) {
    final post = Post(
      id: id,
      title: title,
      content: content,
    );

    final result = updatePostUseCase(UpdatePostParams(post: post));
    result.fold(
      (failure) => print('Error: ${mapFailureMessages(failure)}'),
      (_) => print('✅ Post updated successfully'),
    );
  }

  void deletePost(String id) {
    final result = deletePostUseCase(DeletePostParams(id: id));
    result.fold(
      (failure) => print('Error: ${mapFailureMessages(failure)}'),
      (success) => print(success ? '🗑️ Post deleted successfully' : '❌ Post not found'),
    );
  }
}