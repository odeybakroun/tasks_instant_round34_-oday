import '../../domain/entity/post_entity.dart';
import '../../domain/repository/post_repository.dart';
import '../sources/post_remote_data_source.dart';

class PostRepositoryImpl implements PostRepository {
  final PostRemoteDataSource remote;
  PostRepositoryImpl(this.remote);

  @override
  Future<List<PostEntity>> getPosts() => remote.fetchPosts();
}
