import 'package:task3/core/error/exceptions.dart';
import 'package:task3/features/posts/data/models/post_model.dart';

abstract class PostRemoteDatasource {
  List<PostModel> getAllPosts();
  PostModel getPost(String id);
  PostModel createPost(PostModel post);
  PostModel updatePost(PostModel post);
  bool deletePost(String id);
}

class PostRemoteDataSourceImpl implements PostRemoteDatasource {
  final List<PostModel> _posts = [
    const PostModel(
      id: '1',
      title: 'Post title 1',
      content: 'Welcome to the first post',
      
    ),
    const PostModel(
      id: '2',
      title: 'Post Title 2',
      content: 'Welcome to the second post',
      
    ),
  ];

  @override
  List<PostModel> getAllPosts() {
    return _posts;
  }

  @override
  PostModel getPost(String id) {
    try {
      return _posts.firstWhere((post) => post.id == id);
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  PostModel updatePost(PostModel post) {
    final index = _posts.indexWhere((p) => p.id == post.id);
    if (index != -1) {
      _posts[index] = post;
      return post;
    } else {
      throw ServerException();
    }
  }

  @override
  PostModel createPost(PostModel post) {
    final newPost = post.copyWith(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
    );
    _posts.add(newPost);
    return newPost;
  }

  @override
  bool deletePost(String id) {
    final initialLength = _posts.length;
    _posts.removeWhere((post) => post.id == id);
    return _posts.length < initialLength;
  }
}