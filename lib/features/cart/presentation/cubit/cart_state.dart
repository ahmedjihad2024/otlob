import 'package:equatable/equatable.dart';
import 'package:otlob/shared/cart/domain/model/basket_model.dart';

sealed class CartState extends Equatable {
  const CartState();

  @override
  List<Object?> get props => [];
}

final class CartInitial extends CartState {
  const CartInitial();
}

final class CartLoading extends CartState {
  const CartLoading();
}

final class CartSuccess extends CartState {
  final BasketModel basket;
  final bool isUpdating;
  final int? updatingProductId;
  final String? errorMessage;

  const CartSuccess({
    required this.basket,
    this.isUpdating = false,
    this.updatingProductId,
    this.errorMessage,
  });

  CartSuccess copyWith({
    BasketModel? basket,
    bool? isUpdating,
    int? updatingProductId,
    bool clearUpdatingProductId = false,
    String? errorMessage,
    bool clearErrorMessage = false,
  }) {
    return CartSuccess(
      basket: basket ?? this.basket,
      isUpdating: isUpdating ?? this.isUpdating,
      updatingProductId: clearUpdatingProductId
          ? null
          : (updatingProductId ?? this.updatingProductId),
      errorMessage: clearErrorMessage
          ? null
          : (errorMessage ?? this.errorMessage),
    );
  }

  @override
  List<Object?> get props => [basket, isUpdating, updatingProductId, errorMessage];
}

final class CartError extends CartState {
  final String message;

  const CartError(this.message);

  @override
  List<Object?> get props => [message];
}
