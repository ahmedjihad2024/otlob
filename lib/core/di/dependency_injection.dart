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
import 'package:otlob/shared/cart/data/api/cart_api_service.dart';
import 'package:otlob/shared/cart/data/data_source/cart_remote_data_source.dart';
import 'package:otlob/shared/cart/data/repository/cart_repository_impl.dart';
import 'package:otlob/shared/cart/domain/repository/cart_repository_abs.dart';
import 'package:otlob/shared/cart/domain/usecase/clear_basket_usecase.dart';
import 'package:otlob/shared/cart/domain/usecase/get_basket_usecase.dart';
import 'package:otlob/shared/cart/domain/usecase/update_basket_item_usecase.dart';
import 'package:otlob/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:otlob/features/orders/data/api/orders_api_service.dart';
import 'package:otlob/features/orders/data/data_source/orders_remote_data_source.dart';
import 'package:otlob/features/orders/data/repository/orders_repository_impl.dart';
import 'package:otlob/features/orders/domain/repository/orders_repository_abs.dart';
import 'package:otlob/features/orders/domain/usecase/create_order_usecase.dart';
import 'package:otlob/features/orders/domain/usecase/get_delivery_methods_usecase.dart';
import 'package:otlob/features/orders/domain/usecase/get_order_by_id_usecase.dart';
import 'package:otlob/features/orders/domain/usecase/get_orders_usecase.dart';
import 'package:otlob/features/orders/presentation/cubit/orders_cubit.dart';
import 'package:otlob/features/explore/presentation/cubit/explore_cubit.dart';
import 'package:otlob/features/explore_products/presentation/cubit/cubit/explor_products_cubit_cubit.dart';
import 'package:otlob/features/home/presentation/cubit/home_cubit.dart';
import 'package:otlob/features/product_details/presentation/cubit/product_details_cubit.dart';
import 'package:otlob/shared/products/data/api/products_api_service.dart';
import 'package:otlob/shared/products/data/data_source/products_remote_data_source.dart';
import 'package:otlob/shared/products/data/repository/products_repository_impl.dart';
import 'package:otlob/shared/products/domain/repository/products_repository_abs.dart';
import 'package:otlob/shared/products/domain/usecase/get_brands_usecase.dart';
import 'package:otlob/shared/products/domain/usecase/get_categories_usecase.dart';
import 'package:otlob/shared/products/domain/usecase/get_product_by_id_usecase.dart';
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
  sl.registerLazySingleton<GetProductByIdUseCase>(
    () => GetProductByIdUseCase(sl<ProductsRepositoryAbs>()),
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

  // ─── Shared Cart / Basket Feature ──────────────────────────────────────────
  // API (Retrofit)
  sl.registerLazySingleton<CartApiService>(
    () => CartApiService(sl<Dio>()),
  );

  // Data Source (Redirects to API)
  sl.registerLazySingleton<CartRemoteDataSource>(
    () => CartRemoteDataSourceImpl(sl<CartApiService>()),
  );

  // Repository
  sl.registerLazySingleton<CartRepositoryAbs>(
    () => CartRepositoryImpl(sl<CartRemoteDataSource>()),
  );

  // Use Cases
  sl.registerLazySingleton<GetBasketUseCase>(
    () => GetBasketUseCase(sl<CartRepositoryAbs>()),
  );
  sl.registerLazySingleton<UpdateBasketItemUseCase>(
    () => UpdateBasketItemUseCase(sl<CartRepositoryAbs>()),
  );
  sl.registerLazySingleton<ClearBasketUseCase>(
    () => ClearBasketUseCase(sl<CartRepositoryAbs>()),
  );

  // Cubit
  sl.registerLazySingleton<CartCubit>(
    () => CartCubit(
      sl<GetBasketUseCase>(),
      sl<UpdateBasketItemUseCase>(),
      sl<ClearBasketUseCase>(),
    ),
  );

  // ─── Home Feature ───────────────────────────────────────────────────────────
  // Cubit
  sl.registerFactory<HomeCubit>(
    () => HomeCubit(
      sl<GetProductsUseCase>(),
      sl<GetBrandsUseCase>(),
      sl<GetCategoriesUseCase>(),
    ),
  );

  // ─── Orders Feature ────────────────────────────────────────────────────────
  // API
  sl.registerLazySingleton<OrdersApiService>(
    () => OrdersApiService(sl<Dio>()),
  );

  // Data Source
  sl.registerLazySingleton<OrdersRemoteDataSource>(
    () => OrdersRemoteDataSourceImpl(sl<OrdersApiService>()),
  );

  // Repository
  sl.registerLazySingleton<OrdersRepositoryAbs>(
    () => OrdersRepositoryImpl(sl<OrdersRemoteDataSource>()),
  );

  // Use Cases
  sl.registerLazySingleton<GetOrdersUseCase>(
    () => GetOrdersUseCase(sl<OrdersRepositoryAbs>()),
  );
  sl.registerLazySingleton<GetOrderByIdUseCase>(
    () => GetOrderByIdUseCase(sl<OrdersRepositoryAbs>()),
  );
  sl.registerLazySingleton<CreateOrderUseCase>(
    () => CreateOrderUseCase(sl<OrdersRepositoryAbs>()),
  );
  sl.registerLazySingleton<GetDeliveryMethodsUseCase>(
    () => GetDeliveryMethodsUseCase(sl<OrdersRepositoryAbs>()),
  );

  // Cubit
  sl.registerFactory<OrdersCubit>(
    () => OrdersCubit(sl<GetOrdersUseCase>()),
  );

  // ─── Product Details Feature ────────────────────────────────────────────────
  // Cubit
  sl.registerFactory<ProductDetailsCubit>(
    () => ProductDetailsCubit(sl<GetProductByIdUseCase>()),
  );

  // ─── Explore Feature ────────────────────────────────────────────────────────
  sl.registerFactory<ExploreCubit>(
    () => ExploreCubit(
      sl<GetCategoriesUseCase>(),
      sl<GetBrandsUseCase>(),
    ),
  );

  // ─── Explore Products Feature ───────────────────────────────────────────────
  sl.registerFactory<ExplorProductsCubitCubit>(
    () => ExplorProductsCubitCubit(sl<GetProductsUseCase>()),
  );
}
