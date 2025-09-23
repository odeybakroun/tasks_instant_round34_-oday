import 'package:get_it/get_it.dart';
import 'package:task3/features/posts/data/datasources/post_remote_datasource.dart';
import 'package:task3/features/posts/data/repositories/post_repository_impl.dart';
import 'package:task3/features/posts/domain/repositories/posts_repository.dart';
import 'package:task3/features/posts/domain/usecase/create_posts.dart';
import 'package:task3/features/posts/domain/usecase/delete_posts.dart';
import 'package:task3/features/posts/domain/usecase/get_all_posts.dart';
import 'package:task3/features/posts/domain/usecase/get_posts.dart';
import 'package:task3/features/posts/domain/usecase/update_posts.dart';
import 'package:task3/features/posts/presentation/services/post_console_service.dart';
import 'package:task3/features/product/data/datasources/product_remote_datasource.dart';
import 'package:task3/features/product/data/repositories/product_repository_impl.dart';
import 'package:task3/features/product/domain/repositories/product_repository.dart';
import 'package:task3/features/product/domain/usecase/create_product.dart';
import 'package:task3/features/product/domain/usecase/delete_product.dart';
import 'package:task3/features/product/domain/usecase/get_all_product.dart';
import 'package:task3/features/product/domain/usecase/get_product.dart';
import 'package:task3/features/product/domain/usecase/update_product.dart';
import 'package:task3/features/product/presentation/services/product_console_service.dart';
import 'package:task3/features/user/data/datasources/user_remote_datesources.dart';
import 'package:task3/features/user/data/repositories/user_repository_impl.dart';
import 'package:task3/features/user/domin/repositories/user_repository.dart';
import 'package:task3/features/user/domin/usecase/create_user.dart';
import 'package:task3/features/user/domin/usecase/delete_user.dart';
import 'package:task3/features/user/domin/usecase/get_all_user.dart';
import 'package:task3/features/user/domin/usecase/get_user.dart';
import 'package:task3/features/user/domin/usecase/update_user.dart';
import 'package:task3/features/user/presentation/services/use_console_service.dart';

final sl = GetIt.instance;

void init() {
  // Data sources
  sl.registerLazySingleton<ProductRemoteDatasource>(
    () => ProductRemoteDatasourceImpl(),
  );
  sl.registerLazySingleton<UserRemoteDatesources>(
    () => UserRemoteDatesourcesImbl(),
  );
  sl.registerLazySingleton<PostRemoteDatasource>(
    () => PostRemoteDataSourceImpl(),
  );

  // Repository
  sl.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(remoteDatasource: sl()),
  );
   sl.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(remoteDataSource: sl()),
  );
  sl.registerLazySingleton<PostRepository>(
    () => PostRepoImplment(remoteDatasource: sl()),
  );

  // Use cases - Product
  sl.registerLazySingleton(() => GetAllProducts(sl()));
  sl.registerLazySingleton(() => GetProduct(sl()));
  sl.registerLazySingleton(() => CreateProduct(sl()));
  sl.registerLazySingleton(() => UpdateProduct(sl()));
  sl.registerLazySingleton(() => DeleteProduct(sl()));

  // Use cases - User
  sl.registerLazySingleton(() => GetAllUsers(sl()));
  sl.registerLazySingleton(() => GetUser(sl()));
  sl.registerLazySingleton(() => CreateUser(sl()));
  sl.registerLazySingleton(() => UpdateUser(sl()));
  sl.registerLazySingleton(() => DeleteUser(sl()));

  // Use cases - Post
  sl.registerLazySingleton(() => GetAllPosts(sl()));
  sl.registerLazySingleton(() => GetPost(sl()));
  sl.registerLazySingleton(() => CreatePost(sl()));
  sl.registerLazySingleton(() => UpdatePost(sl()));
  sl.registerLazySingleton(() => DeletePost(sl()));

  // Services - products
  sl.registerLazySingleton(
    () => ProductConsoleService(
      getAllProductsUseCase: sl(),
      getProductUseCase: sl(),
      createProductUseCase: sl(),
      updateProductUseCase: sl(),
      deleteProductUseCase: sl(),
    ),
  );

  // Services - users
  sl.registerLazySingleton(
    () => UserConsoleService(
      getAllUsersUseCase: sl(),
      getUserUseCase: sl(),
      createUserUseCase: sl(),
      updateUserUseCase: sl(),
      deleteUserUseCase: sl(),
    ),
  );

  // Services - posts
  sl.registerLazySingleton(
    () => PostConsoleService(
      getAllPostsUseCase: sl(),
      getPostUseCase: sl(),
      createPostUseCase: sl(),
      updatePostUseCase: sl(),
      deletePostUseCase: sl(),
    ),
  );
}
