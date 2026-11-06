import 'package:dartz/dartz.dart';
import 'package:otlob/core/network/error_handler/failure.dart';
import 'package:otlob/shared/cart/data/request/update_basket_request.dart';
import 'package:otlob/shared/cart/domain/model/basket_model.dart';

abstract class CartRepositoryAbs {
  Future<Either<Failure, BasketModel>> getBasket();
  Future<Either<Failure, BasketModel>> updateBasketItem(
    UpdateBasketRequest request,
  );
  Future<Either<Failure, Unit>> deleteBasket();
}
