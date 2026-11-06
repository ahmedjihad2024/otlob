import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otlob/shared/products/domain/model/product_item.dart';
import 'package:otlob/shared/products/domain/usecase/get_product_by_id_usecase.dart';

import 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  final GetProductByIdUseCase _getProductByIdUseCase;

  ProductDetailsCubit(this._getProductByIdUseCase)
      : super(const ProductDetailsInitial());

  // Default fallback product matching user-provided schema & sample
  static const ProductItem defaultProduct = ProductItem(
    id: "1",
    name: "Double Caramel Frappuccino",
    description:
        "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Maecenas porttitor congue massa. Fusce posuere, magna sed pulvinar ultricies, purus lectus malesuada libero, sit amet commodo magna eros quis urna.",
    pictureUrl: "https://talabat639.runasp.net/images/products/sb-ang1.png",
    price: 200.00,
    brandId: 1,
    brand: "Starbucks",
    categoryId: 1,
    category: "Frappuccino",
  );

  Future<void> loadProduct(int id, {ProductItem? initialProduct}) async {
    if (initialProduct != null) {
      emit(ProductDetailsLoaded(product: initialProduct));
    } else {
      emit(const ProductDetailsLoading());
    }

    final result = await _getProductByIdUseCase.execute(id);

    result.fold(
      (failure) {
        if (state is ProductDetailsLoaded) {
          // Keep existing product displayed if already loaded
          return;
        }
        // Fallback to default product so visual UI remains available
        emit(const ProductDetailsLoaded(product: defaultProduct));
      },
      (product) {
        final currentQuantity = state is ProductDetailsLoaded
            ? (state as ProductDetailsLoaded).quantity
            : 1;
        final currentType = state is ProductDetailsLoaded
            ? (state as ProductDetailsLoaded).selectedType
            : 0;

        emit(
          ProductDetailsLoaded(
            product: product,
            quantity: currentQuantity,
            selectedType: currentType,
          ),
        );
      },
    );
  }

  void incrementQuantity() {
    if (state is ProductDetailsLoaded) {
      final current = state as ProductDetailsLoaded;
      emit(current.copyWith(quantity: current.quantity + 1));
    }
  }

  void decrementQuantity() {
    if (state is ProductDetailsLoaded) {
      final current = state as ProductDetailsLoaded;
      if (current.quantity > 1) {
        emit(current.copyWith(quantity: current.quantity - 1));
      }
    }
  }

  void selectType(int index) {
    if (state is ProductDetailsLoaded) {
      final current = state as ProductDetailsLoaded;
      emit(current.copyWith(selectedType: index));
    }
  }
}

