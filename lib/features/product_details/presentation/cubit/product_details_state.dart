import 'package:otlob/shared/products/domain/model/product_item.dart';

sealed class ProductDetailsState {
  const ProductDetailsState();
}

class ProductDetailsInitial extends ProductDetailsState {
  const ProductDetailsInitial();
}

class ProductDetailsLoading extends ProductDetailsState {
  const ProductDetailsLoading();
}

class ProductDetailsLoaded extends ProductDetailsState {
  final ProductItem product;
  final int quantity;
  final int selectedType;

  const ProductDetailsLoaded({
    required this.product,
    this.quantity = 1,
    this.selectedType = 0,
  });

  ProductDetailsLoaded copyWith({
    ProductItem? product,
    int? quantity,
    int? selectedType,
  }) {
    return ProductDetailsLoaded(
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
      selectedType: selectedType ?? this.selectedType,
    );
  }
}

class ProductDetailsError extends ProductDetailsState {
  final String message;
  const ProductDetailsError(this.message);
}

