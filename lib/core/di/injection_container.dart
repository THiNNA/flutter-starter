import 'package:get_it/get_it.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../network/auth_interceptor.dart';
import '../network/dio_client.dart';
import '../storage/secure_storage_helper.dart';
import '../storage/shared_prefs_helper.dart';
import '../services/connectivity_service.dart';
import '../services/notification_service.dart';
import '../services/analytics_service.dart';
import '../services/crashlytics_service.dart';

// Auth Feature
import '../../features/auth/data/datasources/auth_local_datasource.dart';
import '../../features/auth/data/datasources/auth_remote_datasource.dart';
import '../../features/auth/domain/repositories/auth_repository.dart';
import '../../features/auth/data/repositories/auth_repository_impl.dart';
import '../../features/auth/domain/usecases/login_usecase.dart';
import '../../features/auth/domain/usecases/logout_usecase.dart';
import '../../features/auth/domain/usecases/get_current_user_usecase.dart';

final sl = GetIt.instance;

Future<void> initDI() async {
  // 1. External Packages
  final sharedPrefs = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPrefs);
  sl.registerLazySingleton(() => const FlutterSecureStorage());

  // 2. Core Storage Helpers
  sl.registerLazySingleton(() => SharedPrefsHelper(sl()));
  sl.registerLazySingleton(() => SecureStorageHelper(sl()));

  // 3. Network
  sl.registerLazySingleton(() => AuthInterceptor(sl()));
  sl.registerLazySingleton(() => DioClient(sl()));

  // 4. Core Services
  sl.registerLazySingleton(() => ConnectivityService());
  sl.registerLazySingleton(() => NotificationService());
  sl.registerLazySingleton(() => AnalyticsService());
  sl.registerLazySingleton<CrashReportingService>(() => MockCrashReportingService());

  // 5. DataSources
  sl.registerLazySingleton<AuthRemoteDataSource>(() => AuthRemoteDataSourceImpl(sl()));
  sl.registerLazySingleton<AuthLocalDataSource>(() => AuthLocalDataSourceImpl(sl()));

  // 5. Repositories
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl(), sl()));

  // 6. UseCases
  sl.registerLazySingleton(() => LoginUseCase(sl()));
  sl.registerLazySingleton(() => LogoutUseCase(sl()));
  sl.registerLazySingleton(() => GetCurrentUserUseCase(sl()));
}
