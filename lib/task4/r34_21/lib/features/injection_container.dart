import 'package:get_it/get_it.dart';
import 'package:r34_21/core/network/api_provider.dart';
import 'package:r34_21/core/network/http_provider.dart';
import 'package:r34_21/features/posts/data/datasurces/post_remote_datasourse.dart';

// ================== POSTS ==================

import 'package:r34_21/features/posts/data/repositories/post_repository_impl.dart';
import 'package:r34_21/features/posts/domain/repositories/post_repository.dart';
import 'package:r34_21/features/posts/domain/usecase/create_post.dart';
import 'package:r34_21/features/posts/domain/usecase/delete_post.dart';
import 'package:r34_21/features/posts/domain/usecase/get_all_post.dart';
import 'package:r34_21/features/posts/domain/usecase/get_post.dart';
import 'package:r34_21/features/posts/domain/usecase/update_post.dart';
import 'package:r34_21/features/posts/presentation/services/post_console_services.dart';
import 'package:r34_21/features/products/data/datasurces/product_remote_datasourse.dart';

// ================== PRODUCTS ==================

import 'package:r34_21/features/products/data/repositories/product_repository_impl.dart';
import 'package:r34_21/features/products/domain/repositories/product_repositories.dart';
import 'package:r34_21/features/products/domain/usecase/create_product.dart';
import 'package:r34_21/features/products/domain/usecase/delete_product.dart';
import 'package:r34_21/features/products/domain/usecase/get_all_product.dart';
import 'package:r34_21/features/products/domain/usecase/get_product.dart';
import 'package:r34_21/features/products/domain/usecase/update_product.dart';
import 'package:r34_21/features/products/presentation/services/product_console_services.dart';
import 'package:r34_21/features/users/data/datasurces/user_remote_datasourse.dart';

// ================== USERS ==================

import 'package:r34_21/features/users/data/repositories/user_repository_impl.dart';
import 'package:r34_21/features/users/domain/repositories/user_repositories.dart';
import 'package:r34_21/features/users/domain/usecase/create_user.dart';
import 'package:r34_21/features/users/domain/usecase/delete_user.dart';
import 'package:r34_21/features/users/domain/usecase/get_all_user.dart';
import 'package:r34_21/features/users/domain/usecase/get_user.dart';
import 'package:r34_21/features/users/domain/usecase/update_user.dart';
import 'package:r34_21/features/users/presentation/services/post_console_services.dart';


final sl = GetIt.instance;

void init() {
  // ====================================================
  // COMMON
  sl.registerLazySingleton<ApiProvider>(() => HttpProvider());

  // ====================================================
  // PRODUCTS

  sl.registerLazySingleton<ProductRemoteDatasource>(
    () => ProductRemoteDatasourceImpl(apiProvider: sl()),
  );

  sl.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(remoteDatasource: sl()),
  );

  sl.registerLazySingleton(() => GetAllProducts(sl()));
  sl.registerLazySingleton(() => GetProduct(sl()));
  sl.registerLazySingleton(() => CreateProduct(sl()));
  sl.registerLazySingleton(() => UpdateProduct(sl()));
  sl.registerLazySingleton(() => DeleteProduct(sl()));

  sl.registerLazySingleton(
    () => ProductConsoleService(
      getAllProductsUseCase: sl(),
      getProductUseCase: sl(),
      createProductUseCase: sl(),
      updateProductUseCase: sl(),
      deleteProductUseCase: sl(),
    ),
  );

  // ====================================================
  // USERS

  sl.registerLazySingleton<UserRemoteDataSources>(
    () => UserRemoteDataSourcesImpl(apiProvider: sl()),
  );

  sl.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(remoteDatasource: sl()),
  );

  sl.registerLazySingleton(() => GetAllUser(sl()));
  sl.registerLazySingleton(() => GetUser(sl()));
  sl.registerLazySingleton(() => CreateUser(sl()));
  sl.registerLazySingleton(() => UpdateUser(sl()));
  sl.registerLazySingleton(() => DeleteUser(sl()));

  sl.registerLazySingleton(
    () => UserConsoleService(
      getAllUserUsecase: sl(),
      getUserUsecase: sl(),
      createUserUsecase: sl(),
      updateUserUsecase: sl(),
      deleteUserUsecase: sl(),
    ),
  );

  // ====================================================
  // POSTS

  sl.registerLazySingleton<PostRemoteDatasource>(
    () => PostRemoteDatasourceImpl(apiProvider: sl()),
  );

  sl.registerLazySingleton<PostRepository>(
    () => PostRepositoryImpl(remoteDatasource: sl()),
  );

  sl.registerLazySingleton(() => GetAllPost(sl()));
  sl.registerLazySingleton(() => GetPost(sl()));
  sl.registerLazySingleton(() => CreatePost(sl()));
  sl.registerLazySingleton(() => UpdatePost(sl()));
  sl.registerLazySingleton(() => DeletePost(sl()));

  sl.registerLazySingleton(
    () => PostConsoleService(
      getAllPostUseCase: sl(),
      getPostUseCase: sl(),
      createPostUseCase: sl(),
      updatePostUseCase: sl(),
      deletePostUseCase: sl(),
    ),
  );
}