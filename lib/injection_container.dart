import 'package:http/http.dart' as http;
import 'package:get_it/get_it.dart';
import 'package:proyect_clean/detail/data/datasources/detail_remote_datasource.dart';
import 'package:proyect_clean/detail/data/repository/detail_repository_imp.dart';
import 'package:proyect_clean/detail/domain/repositories/detail_repository.dart';
import 'package:proyect_clean/detail/domain/usecases/get_detail_user.dart';
import 'package:proyect_clean/detail/presentation/cubit/detail_cubit.dart';
import 'package:proyect_clean/users/data/datasources/users_remote_datasource.dart';
import 'package:proyect_clean/users/data/repository/users_repository_impl.dart';
import 'package:proyect_clean/users/domain/repositories/users_repository.dart';
import 'package:proyect_clean/users/domain/usecases/get_list_users.dart';

import 'package:proyect_clean/users/presentation/cubit/users_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  await initUsers();
}

Future<void> initUsers() async {
  //! Features - user
  // Cubit users
  sl.registerFactory(() => UsersCubit(sl()));

  // use cases users
  sl.registerLazySingleton(() => GetListUser(sl()));

  // Repository users
  sl.registerLazySingleton<UsersRepository>(() => UsersRepositpryImpl(sl()));

  // Data sources users
  sl.registerLazySingleton<UsersRemoteDataSource>(
      () => UsersRemoteDataSourceImpl(sl()));

  //! Features - detail
  // Cubit users
  sl.registerFactory(() => DetailCubit(sl()));

  // use cases users
  sl.registerLazySingleton(() => GetDetailUser(sl()));

  // Repository users
  sl.registerLazySingleton<DetailRepository>(() => DetailRepositpryImpl(sl()));

  // Data sources users
  sl.registerLazySingleton<DetailRemoteDataSource>(
      () => DetailRemoteDataSourceImpl(sl()));

  //! External
  sl.registerLazySingleton(() => http.Client());
}
