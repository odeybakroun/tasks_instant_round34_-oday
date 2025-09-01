import '../entity/user_entity.dart';
import '../repository/user_repository.dart';

class GetAllUsers {
  final UserRepository repo;
  GetAllUsers(this.repo);

  Future<List<UserEntity>> call() async {
    return await repo.getUsers();
  }
}