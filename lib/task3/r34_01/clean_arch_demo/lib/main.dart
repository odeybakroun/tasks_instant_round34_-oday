import 'package:flutter/material.dart';

// User imports
import 'package:clean_arch_demo/features/user/data/implements/user_repository_impl.dart';
import 'package:clean_arch_demo/features/user/data/sources/user_remote_data_source_impl.dart';
import 'package:clean_arch_demo/features/user/domain/usecase/get_all_users.dart';
import 'package:clean_arch_demo/features/user/presentation/user_notifier.dart';
import 'package:clean_arch_demo/features/user/presentation/user_page.dart';

void main() {
  // Setup User feature
  final remote = UserRemoteDataSourceImpl();
  final repo = UserRepositoryImpl(remote);
  final getAllUsers = GetAllUsers(repo);
  final vm = UserNotifier(getAllUsers);

  runApp(MaterialApp(
    home: UserPage(vm: vm),
  ));
}

