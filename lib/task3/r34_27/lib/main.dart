import 'package:r34_27/features/main_menu/presentation/console/main_menu.dart';
import 'package:r34_27/features/posts/presentation/console/post_menu.dart';
import 'package:r34_27/features/products/presentation/console/product_menu.dart';
import 'package:r34_27/features/users/presentation/console/user_menu.dart';
import 'package:r34_27/features/posts/presentation/services/post_console_service.dart';
import 'package:r34_27/features/products/presentation/services/product_console_service.dart';
import 'package:r34_27/features/users/presentation/services/user_console_service.dart';
import 'injection_container.dart' as di;

void main() {
  print('Initializing Product CRUD System..');

  //initialize dependency injection
  di.init();

  print('System initialized successfully!');

  //Start Menus
  final productMenu = ProductMenu(di.sl<ProductConsoleService>());
  final postMenu = PostMenu(di.sl<PostConsoleService>());
  final userMenu = UserMenu(di.sl<UserConsoleService>());

  final mainMenu = MainMenu(postMenu, productMenu, userMenu);

  mainMenu.showMainMenu();
}
