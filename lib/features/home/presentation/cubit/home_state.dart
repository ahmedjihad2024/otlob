import 'package:equatable/equatable.dart';
import 'package:otlob/core/enums/request_state.dart';
import 'package:otlob/shared/products/domain/model/brand_item.dart';
import 'package:otlob/shared/products/domain/model/category_item.dart';
import 'package:otlob/shared/products/domain/model/product_item.dart';

enum HomeLoadOutcome { success, noData, failed }

class HomeState extends Equatable {
  final RequestState status;
  final List<ProductItem> products;
  final List<BrandItem> brands;
  final List<CategoryItem> categories;
  final String? errorMessage;

  const HomeState({
    this.status = RequestState.idle,
    this.products = const [],
    this.brands = const [],
    this.categories = const [],
    this.errorMessage,
  });

  HomeState copyWith({
    RequestState? status,
    List<ProductItem>? products,
    List<BrandItem>? brands,
    List<CategoryItem>? categories,
    String? errorMessage,
    bool clearError = false,
  }) {
    return HomeState(
      status: status ?? this.status,
      products: products ?? this.products,
      brands: brands ?? this.brands,
      categories: categories ?? this.categories,
      errorMessage: clearError ? null : (errorMessage ?? this.errorMessage),
    );
  }

  @override
  List<Object?> get props => [
        status,
        products,
        brands,
        categories,
        errorMessage,
      ];
}

