import 'package:task3/core/error/exceptions.dart';
import 'package:task3/features/user/data/models/users_model.dart';

abstract class UserRemoteDatesources {
  List<UsersModel> getAllUser();
  UsersModel getUser(String id);
  UsersModel createUser(UsersModel user);
  UsersModel updateUser(UsersModel user);
  UsersModel deleteUser(String id);
}

class UserRemoteDatesourcesImbl implements UserRemoteDatesources {
  final List<UsersModel> _user = [
    UsersModel(
        id: '1', name: 'Omar', email: 'Omar@gmail.com'),
    UsersModel(
        id: '2', name: 'Yazan', email: 'Yazan@gmail.com'),
  ];

  @override
  UsersModel createUser(UsersModel user) {
    final newuser =
        user.copywith(id: DateTime.now().microsecondsSinceEpoch.toString());
    _user.add(newuser);
    return newuser;
  }

  @override
  UsersModel deleteUser(String id) {
    try {
      final user = _user.firstWhere((p) => p.id == id);
      _user.remove(user);
      return user;
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  List<UsersModel> getAllUser() {
    return _user;
  }

  @override
  UsersModel getUser(String id) {
    try {
      return _user.firstWhere((p) => p.id == id);
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  UsersModel updateUser(UsersModel user) {
    final index = _user.indexWhere((p) => p.id == user.id);
    if (index != -1) {
      _user[index] = user;
      return user;
    } else {
      throw ServerException();
    }
  }
}
