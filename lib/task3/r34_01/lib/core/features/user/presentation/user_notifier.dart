import 'package:flutter/foundation.dart';

import '../domain/entity/user_entity.dart';
import '../domain/usecase/get_all_users.dart';
class UserNotifier extends ChangeNotifier {
  final GetAllUsers getAllUsers;
  List<UserEntity> users = [];
  bool loading = false;

  UserNotifier(this.getAllUsers);

  Future<void> load() async {
    loading = true;
    notifyListeners();
    users = await getAllUsers();
    loading = false;
    notifyListeners();
  }
}

