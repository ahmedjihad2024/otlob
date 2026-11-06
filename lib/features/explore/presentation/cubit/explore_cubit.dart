import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otlob/core/enums/request_state.dart';
import 'package:otlob/core/network/failure_message.dart';
import 'package:otlob/core/usecase/base.dart';
import 'package:otlob/features/explore/presentation/cubit/explore_state.dart';
import 'package:otlob/shared/products/domain/model/brand_item.dart';
import 'package:otlob/shared/products/domain/model/category_item.dart';
import 'package:otlob/shared/products/domain/usecase/get_brands_usecase.dart';
import 'package:otlob/shared/products/domain/usecase/get_categories_usecase.dart';

class ExploreCubit extends Cubit<ExploreState> {
  final GetCategoriesUseCase _getCategoriesUseCase;
  final GetBrandsUseCase _getBrandsUseCase;

  ExploreCubit(
    this._getCategoriesUseCase,
    this._getBrandsUseCase,
  ) : super(const ExploreState());

  Future<void> loadExploreData() async {
    emit(state.copyWith(status: RequestState.loading));

    final results = await Future.wait([
      _getCategoriesUseCase.execute(const NoParams()),
      _getBrandsUseCase.execute(const NoParams()),
    ]);

    final categoriesResult = results[0];
    final brandsResult = results[1];

    List<CategoryItem> categories = [];
    List<BrandItem> brands = [];
    String? error;

    categoriesResult.fold(
      (failure) => error = failure.message,
      (data) => categories = data as List<CategoryItem>,
    );

    brandsResult.fold(
      (failure) => error ??= failure.message,
      (data) => brands = data as List<BrandItem>,
    );

    if (categories.isEmpty && brands.isEmpty && error != null) {
      emit(state.copyWith(
        status: RequestState.error,
        errorMessage: error,
      ));
    } else {
      emit(state.copyWith(
        status: RequestState.success,
        categories: categories,
        brands: brands,
      ));
    }
  }
}

