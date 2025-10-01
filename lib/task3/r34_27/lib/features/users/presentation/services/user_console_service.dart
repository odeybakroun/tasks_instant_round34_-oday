import 'package:r34_27/core/error/messages.dart';
import 'package:r34_27/features/users/domain/entities/user.dart';
import 'package:r34_27/features/users/domain/usecases/create_user.dart';
import 'package:r34_27/features/users/domain/usecases/delete_user.dart';
import 'package:r34_27/features/users/domain/usecases/get_all_users.dart';
import 'package:r34_27/features/users/domain/usecases/get_user.dart';
import 'package:r34_27/features/users/domain/usecases/update_user.dart';

class UserConsoleService with MapFailureMessages {
  final GetAllUsers getAllUsersUseCase;
  final GetUser getUserUseCase;
  final CreateUser createUserUseCase;
  final UpdateUser updateUserUseCase;
  final DeleteUser deleteUserUseCase;

  UserConsoleService({
    required this.getAllUsersUseCase,
    required this.getUserUseCase,
    required this.createUserUseCase,
    required this.updateUserUseCase,
    required this.deleteUserUseCase,
  });

  void displayAllUsers() {
    final result = getAllUsersUseCase();
    result.fold((failure) => print("Error is ${mapFailureToMessage(failure)}"), (
      users,
    ) {
      if (users.isEmpty) {
        print("No users found.");
      } else {
        print("\n===== USERS ====");
        for (final user in users) {
          print("ID: ${user.id}");
          print("Name: ${user.name}");
          print("Email: ${user.email}");
          print("------");
        }
      }
    });
  }

  void displayUser(String id) {
    final result = getUserUseCase(GetUserParam(id: id));

    result.fold((failure) => print("Error is ${mapFailureToMessage(failure)}"), (
      user,
    ) {
      print("ID: ${user.id}");
      print("Name: ${user.name}");
      print("Email: ${user.email}");
      print("------");
    });
  }

  void createUser(String name, String email ) {
    final user = User(id: '', name: name, email: email );
    final result = createUserUseCase(CreateUserParam(user: user));

    result.fold((failure) => print("Error is ${mapFailureToMessage(failure)}"), (
      newUser,
    ) {
      print("\nUser is created successfully with details :\n");
      print("ID: ${newUser.id}");
      print("Name: ${newUser.name}");
      print("Email: ${newUser.email}");
    });
  }

  void updateUser(
    String id,
    String name,
    String email,
  ) {
    final user = User(
      id: id,
      name: name,
      email: email,
    );
    final result = updateUserUseCase(UpdateUserParam(user: user));

    result.fold((failure) => print("Error is ${mapFailureToMessage(failure)}"), (
      updatedUser,
    ) {
      print("\nUser is updated successfully with details :\n");
      print("ID: ${updatedUser.id}");
      print("Name: ${updatedUser.name}");
      print("Email: ${updatedUser.email}");
    });
  }

  void deleteUser(String id) {
    final result = deleteUserUseCase(DeleteUserParam(id: id));
    result.fold(
      (failure) => print("Error is ${mapFailureToMessage(failure)}"),
      (success) => print(
        success
            ? "User is deleted successfully"
            : "User with id $id was not found",
      ),
    );
  }
}
