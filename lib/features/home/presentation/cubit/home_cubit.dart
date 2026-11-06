import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otlob/core/enums/request_state.dart';
import 'package:otlob/core/network/failure_message.dart';
import 'package:otlob/core/usecase/base.dart';
import 'package:otlob/shared/products/data/request/get_products_request.dart';
import 'package:otlob/shared/products/domain/model/brand_item.dart';
import 'package:otlob/shared/products/domain/model/category_item.dart';
import 'package:otlob/shared/products/domain/model/product_item.dart';
import 'package:otlob/shared/products/domain/usecase/get_brands_usecase.dart';
import 'package:otlob/shared/products/domain/usecase/get_categories_usecase.dart';
import 'package:otlob/shared/products/domain/usecase/get_products_usecase.dart';

import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetProductsUseCase _getProductsUseCase;
  final GetBrandsUseCase _getBrandsUseCase;
  final GetCategoriesUseCase _getCategoriesUseCase;

  HomeCubit(
    this._getProductsUseCase,
    this._getBrandsUseCase,
    this._getCategoriesUseCase,
  ) : super(const HomeState());

  Future<HomeLoadOutcome> getHomeData({bool refresh = false}) async {
    if (isClosed) return HomeLoadOutcome.failed;

    if (!refresh && state.status.isLoading) {
      return HomeLoadOutcome.success;
    }

    emit(state.copyWith(status: RequestState.loading, clearError: true));

    final results = await Future.wait([
      _getProductsUseCase.execute(const GetProductsRequest(pageSize: 4)),
      _getBrandsUseCase.execute(const NoParams()),
      _getCategoriesUseCase.execute(const NoParams()),
    ]);

    if (isClosed) return HomeLoadOutcome.failed;

    List<ProductItem> newProducts = state.products;
    List<BrandItem> newBrands = state.brands;
    List<CategoryItem> newCategories = state.categories;
    String? errorMessage;

    results[0].fold(
      (failure) => errorMessage = failure.message,
      (data) => newProducts = data as List<ProductItem>,
    );
    results[1].fold(
      (failure) => errorMessage ??= failure.message,
      (data) => newBrands = data as List<BrandItem>,
    );
    results[2].fold(
      (failure) => errorMessage ??= failure.message,
      (data) => newCategories = data as List<CategoryItem>,
    );

    final bool hasData =
        newProducts.isNotEmpty ||
        newBrands.isNotEmpty ||
        newCategories.isNotEmpty;

    if (!hasData && errorMessage != null) {
      emit(
        state.copyWith(status: RequestState.error, errorMessage: errorMessage),
      );
      return HomeLoadOutcome.failed;
    }

    emit(
      state.copyWith(
        status: RequestState.success,
        products: newProducts,
        brands: newBrands,
        categories: newCategories,
        errorMessage: errorMessage,
      ),
    );

    return hasData ? HomeLoadOutcome.success : HomeLoadOutcome.noData;
  }
}
