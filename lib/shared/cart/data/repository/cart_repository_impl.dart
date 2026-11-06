import 'package:dartz/dartz.dart';
import 'package:otlob/core/network/error_handler/error_handler.dart';
import 'package:otlob/core/network/error_handler/failure.dart';
import 'package:otlob/core/network/failure_message.dart';
import 'package:otlob/shared/cart/data/data_source/cart_remote_data_source.dart';
import 'package:otlob/shared/cart/data/mapper/cart_mapper.dart';
import 'package:otlob/shared/cart/data/request/update_basket_request.dart';
import 'package:otlob/shared/cart/data/responses/basket_response.dart';
import 'package:otlob/shared/cart/domain/model/basket_model.dart';
import 'package:otlob/shared/cart/domain/repository/cart_repository_abs.dart';

class CartRepositoryImpl implements CartRepositoryAbs {
  final CartRemoteDataSource _remoteDataSource;

  CartRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, BasketModel>> getBasket() {
    return fastHandler<BasketResponse, BasketModel>(
      request: () => _remoteDataSource.getBasket(),
      mapper: (response) => response.toDomain(),
    );
  }

  @override
  Future<Either<Failure, BasketModel>> updateBasketItem(
    UpdateBasketRequest request,
  ) {
    return fastHandler<BasketResponse, BasketModel>(
      request: () => _remoteDataSource.updateBasket(request),
      mapper: (response) => response.toDomain(),
    );
  }

  @override
  Future<Either<Failure, Unit>> deleteBasket() {
    return fastHandler<void, Unit>(
      request: () => _remoteDataSource.deleteBasket(),
      mapper: (_) => unit,
    );
  }
}
