import '../entity/post_entity.dart';
import '../repository/post_repository.dart';

class GetAllPosts {
  final PostRepository repo;
  GetAllPosts(this.repo);

  Future<List<PostEntity>> call() async {
    return await repo.getPosts();
  }
}
