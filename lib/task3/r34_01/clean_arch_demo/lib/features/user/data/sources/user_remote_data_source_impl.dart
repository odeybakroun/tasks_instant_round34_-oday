import '../model/user_model.dart';
import 'user_remote_data_source.dart';

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  @override
  Future<List<UserModel>> fetchUsers() async {
    // Mock data
    return [
      const UserModel(id: "1", name: "Arwa"),
      const UserModel(id: "2", name: "Radwan"),
    ];
  }
}