import 'package:get_it/get_it.dart';

import 'auth/auth_repository.dart';
import 'auth/auth_repository_impl.dart';
import 'api/api_client.dart';

/// Global service locator instance
/// Usage in the app:as
///   final authRepo = getIt<AuthRepository>();
final getIt = GetIt.instance;

/// Call once in [main] before [runApp]
void setupServiceLocator() {
  // registerLazySingleton: instance created on first access, then cached.
  getIt.registerLazySingleton<ApiClient>(() => ApiClient());

  // DI principle, callers depend on the contract, not on impl
  getIt.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl());
}