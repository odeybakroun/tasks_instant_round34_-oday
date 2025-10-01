import 'package:get_it/get_it.dart';
import 'package:r34_27/features/posts/data/datasources/post_remote_datasource.dart';
import 'package:r34_27/features/posts/data/repositories/post_repository_impl.dart';
import 'package:r34_27/features/posts/domain/repositories/post_repository.dart';
import 'package:r34_27/features/posts/domain/usecases/create_post.dart';
import 'package:r34_27/features/posts/domain/usecases/delete_post.dart';
import 'package:r34_27/features/posts/domain/usecases/get_all_posts.dart';
import 'package:r34_27/features/posts/domain/usecases/get_post.dart';
import 'package:r34_27/features/posts/domain/usecases/update_post.dart';
import 'package:r34_27/features/posts/presentation/services/post_console_service.dart';
import 'package:r34_27/features/products/data/datasources/product_remote_datasource.dart';
import 'package:r34_27/features/products/data/repositories/product_repository_impl.dart';
import 'package:r34_27/features/products/domain/repositories/product_repository.dart';
import 'package:r34_27/features/products/domain/usecases/create_product.dart';
import 'package:r34_27/features/products/domain/usecases/delete_product.dart';
import 'package:r34_27/features/products/domain/usecases/get_all_products.dart';
import 'package:r34_27/features/products/domain/usecases/get_product.dart';
import 'package:r34_27/features/products/domain/usecases/update_product.dart';
import 'package:r34_27/features/products/presentation/services/product_console_service.dart';
import 'package:r34_27/features/users/data/datasources/user_remote_datasource.dart';
import 'package:r34_27/features/users/data/repositories/user_repository_impl.dart';
import 'package:r34_27/features/users/domain/repositories/user_repository.dart';
import 'package:r34_27/features/users/domain/usecases/create_user.dart';
import 'package:r34_27/features/users/domain/usecases/delete_user.dart';
import 'package:r34_27/features/users/domain/usecases/get_all_users.dart';
import 'package:r34_27/features/users/domain/usecases/get_user.dart';
import 'package:r34_27/features/users/domain/usecases/update_user.dart';
import 'package:r34_27/features/users/presentation/services/user_console_service.dart';

final sl = GetIt.instance;
void init() {
  
  //Product Data Source
  sl.registerLazySingleton<ProductRemoteDatasource>(
    () => ProductRemoteDatasourceImpl(),
  );

  // Product Repository
  sl.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(remoteDatasource: sl()),
  );

  //Prodict Use Case
  sl.registerLazySingleton<GetAllProducts>(() => GetAllProducts(sl()));
  sl.registerLazySingleton<GetProduct>(() => GetProduct(sl()));
  sl.registerLazySingleton<CreateProduct>(() => CreateProduct(sl()));
  sl.registerLazySingleton<UpdateProduct>(() => UpdateProduct(sl()));
  sl.registerLazySingleton<DeleteProduct>(() => DeleteProduct(sl()));

  //Product Service
  sl.registerLazySingleton<ProductConsoleService>(
    () => ProductConsoleService(
      createProductUseCase: sl(),
      deleteProductUseCase: sl(),
      getAllProductsUseCase: sl(),
      getProductUseCase: sl(),
      updateProductUseCase: sl(),
    ),
  );

  
  // User DataSource
  sl.registerLazySingleton<UserRemoteDataSource>(
    () => UserRemoteDataSourceImpl(),
  );

  //User Repository
  sl.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(userRemoteDataSource: sl()),
  );

  // User UseCases
  sl.registerLazySingleton<GetAllUsers>(() => GetAllUsers(sl()));
  sl.registerLazySingleton<GetUser>(() => GetUser(sl()));
  sl.registerLazySingleton<CreateUser>(() => CreateUser(sl()));
  sl.registerLazySingleton<UpdateUser>(() => UpdateUser(sl()));
  sl.registerLazySingleton<DeleteUser>(() => DeleteUser(sl()));

  //User Service
  sl.registerLazySingleton<UserConsoleService>(
    () => UserConsoleService(
      createUserUseCase: sl(),
      deleteUserUseCase: sl(),
      getAllUsersUseCase: sl(),
      getUserUseCase: sl(),
      updateUserUseCase: sl(),
    ),
  );

  //Post DataSource
  sl.registerLazySingleton<PostRemoteDataSource>(
    () => PostRemoteDataSourceImpl(),
  );

  // post Repository
  sl.registerLazySingleton<PostRepository>(
    () => PostRepositoryImpl(postRemoteDataSource: sl()),
  );

  // post UseCases
  sl.registerLazySingleton<GetAllPosts>(() => GetAllPosts(sl()));
  sl.registerLazySingleton<GetPost>(() => GetPost(sl()));
  sl.registerLazySingleton<CreatePost>(() => CreatePost(sl()));
  sl.registerLazySingleton<UpdatePost>(() => UpdatePost(sl()));
  sl.registerLazySingleton<DeletePost>(() => DeletePost(sl()));

  // Post Service
  sl.registerLazySingleton<PostConsoleService>(
    () => PostConsoleService(
      createPostUseCase: sl(),
      deletePostUseCase: sl(),
      getAllPostsUseCase: sl(),
      getPostUseCase: sl(),
      updatePostUseCase: sl(),
    ),
  );
}
