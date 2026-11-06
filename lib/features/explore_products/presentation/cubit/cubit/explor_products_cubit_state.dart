part of 'explor_products_cubit_cubit.dart';

enum ExploreProductsStatus { initial, loading, success, failure }

enum ExploreLoadOutcome { success, noData, failed }

@freezed
abstract class ExplorProductsCubitState with _$ExplorProductsCubitState {
  const factory ExplorProductsCubitState({
    @Default(ExploreProductsStatus.initial) ExploreProductsStatus status,
    @Default([]) List<ProductItem> products,
    @Default(0) int currentPage,
    @Default(true) bool hasMore,
    @Default(false) bool isLoadingMore,
    @Default(0) int selectedSortIndex,
    @Default('') String searchQuery,
    String? errorMessage,
  }) = _ExplorProductsCubitState;
}
