import 'package:r34_27/core/error/exceptions.dart';
import 'package:r34_27/features/users/data/models/user_model.dart';

abstract class UserRemoteDataSource {
  List<UserModel> getAllUsers();
  UserModel getUser(String id);
  UserModel createUser(UserModel userModel);
  UserModel updateUser(UserModel userModel);
  bool deleteUser(String id);
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final List<UserModel> _users = [
    UserModel(id: "1", name: "user1", email: "user1@gmail.com" ),
    UserModel(id: "2", name: "user2", email: "user2@gmail.com" ),
    UserModel(id: "3", name: "user3", email: "user3@gmail.com" ),
    UserModel(id: "4", name: "user4", email: "user4@gmail.com" ),
  ];

  @override
  List<UserModel> getAllUsers() {
    return _users;
  }

  @override
  UserModel getUser(String id) {
    try {
      return _users.firstWhere((user) => user.id == id); 
    } catch (e) {
      throw ServerException(); 
    }
  }

  @override
  UserModel createUser(UserModel userModel) {

    final UserModel newUser = userModel.copyWith(
      id: DateTime.now().microsecondsSinceEpoch.toString(),
    );
    _users.add(newUser);
    return newUser;
  }

  @override
  UserModel updateUser(UserModel userModel) {
    final int index = _users.indexWhere((u) => u.id == userModel.id);
    if (index != -1) {
      _users[index] = userModel; 
      return userModel;
    } else {
      throw ServerException();
    }
  }

  @override
  bool deleteUser(String id) {
    final initialLength = _users.length;
    _users.removeWhere((user) => id == user.id);
    return _users.length < initialLength;
  }
}
