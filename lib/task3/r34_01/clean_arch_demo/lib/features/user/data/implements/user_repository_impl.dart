import '../../domain/entity/user_entity.dart';
import '../../domain/repository/user_repository.dart';
import '../sources/user_remote_data_source.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource remote;
  UserRepositoryImpl(this.remote);

  @override
  Future<List<UserEntity>> getUsers() => remote.fetchUsers();
}
