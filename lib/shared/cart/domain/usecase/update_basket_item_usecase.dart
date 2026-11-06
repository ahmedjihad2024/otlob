import 'package:dartz/dartz.dart';
import 'package:otlob/core/network/error_handler/failure.dart';
import 'package:otlob/core/usecase/base.dart';
import 'package:otlob/shared/cart/data/request/update_basket_request.dart';
import 'package:otlob/shared/cart/domain/model/basket_model.dart';
import 'package:otlob/shared/cart/domain/repository/cart_repository_abs.dart';

class UpdateBasketItemUseCase
    implements Base<UpdateBasketRequest, BasketModel> {
  final CartRepositoryAbs _repository;

  UpdateBasketItemUseCase(this._repository);

  @override
  Future<Either<Failure, BasketModel>> execute(UpdateBasketRequest params) {
    return _repository.updateBasketItem(params);
  }
}
