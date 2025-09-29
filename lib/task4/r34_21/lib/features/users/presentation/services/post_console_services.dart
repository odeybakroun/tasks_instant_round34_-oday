import 'package:r34_21/core/error/messages.dart';
import 'package:r34_21/features/users/domain/entities/user.dart';
import 'package:r34_21/features/users/domain/usecase/create_user.dart';
import 'package:r34_21/features/users/domain/usecase/delete_user.dart';
import 'package:r34_21/features/users/domain/usecase/get_all_user.dart';
import 'package:r34_21/features/users/domain/usecase/get_user.dart';
import 'package:r34_21/features/users/domain/usecase/update_user.dart';

class UserConsoleService with MapFailureMessages {
  late final GetAllUser getAllUserUsecase;
  late final GetUser getUserUsecase;
  late final CreateUser createUserUsecase;
  late final UpdateUser updateUserUsecase;
  late final DeleteUser deleteUserUsecase;

  UserConsoleService({
    required this.getAllUserUsecase,
    required this.getUserUsecase,
    required this.createUserUsecase,
    required this.updateUserUsecase,
    required this.deleteUserUsecase,
  });

 Future<void> displayAllusers() async {
    final result = await getAllUserUsecase();
    result.fold(
      (failure) => print('Error: ${mapFailureToMessage(failure)}'),
      (users) {
        if (users.isEmpty) {
          print('No users found.');
          return;
        }
        print('\n=== users ===');
        for (final user in users) {
          print('ID: ${user.id}');
          print('Name: ${user.name}');
          print('email: ${user.email}');
          print('password: ${user.password}');
          print('---');
        }
      },
    );
  }

  Future<void> displayuser(String id) async {
    final result = await getUserUsecase(Getuserparams(id: id));

    result.fold(
      (failure) => print('Error: ${mapFailureToMessage(failure)}'),
      (user) {
        print('\n=== user DETAILS ===');
        print('ID: ${user.id}');
        print('Name: ${user.name}');
        print('email: ${user.email}');
        print('password:${user.password}');
      },
    );
  }

  Future<void> createuser(String name, String email, String password) async {
    final user = User(
      id: '',
      name: name,
      email: email,
      password: password,
    );

    final result = await createUserUsecase(Createuserparams(user: user));

    result.fold(
      (failure) => print('Error: ${mapFailureToMessage(failure)}'),
      (newuser) => print('user created successfully with ID: ${newuser.id}'),
    );
  }

  Future<void> updateuser(String id, String name, String email, String password) async {
    final user = User(
      id: id,
      name: name,
      email: email,
      password: password,
    );

    final result = await updateUserUsecase(UpdateUserparams(user: user));

    result.fold(
      (failure) => print('Error: ${mapFailureToMessage(failure)}'),
      (updateduser) => print('user updated successfully'),
    );
  }

  Future<void> deleteuser(String id) async {
    final result = await deleteUserUsecase(DeleteUserparams(id: id));
    result.fold(
      (failure) => print('Error: ${mapFailureToMessage(failure)}'),
      (success) => print(
        success ? 'Product deleted successfully' : 'user not found',
      ),
    );
  }
}