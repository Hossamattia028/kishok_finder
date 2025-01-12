part of "injection_container_import.dart";


final sl = GetIt.instance;

Future<void> init() async {


  /// authentication bloc and classes initial
  sl.registerFactory(() => AuthBloc(
      loginUserServiceUseCase: sl(),
      registerUserServiceUseCase: sl(),
    ));

  sl.registerLazySingleton(() => RegisterUserServiceUseCase(authServiceRepository: sl()));
  sl.registerLazySingleton(() => LoginUserServiceUseCase(authServiceRepository: sl()));

  sl.registerLazySingleton<AuthServiceRepository>(() => AuthServiceModelRepository(networkInfo: sl(), userServiceRemoteDataSource: sl()));
  sl.registerLazySingleton<AuthServiceRemoteDataSource>(() => AuthServiceRemoteDataSource());


  ///home module
  sl.registerFactory(() => HomeBloc(
    homeUseCase: sl(),
  ));
  sl.registerLazySingleton(() => HomeUseCase(homeRepository: sl()));
 
 
  sl.registerLazySingleton<HomeRepository>(() => HomeModelRepository(networkInfo: sl(), homeRemoteDataSource: sl()));
  sl.registerLazySingleton<HomeRemoteDataSource>(() => HomeRemoteDataSource(databaseRef: sl()));

  /// additional classes initial
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl());
  // sl.registerLazySingleton(() => http.Client());
  sl.registerSingleton<DatabaseReference>(FirebaseDatabase.instance.ref());
}

