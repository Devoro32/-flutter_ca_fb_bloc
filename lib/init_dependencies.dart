import 'package:ca_firebase_app/export.dart';

GetIt getIt = GetIt.instance;

Future<void> initializeDependencies() async {
  //TODO: Should we separate this by features?
  //1. Services
  getIt.registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImpl());
  //2.Repository
  getIt.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  //3usecases
  getIt.registerSingleton<AuthGetUserUseCase>(AuthGetUserUseCase());

  //!DB
}
/*
final sl = GetIt.instance;

Future<void> init() async {
  sl
    // App Logic
    ..registerFactory(() => AuthenticationCubit(
          createUser: sl(),
          getUsers: sl(),
        ))

    // Use cases
    ..registerLazySingleton(() => CreateUser(sl()))
    ..registerLazySingleton(() => GetUsers(sl()))

    // Repositories
    ..registerLazySingleton<AuthenticationRepository>(
        () => AuthenticationRepositoryImplementation(sl()))

    // Data Sources
    ..registerLazySingleton<AuthenticationRemoteDataSource>(
        () => AuthRemoteDataSrcImpl(sl()))

    // External Dependencies
    ..registerLazySingleton(http.Client.new);
}




*/