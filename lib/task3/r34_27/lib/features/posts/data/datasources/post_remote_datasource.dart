import 'package:r34_27/core/error/exceptions.dart';
import 'package:r34_27/features/posts/data/models/post_model.dart';

abstract class PostRemoteDataSource {
  List<PostModel> getAllPosts();
  PostModel getPost(String id);
  PostModel createPost(PostModel post);
  PostModel updatePost(PostModel post);
  bool deletePost(String id);
}

class PostRemoteDataSourceImpl implements PostRemoteDataSource {
  final List<PostModel> _posts = [
    PostModel(id: "1", title: "post1", numOfLikes: 20, text: "text1"),
    PostModel(id: "2", title: "post2", numOfLikes: 20, text: "text2"),
    PostModel(id: "3", title: "post3", numOfLikes: 20, text: "text3"),
    PostModel(id: "4", title: "post4", numOfLikes: 20, text: "text4"),
    PostModel(id: "5", title: "post5", numOfLikes: 20, text: "text5"),
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
  PostModel createPost(PostModel post) {
    final PostModel newPost = post.copyWith(
      id: DateTime.now().microsecondsSinceEpoch.toString(),
    );
    _posts.add(newPost);
    return newPost;
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
  bool deletePost(String id) {
    final initialLength = _posts.length;
    _posts.removeWhere((p) => id == p.id);
    return _posts.length < initialLength;
  }
}
