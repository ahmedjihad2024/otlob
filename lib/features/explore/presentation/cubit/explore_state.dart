import 'package:otlob/core/enums/request_state.dart';
import 'package:otlob/shared/products/domain/model/brand_item.dart';
import 'package:otlob/shared/products/domain/model/category_item.dart';

class ExploreState {
  final RequestState status;
  final List<CategoryItem> categories;
  final List<BrandItem> brands;
  final String? errorMessage;

  const ExploreState({
    this.status = RequestState.idle,
    this.categories = const [],
    this.brands = const [],
    this.errorMessage,
  });

  bool get isLoading => status.isLoading;
  bool get isSuccess => status.isSuccess;
  bool get isError => status.isError;

  ExploreState copyWith({
    RequestState? status,
    List<CategoryItem>? categories,
    List<BrandItem>? brands,
    String? errorMessage,
  }) {
    return ExploreState(
      status: status ?? this.status,
      categories: categories ?? this.categories,
      brands: brands ?? this.brands,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

