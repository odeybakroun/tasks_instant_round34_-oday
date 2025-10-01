import 'dart:io';
import 'package:r34_27/features/posts/presentation/console/post_menu.dart';
import 'package:r34_27/features/products/presentation/console/product_menu.dart';
import 'package:r34_27/features/users/presentation/console/user_menu.dart';

class MainMenu {
  final PostMenu _postMenu;
  final ProductMenu _productMenu;
  final UserMenu _userMenu;

  MainMenu(this._postMenu, this._productMenu, this._userMenu);

  void showMainMenu() {
    while (true) {
      print("\n===== MAIN MENU =====");
      print("1. Post Menu");
      print("2. Product Menu");
      print("3. User Menu");
      print("4. Exit");
      print("Enter your choice (1-4)");

      final choice = stdin.readLineSync();

      switch (choice) {
        case '1':
          _postMenu.showMenu();
          break;
        case '2':
          _productMenu.showMenu();
          break;
        case '3':
          _userMenu.showMenu();
          break;
        case '4':
          print('Good bye');
          exit(0);
        default:
          print("Invalid choice. Please try again.");
      }
    }
  }
}
