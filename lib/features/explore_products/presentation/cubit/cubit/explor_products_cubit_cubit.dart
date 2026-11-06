import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:otlob/core/network/error_handler/failure.dart';
import 'package:otlob/core/network/failure_message.dart';
import 'package:otlob/shared/products/data/request/get_products_request.dart';
import 'package:otlob/shared/products/domain/model/product_item.dart';
import 'package:otlob/shared/products/domain/usecase/get_products_usecase.dart';

part 'explor_products_cubit_state.dart';
part 'explor_products_cubit_cubit.freezed.dart';

class ExplorProductsCubitCubit extends Cubit<ExplorProductsCubitState> {
  ExplorProductsCubitCubit(this._getProductsUseCase)
    : super(const ExplorProductsCubitState());

  final GetProductsUseCase _getProductsUseCase;

  int? _brandId;
  int? _categoryId;

  void configure({int? brandId, int? categoryId}) {
    _brandId = brandId;
    _categoryId = categoryId;
  }

  String? _getSortQuery(int sortIndex) {
    switch (sortIndex) {
      case 1:
      case 2:
        return 'price';
      case 3:
        return 'name';
      default:
        return null;
    }
  }

  Future<ExploreLoadOutcome> getProducts({bool refresh = false}) async {
    if (isClosed) return ExploreLoadOutcome.failed;

    if (!refresh && (state.isLoadingMore || !state.hasMore)) {
      return state.hasMore
          ? ExploreLoadOutcome.success
          : ExploreLoadOutcome.noData;
    }

    if (refresh) {
      emit(
        state.copyWith(
          currentPage: 0,
          hasMore: true,
          isLoadingMore: false,
          status: ExploreProductsStatus.loading,
          errorMessage: null,
        ),
      );
    } else {
      emit(state.copyWith(isLoadingMore: true));
    }

    final nextPage = refresh ? 1 : state.currentPage + 1;
    final search = state.searchQuery.trim();

    final request = GetProductsRequest(
      pageIndex: nextPage,
      pageSize: 20,
      brandId: _brandId,
      categoryId: _categoryId,
      sort: _getSortQuery(state.selectedSortIndex),
      search: search.isNotEmpty ? search : null,
    );

    final result = await _getProductsUseCase.execute(request);
    if (isClosed) return ExploreLoadOutcome.failed;

    return result.fold(
      (failure) {
        if (refresh) {
          emit(
            state.copyWith(
              status: ExploreProductsStatus.failure,
              isLoadingMore: false,
              errorMessage: failure.message,
            ),
          );
        } else {
          emit(state.copyWith(isLoadingMore: false));
        }
        return ExploreLoadOutcome.failed;
      },
      (data) {
        emit(
          state.copyWith(
            status: ExploreProductsStatus.success,
            isLoadingMore: false,
            currentPage: nextPage,
            products: refresh ? data : [...state.products, ...data],
            hasMore: data.isNotEmpty,
            errorMessage: null,
          ),
        );
        return data.isEmpty
            ? ExploreLoadOutcome.noData
            : ExploreLoadOutcome.success;
      },
    );
  }

  Future<ExploreLoadOutcome> changeSort(int index) {
    if (state.selectedSortIndex == index) {
      return Future.value(ExploreLoadOutcome.success);
    }
    emit(state.copyWith(selectedSortIndex: index));
    return getProducts(refresh: true);
  }

  Future<ExploreLoadOutcome> search(String query) {
    emit(state.copyWith(searchQuery: query));
    return getProducts(refresh: true);
  }
}
