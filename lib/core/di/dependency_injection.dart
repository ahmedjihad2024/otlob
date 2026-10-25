import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:otlob/core/network/dio_factory.dart';
import 'package:otlob/core/services/storage_services/secure_storage_service.dart';
import 'package:otlob/core/services/storage_services/shared_prefrences_service.dart';
import 'package:otlob/core/services/storage_services/storage_service.dart';
import 'package:otlob/core/ui_kit/overlay_loading/overlay_loading_manager.dart';
import 'package:otlob/core/utils/snackbar_helper.dart';
import 'package:otlob/features/home/data/api/api.dart';
import 'package:otlob/features/home/data/data_source/home_remote_data_source.dart';
import 'package:otlob/features/home/data/repository/home_repository_impl.dart';
import 'package:otlob/features/home/domain/repository/home_repository_abs.dart';
import 'package:otlob/features/sign_in/data/api/sign_in_api_services.dart';
import 'package:otlob/features/sign_in/data/data_source/sign_in_remote_data_source.dart';
import 'package:otlob/features/sign_in/data/repository/sign_in_repository_impl.dart';
import 'package:otlob/features/sign_in/domain/repository/sign_in_repository_abs.dart';
import 'package:otlob/features/sign_in/domain/usecase/sign_in_usecase.dart';
import 'package:otlob/features/sign_up/data/api/sign_up_api_services.dart';
import 'package:otlob/features/sign_up/data/data_source/sign_up_remote_data_source.dart';
import 'package:otlob/features/sign_up/data/repository/sign_up_repository_impl.dart';
import 'package:otlob/features/sign_up/domain/repository/sign_up_repository_abs.dart';
import 'package:otlob/features/sign_up/domain/usecase/sign_up_usecase.dart';
import 'package:otlob/shared/products/data/api/products_api_service.dart';
import 'package:otlob/shared/products/data/data_source/products_remote_data_source.dart';
import 'package:otlob/shared/products/data/repository/products_repository_impl.dart';
import 'package:otlob/shared/products/domain/repository/products_repository_abs.dart';
import 'package:otlob/shared/products/domain/usecase/get_brands_usecase.dart';
import 'package:otlob/shared/products/domain/usecase/get_categories_usecase.dart';
import 'package:otlob/shared/products/domain/usecase/get_products_usecase.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GetIt sl = GetIt.instance;

Future<void> setupServiceLocator() async {
  // ─── Storage Services ────────────────────────────────────────────────────────
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
  sl.registerLazySingleton<SecureStorageService>(() => SecureStorageService());
  sl.registerLazySingleton<SharedPrefsService>(
    () => SharedPrefsService(sl<SharedPreferences>()),
  );
  sl.registerLazySingleton<StorageService>(
    () => StorageService(sl<SecureStorageService>(), sl<SharedPrefsService>()),
  );

  // ─── Dio (Using DioFactory buildDio) ─────────────────────────────────────────
  sl.registerLazySingleton<Dio>(() => buildDio(sl<StorageService>()));

  // ─── Core UI Helpers ────────────────────────────────────────────────────────
  sl.registerLazySingleton<SnackbarHelper>(() => SnackbarHelper());
  sl.registerLazySingleton<LoadingManager>(() => OverlayLoadingManager());

  // ─── Shared Products Feature ────────────────────────────────────────────────
  // API (Retrofit)
  sl.registerLazySingleton<ProductsApiService>(
    () => ProductsApiService(sl<Dio>()),
  );

  // Data Source (Redirects to API)
  sl.registerLazySingleton<ProductsRemoteDataSource>(
    () => ProductsRemoteDataSourceImpl(sl<ProductsApiService>()),
  );

  // Repository
  sl.registerLazySingleton<ProductsRepositoryAbs>(
    () => ProductsRepositoryImpl(sl<ProductsRemoteDataSource>()),
  );

  // Use Cases
  sl.registerLazySingleton<GetProductsUseCase>(
    () => GetProductsUseCase(sl<ProductsRepositoryAbs>()),
  );
  sl.registerLazySingleton<GetBrandsUseCase>(
    () => GetBrandsUseCase(sl<ProductsRepositoryAbs>()),
  );
  sl.registerLazySingleton<GetCategoriesUseCase>(
    () => GetCategoriesUseCase(sl<ProductsRepositoryAbs>()),
  );

  // ─── Home Feature ───────────────────────────────────────────────────────────
  // API (Retrofit)
  sl.registerLazySingleton<HomeApiService>(() => HomeApiService(sl<Dio>()));

  // Data Source (Redirects to API)
  sl.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSourceImpl(sl<HomeApiService>()),
  );

  // Repository
  sl.registerLazySingleton<HomeRepositoryAbs>(
    () => HomeRepositoryImpl(sl<HomeRemoteDataSource>()),
  );

  // ─── Sign Up Feature ────────────────────────────────────────────────
  // API (Retrofit)
  sl.registerLazySingleton<SignUpApiService>(() => SignUpApiService(sl<Dio>()));

  // Data Source (Redirects to API)
  sl.registerLazySingleton<SignUpRemoteDataSource>(
    () => SignUpRemoteDataSourceImpl(sl<SignUpApiService>()),
  );

  // Repository
  sl.registerLazySingleton<SignUpRepositoryAbs>(
    () => SignUpRepositoryImpl(sl<SignUpRemoteDataSource>()),
  );

  // Use Cases
  sl.registerLazySingleton<SignUpUseCase>(
    () => SignUpUseCase(sl<SignUpRepositoryAbs>()),
  );

  // ─── Sign In Feature ────────────────────────────────────────────────
  // API (Retrofit)
  sl.registerLazySingleton<SignInApiService>(() => SignInApiService(sl<Dio>()));

  // Data Source (Redirects to API)
  sl.registerLazySingleton<SignInRemoteDataSource>(
    () => SignInRemoteDataSourceImpl(sl<SignInApiService>()),
  );

  // Repository
  sl.registerLazySingleton<SignInRepositoryAbs>(
    () => SignInRepositoryImpl(sl<SignInRemoteDataSource>()),
  );

  // Use Cases
  sl.registerLazySingleton<SignInUseCase>(
    () => SignInUseCase(sl<SignInRepositoryAbs>()),
  );
}
