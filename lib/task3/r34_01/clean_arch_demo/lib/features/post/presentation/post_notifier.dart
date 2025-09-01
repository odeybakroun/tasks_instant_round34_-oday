import 'package:flutter/foundation.dart';

import '../domain/entity/post_entity.dart';
import '../domain/usecase/get_all_posts.dart';

class PostNotifier extends ChangeNotifier {
  final GetAllPosts getAllPosts;
  List<PostEntity> posts = [];
  bool loading = false;

  PostNotifier(this.getAllPosts);

  Future<void> load() async {
    loading = true;
    notifyListeners();
    posts = await getAllPosts();
    loading = false;
    notifyListeners();
  }
}
