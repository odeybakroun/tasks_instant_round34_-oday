import '../model/post_model.dart';
import 'post_remote_data_source.dart';

class PostRemoteDataSourceImpl implements PostRemoteDataSource {
  @override
  Future<List<PostModel>> fetchPosts() async {
    // Mock data
    return [
      const PostModel(id: "1", name: "Arwa"),
      const PostModel(id: "2", name: "Radwan"),
    ];
  }
}
