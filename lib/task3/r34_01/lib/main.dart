import 'package:flutter/material.dart';

// User Imports
import 'core/features/user/data/implements/user_repository_impl.dart';
import 'core/features/user/data/sources/user_remote_data_source_impl.dart';
import 'core/features/user/domain/usecase/get_all_users.dart';
import 'core/features/user/presentation/user_notifier.dart';
import 'core/features/user/presentation/user_page.dart';

void main() {
  final remote = UserRemoteDataSourceImpl();
  final repo = UserRepositoryImpl(remote);
  final getAllUsers = GetAllUsers(repo);
  final vm = UserNotifier(getAllUsers);

  runApp(MaterialApp(home: UserPage(vm: vm)));
}
